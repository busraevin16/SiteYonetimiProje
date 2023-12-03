package veritabanı;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class baglanma {

    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mysql://data.sobiad.com:3306/kullanicilar?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
        String kullaniciAdi = "root";
        String sifre = "busra12345";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(jdbcUrl, kullaniciAdi, sifre);

            // Kullanıcıdan alınan bilgiler
            int daireno = 5;
            String email = "ornek@email.com";
            String sifree = "kullaniciSifre";

            // SQL sorgusu
            String sorgu = "SELECT * FROM kullanicilar WHERE daireno = ? AND email = ? AND sifre = ?";
            try (PreparedStatement stmt = con.prepareStatement(sorgu)) {
                stmt.setInt(1, daireno);
                stmt.setString(2, email);
                stmt.setString(3, sifree);

                ResultSet rs = stmt.executeQuery();

                // Eğer kullanıcı bilgileri doğru ise giriş başarılı olur
                if (rs.next()) {
                    System.out.println("Başarılı giriş!");
                } else {
                    System.out.println("Başarısız giriş!");
                }
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean girisKontrolu(int daireno, String email, String sifree) {
        String jdbcUrl = "jdbc:mysql://data.sobiad.com:3306/kullanicilar?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
        String kullaniciAdi = "root";
        String sifre = "busra12345";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(jdbcUrl, kullaniciAdi, sifre);

            // SQL sorgusu
            String sorgu = "SELECT * FROM kullanicilar WHERE daireno = ? AND email = ? AND sifre = ?";
            try (PreparedStatement stmt = con.prepareStatement(sorgu)) {
                stmt.setInt(1, daireno);
                stmt.setString(2, email);
                stmt.setString(3, sifree);

                ResultSet rs = stmt.executeQuery();

                // Eğer kullanıcı bilgileri doğru ise giriş başarılı olur
                boolean gecerli = rs.next();

                if (gecerli) {
                    System.out.println("Giriş başarılı!");
                } else {
                    System.out.println("Kullanıcı bulunamadı veya bilgiler yanlış!");
                }

                // Ekstra loglar
                System.out.println("SQL Sorgusu: " + sorgu);
                System.out.println("Daire No: " + daireno);
                System.out.println("Email: " + email);
                System.out.println("Girilen Şifre: " + sifree);
                System.out.println("Giriş Durumu: " + (gecerli ? "Başarılı" : "Başarısız"));

                return gecerli;
            } finally {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
