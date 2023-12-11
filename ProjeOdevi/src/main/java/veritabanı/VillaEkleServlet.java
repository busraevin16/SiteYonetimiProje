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

@WebServlet("/VillaEkleServlet")
public class VillaEkleServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Formdan alınan bilgileri al
        String id = request.getParameter("id");
        String daireno = request.getParameter("daireno");
        String doluBosString = request.getParameter("DoluBos");
        String metrekare = request.getParameter("metrekare");
        String tarih = request.getParameter("sonDuzenlenmeTarih");

        // Kullanıcı ID'sini formdan al
        String kullaniciId = request.getParameter("KullaniciId");

        // Veritabanına bağlan
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/kullanicilar";
            String dbUser = "root";
            String dbPassword = "busra12345";
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Tarih bilgisi varsa güncelleme işlemine devam et
            if (tarih != null && !tarih.isEmpty()) {

                int dolubosdeger = Integer.parseInt(doluBosString);
                String updateSql = "UPDATE villalar SET daireno = ?, dolubos = ?, metrekare = ?, KullaniciId = ? WHERE id = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(updateSql)) {
                    preparedStatement.setString(1, daireno);
                    preparedStatement.setInt(2, dolubosdeger);  // 1: true, 0: false
                    preparedStatement.setString(3, metrekare);
                    preparedStatement.setString(4, kullaniciId);
                    preparedStatement.setString(5, id);

                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        request.setAttribute("successMessage", "Villa Başarıyla Güncellendi");
                    } else {
                        request.setAttribute("errorMessage", "Villa güncellenirken bir hata oluştu. Belirtilen id bulunamadı veya değer uygun değil.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Veritabanı hatası: " + e.getMessage());
                }

            } else {
                // Diğer işlemler
                if (doluBosString != null && metrekare != null && !doluBosString.isEmpty()) {
                    // Benzersiz "daireno" kontrolü ekleyin
                    int dolubosdeger = Integer.parseInt(doluBosString);
                    String uniqueCheckSql = "SELECT COUNT(*) FROM villalar WHERE daireno = ?";
                    try (PreparedStatement uniqueCheckStatement = connection.prepareStatement(uniqueCheckSql)) {
                        uniqueCheckStatement.setString(1, daireno);
                        ResultSet resultSet = uniqueCheckStatement.executeQuery();
                        resultSet.next();
                        int existingCount = resultSet.getInt(1);

                        if (existingCount > 0) {
                            request.setAttribute("errorMessage", "Bu Villa Zaten Kayıtlı");
                        } else {
                            // Devam eden işlem: Benzersiz kontrol başarılı, ekleme işlemine devam et
                            String insertSql = "INSERT INTO villalar (daireno, dolubos, metrekare, KullaniciId) VALUES (?, ?, ?, ?)";
                            try (PreparedStatement preparedStatement = connection.prepareStatement(insertSql)) {
                                preparedStatement.setString(1, daireno);
                                 preparedStatement.setInt(2, dolubosdeger);
                                preparedStatement.setString(3, metrekare);
                                preparedStatement.setString(4, kullaniciId);

                                int rowsAffected = preparedStatement.executeUpdate();

                                if (rowsAffected > 0) {
                                    request.setAttribute("successMessage", "Villa Başarıyla Eklendi");
                                } else {
                                    request.setAttribute("errorMessage", "Villa eklenirken bir hata oluştu.");
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                                request.setAttribute("errorMessage", "Veritabanı hatası: " + e.getMessage());
                            }
                        }
                    }
                } else {
                    // Delete operation
                    String deleteSql = "DELETE FROM villalar WHERE id = ?";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(deleteSql)) {
                        preparedStatement.setString(1, id);

                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            request.setAttribute("successMessage", "Villa Başarıyla Silindi");
                        } else {
                            request.setAttribute("errorMessage", "Villa silinirken bir hata oluştu. Belirtilen daire bulunamadı.");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        request.setAttribute("errorMessage", "Veritabanı hatası: " + e.getMessage());
                    }
                }
            }

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
