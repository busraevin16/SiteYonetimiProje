/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veritabanı;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/KullaniciEkleServlet")
public class KullaniciEkleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Formdan alınan bilgileri al
        String dairenoString = request.getParameter("daireno");
        String fullname = request.getParameter("fullname");
        String telefon = request.getParameter("telefon");
        String email = request.getParameter("email");
        String sifre = request.getParameter("password");
        String rol = request.getParameter("rol");

        // Güvenlik önlemleri: Veri doğrulama işlemleri yapılmalıdır.

        // Veritabanına ekleme işlemi
        try {
            // Veritabanına bağlan
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/kullanicilar"; // Veritabanı URL'sini güncelleyin
            String dbUser = "root"; // Veritabanı kullanıcı adınızı güncelleyin
            String dbPassword = "busra12345"; // Veritabanı şifrenizi güncelleyin
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String sql = "INSERT INTO bilgiler (daireno, fullname, telefon, email, sifre, rol) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, dairenoString);
            preparedStatement.setString(2, fullname);
            preparedStatement.setString(3, telefon);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, sifre);
            preparedStatement.setString(6, rol);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("KullaniciEkle.jsp");
                response.getWriter().println("Kullanıcı Başarıyla Eklendi");
            } else {
                response.getWriter().println("Kullanıcı eklenirken bir hata oluştu.");
            }

            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Veritabanı hatası: " + e.getMessage());
        }
    }
}

