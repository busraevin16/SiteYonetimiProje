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
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author bsra_
 */
@WebServlet("/AylikGiderCekServlet")
public class AylikGiderCekServlet  extends HttpServlet{
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

         

            // Villaları çek
            String selectSql = "SELECT SporSalonu, BahceBakimi, Tadilat FROM giderler";
            try (PreparedStatement preparedStatement = connection.prepareStatement(selectSql)) {
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    String SporSalonu = resultSet.getString("SporSalonu");
                    String BahceBakimi = resultSet.getString("BahceBakimi");
                    String Tadilat = resultSet.getString("Tadilat");

                    request.getSession().setAttribute("SporSalonu", SporSalonu);  
                    request.getSession().setAttribute("BahceBakimi", BahceBakimi); 
                    request.getSession().setAttribute("Tadilat", Tadilat);

                
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
