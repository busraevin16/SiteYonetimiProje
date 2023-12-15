package veritabanı;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VillariCekServlet")
public class VeriCekServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = null;

        try {
            // Veritabanı bağlantısı
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/kullanicilar";
            String dbUser = "root";
            String dbPassword = "busra12345";
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Villaları tutacak liste
            List<String> villalar = new ArrayList<>();

            // Villaları çek
            String selectSql = "SELECT id, daireno, metrekare, KullaniciId, SonDuzenlenmeTarih, dolubos, aidat, bahcemetrek FROM villalar";
            try (PreparedStatement preparedStatement = connection.prepareStatement(selectSql)) {
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    String id = resultSet.getString("id");
                    String daireno = resultSet.getString("daireno");
                    String metrekare = resultSet.getString("metrekare");
                    String kullanicid = resultSet.getString("KullaniciId");
                    String sonDuzenlenmeTarih = resultSet.getString("SonDuzenlenmeTarih");
                    boolean doluBos = resultSet.getBoolean("dolubos");
                    String aidat = resultSet.getString("aidat");
                    String bahcemetre = resultSet.getString("bahcemetrek");


                    if (daireno == null) {
                        // Eğer daireno null ise, hatayı konsola yazdır ve devam etme
                        System.err.println("Dikkat: " + id + " numaralı villanın daireno değeri null.");
                        continue;
                    }
                    // Villayı bilgilerini oluştur
                    String villaVerisi = "ID: " + id + ", " + daireno + ", Metrekare: " + metrekare
                            + ", Kullanıcı ID: " + kullanicid + ", Dolu/Bos: " + (doluBos ? "Dolu" : "Boş")
                            + ", Son Düzenlenme Tarihi: " + sonDuzenlenmeTarih + ", Aidat: " + aidat+ ", Bahce: " + bahcemetre;

                    villalar.add(villaVerisi);
                }
            }

            // JSP sayfasına villaları ileten bir attribute ekle
            request.setAttribute("villalar", villalar);

            // Forward to the JSP page
            request.getRequestDispatcher("VillaEkle.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Veritabanı hatası: " + e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
