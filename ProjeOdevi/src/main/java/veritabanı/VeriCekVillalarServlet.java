package veritabanı;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VillariCekServletSayfada")
public class VeriCekVillalarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = null;
        // Toplam villa sayısını tutacak değişken
        int toplamVillaSayisi = 0;
        int doluVillaSayisi = 0;
        int bosVillaSayisi = 0;
        try {
            // Veritabanı bağlantısı
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/kullanicilar";
            String dbUser = "root";
            String dbPassword = "busra12345";
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Villaları tutacak liste
            List<String> villalar = new ArrayList<>();

            // Existing code to fetch villa information
            String selectSql = "SELECT id, daireno, metrekare, KullaniciId, SonDuzenlenmeTarih, dolubos,aidat,bahcemetrek FROM villalar";
            try (PreparedStatement preparedStatement = connection.prepareStatement(selectSql)) {
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    // Existing code to fetch villa information

                    // Get KullaniciId
                    String kullaniciId = resultSet.getString("KullaniciId");

                    // Fetch additional information from "bilgiler" table using a join operation
                    String userInfoSql = "SELECT email, fullname FROM bilgiler WHERE id_bilgi = ?";
                    try (PreparedStatement userInfoStatement = connection.prepareStatement(userInfoSql)) {
                        userInfoStatement.setString(1, kullaniciId);
                        ResultSet userInfoResultSet = userInfoStatement.executeQuery();

                        // Check if there is a matching record in "bilgiler" table
                        if (userInfoResultSet.next()) {
                            String email = userInfoResultSet.getString("email");
                            String fullname = userInfoResultSet.getString("fullname");

                            // Use email and fullname as needed
                            // For example, you can add them to the villaVerisi string
                            String villaVerisi = "ID: " + resultSet.getString("id")
                                    + ", Daire No: " + resultSet.getString("daireno")
                                    + ", Metrekare: " + resultSet.getString("metrekare")
                                    + ", Kullanıcı ID: " + kullaniciId
                                    + ", Dolu/Bos: " + (resultSet.getBoolean("dolubos") ? "Dolu" : "Boş")
                                    + ", Son Düzenlenme Tarihi: " + resultSet.getString("SonDuzenlenmeTarih")
                                    + ", Aidat: " + resultSet.getString("aidat")           
                                    + ", Bahcemk: " + resultSet.getString("bahcemetrek") 
                                    + ", Email: " + email
                                    + ", Fullname: " + fullname;
                                    
                                   
                            if(resultSet.getBoolean("dolubos")== true){
                                doluVillaSayisi++;
                                
                            }else{
                                bosVillaSayisi++;
                            }
                            // Add villaVerisi to the villalar list
                            villalar.add(villaVerisi);
                            // Artır toplam villa sayısı
                            toplamVillaSayisi++;
                        } else {
                            // Handle the case where there is no matching record in "bilgiler" table
                            System.err.println("Dikkat: " + kullaniciId + " kullanıcı ID'sine sahip bir bilgi bulunamadı.");
                        }
                    }
                }
            }

       

            // ... (veri çekme kodları)

            // Villaları request objesine ekleyin
            request.setAttribute("villalar", villalar);
            // Toplam villa sayısını session'a ekle
            request.getSession().setAttribute("toplamVillaSayisi", toplamVillaSayisi);      
            request.getSession().setAttribute("bosVillaSayisi", bosVillaSayisi);   
            request.getSession().setAttribute("doluVillaSayisi", doluVillaSayisi);


            // Forward to the JSP page
            request.getRequestDispatcher("Villalar.jsp").forward(request, response);

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
