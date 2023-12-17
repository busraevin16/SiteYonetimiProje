/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
/**
 *
 * @author bsra_
 */
@WebServlet("/AylikGiderServlet")
public class AylikGiderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Formdan alınan bilgileri al
        String SporGider = request.getParameter("SporGider");
        String tamirat = request.getParameter("tamirat");
        String bahcem = request.getParameter("bahcem");
       

        // Veritabanına bağlan
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/kullanicilar";
            String dbUser = "root";
            String dbPassword = "busra12345";
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

         
                // Diğer işlemler devam eder...

                // Devam eden işlem: Benzersiz kontrol başarılı, ekleme işlemine devam et
                String insertSql = "INSERT INTO giderler (SporSalonu, BahceBakimi, Tadilat) VALUES (?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertSql)) {
                    preparedStatement.setString(1, SporGider);
                    preparedStatement.setString(2, bahcem);
                    preparedStatement.setString(3, tamirat);
                    

                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        request.setAttribute("successMessage", "Gider Başarıyla Eklendi");
                    } else {
                        request.setAttribute("errorMessage", "Gider eklenirken bir hata oluştu.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Veritabanı hatası: " + e.getMessage());
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
