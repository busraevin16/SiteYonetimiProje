package veritabanı;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/SiteSakinleriCekServlet")
public class SiteSakinleriCekServlet extends HttpServlet {

    String jdbcUrl = "jdbc:mysql://localhost:3306/kullanicilar";
    String kullaniciAdi = "root";
    String sifre = "busra12345";

    public List<UserBean> getkullanicilar() {
        List<UserBean> residentList = new ArrayList<>();
        
        Connection connection = null;
        ResultSet resultSet = null;

        try {
            // JDBC sürücüsünü yükleme
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Veritabanına bağlanma
            connection = DriverManager.getConnection(jdbcUrl, kullaniciAdi, sifre);

            // SQL sorgusu
            String sql = "SELECT * FROM user WHERE apartment_id = 1";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                // SQL sorgusunu çalıştırma
                resultSet = preparedStatement.executeQuery();

                // Sonuçları işleme
                while (resultSet.next()) {
                    UserBean userBean = new UserBean();
                    userBean.setemail(resultSet.getString("email"));
                    userBean.settelefon(resultSet.getString("telefon"));
                    userBean.setapartment_id(resultSet.getString("apartment_id"));
                    userBean.setsifre(resultSet.getString("sifre"));
                    userBean.setdaireno(resultSet.getString("daireno"));
                    residentList.add(userBean);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                // Kaynakları serbest bırakma
                if (resultSet != null) resultSet.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return residentList;
    }
}
