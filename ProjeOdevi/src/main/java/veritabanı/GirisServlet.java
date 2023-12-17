package veritabanı;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/veritabanı.GirisServlet")
public class GirisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Formdan alınan bilgileri al
        String dairenoString = request.getParameter("daireno");
        String email = request.getParameter("email");
        String sifre = request.getParameter("password");  

        // Gelen bilgilerin null kontrolü
        if (dairenoString == null || email == null || sifre == null) {
            // Eğer gelen bilgilerden biri null ise, bilgilerNull.jsp sayfasına yönlendir
            request.getRequestDispatcher("bilgilerNull.jsp").forward(request, response);
            return;
        }

        // Daireno'yu String'ten tamsayıya çevir
        int daireno = Integer.parseInt(dairenoString);

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Veritabanına bağlan
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/kullanicilar"; // Veritabanı URL'sini güncelleyin
            String dbUser = "root"; // Veritabanı kullanıcı adınızı güncelleyin
            String dbPassword = "busra12345"; // Veritabanı şifrenizi güncelleyin
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL sorgusunu hazırla
            String sql = "SELECT * FROM bilgiler WHERE daireno = ? AND email = ? AND sifre = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, daireno);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, sifre);

            // Sorguyu çalıştır ve sonucu al
            resultSet = preparedStatement.executeQuery();

            // Giriş kontrolü yap
            boolean girisBasarili = resultSet.next();

            if (girisBasarili) {
                // Başarılı giriş durumunda kullanıcı bilgilerini session'a ekle
                request.getSession().setAttribute("kullaniciDaireNo", daireno);
                request.getSession().setAttribute("kullaniciEmail", email);

                // Kullanıcının diğer bilgilerini veritabanından çek
                String telefon = resultSet.getString("telefon");
                String fullname = resultSet.getString("fullname");
                String rol = resultSet.getString("rol");
                int idBilgi = resultSet.getInt("id_bilgi");

                // Session'a diğer bilgileri ekle
                request.getSession().setAttribute("kullaniciTelefon", telefon);
                request.getSession().setAttribute("kullaniciFullname", fullname);
                request.getSession().setAttribute("kullaniciRol", rol);
                request.getSession().setAttribute("kullaniciIdBilgi", idBilgi);

                // Session süresini 1 saat (60 dakika * 60 saniye) olarak ayarla
                request.getSession().setMaxInactiveInterval(60 * 60);

                // Aidat fiyatını çekmek için SQL sorgusunu hazırla
                String aidatSql = "SELECT * FROM villalar WHERE KullaniciId = ?";
                try (PreparedStatement aidatStatement = connection.prepareStatement(aidatSql)) {
                    aidatStatement.setInt(1, idBilgi);

                    // Aidat sorgusunu çalıştır ve sonucu al
                    ResultSet aidatResultSet = aidatStatement.executeQuery();

                    if (aidatResultSet.next()) {
                        // Aidat bilgisini çek
                        int aidatFiyati = aidatResultSet.getInt("aidat");
                        int metrekare = aidatResultSet.getInt("metrekare");

                        // Session'a aidat bilgisini ekle
                        request.getSession().setAttribute("kullaniciAidatFiyati", aidatFiyati);  
                        request.getSession().setAttribute("kullanicimetrekare", metrekare);

                        // ... (diğer işlemler)
                    }
                } catch (SQLException e) {
                    e.printStackTrace(); // Hata durumunda konsola hata mesajını yazdır
                }

                // Kullanıcının rolüne bağlı olarak yönlendirme yap
                if ("Admin".equals(rol)) {
                    // Admin olarak giriş yaptıysa AdminPaneli.jsp sayfasına yönlendir
                    response.sendRedirect("AdminPaneli.jsp");
                } else {
                    // Diğer kullanıcılar için AnaSayfa.jsp sayfasına yönlendir
                    response.sendRedirect("AnaSayfa.jsp");
                }

            } else {
                // Başarısız giriş durumunda mesaj ekleyerek yönlendirilecek sayfaya bilgi gönder
                request.setAttribute("mesaj", "Başarısız giriş! Lütfen bilgilerinizi kontrol edin.");
                request.getRequestDispatcher("basarisiz-giris.jsp").forward(request, response);
                System.out.println("Başarısız giriş!"); // Konsola mesaj yazdır
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Hata durumunda konsola hata mesajını yazdır

            // HTTP yanıtına yazı eklemek için PrintWriter kullanma
            try {
                response.getWriter().println("SQL Hatası: " + e.getMessage());
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        } finally {
            // Bağlantı, preparedStatement ve resultSet'i kapat
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
