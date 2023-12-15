<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Balay Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

        <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">

            <!-- Animate.css -->
            <link rel="stylesheet" href="css/animate.css">
                <!-- Icomoon Icon Fonts-->
                <link rel="stylesheet" href="css/icomoon.css">
                    <!-- Bootstrap  -->
                    <link rel="stylesheet" href="css/bootstrap.css">
                        <!-- Flexslider  -->
                        <link rel="stylesheet" href="css/flexslider.css">
                            <!-- Flaticons  -->
                            <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
                                <!-- Owl Carousel -->
                                <link rel="stylesheet" href="css/owl.carousel.min.css">
                                    <link rel="stylesheet" href="css/owl.theme.default.min.css">
                                        <!-- Theme style  -->
                                        <link rel="stylesheet" href="css/style.css">

                                            <!-- Modernizr JS -->
                                            <script src="js/modernizr-2.6.2.min.js"></script>
                                            <!-- FOR IE9 below -->
                                            <!--[if lt IE 9]>
                                            <script src="js/respond.min.js"></script>
                                            <![endif]-->

                                            </head>
                                            <body>
                                            <div id="colorlib-page">
                                                <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
                                                <aside id="colorlib-aside" role="complementary" class="border js-fullheight">
                                                    <h1 id="colorlib-logo"><a href="index.html">Balay</a></h1>
                                                    <nav id="colorlib-main-menu" role="navigation">
                                                        <ul>
                                                            <li><a href="AnaSayfa.jsp">Ana Sayfa</a></li>
                                                            <li class="colorlib-active"><a href="VillariCekServletSayfada">VİLLALAR</a></li>
                                                            <li><a href="Hakkimizda.jsp">HAKKIMIZDA</a></li>
                                                            <li><a href="Iletisim.jsp">İLETİŞİM</a></li>
                                                        </ul>
                                                    </nav>

                                                    <div class="colorlib-footer">
                                                        <p>

                                                            <%
                                                                // Kullanıcı bilgilerini session'dan çek
                                                                Integer kullaniciDaireNo = (Integer) session.getAttribute("kullaniciDaireNo");
                                                                String kullaniciEmail = (String) session.getAttribute("kullaniciEmail");
                                                                String telefon = (String) session.getAttribute("kullaniciTelefon");
                                                                String isim = (String) session.getAttribute("kullaniciFullname");
                                                                String rol = (String) session.getAttribute("kullaniciRol");
                                                                // Diğer bilgileri de çekmek istiyorsanız aynı şekilde devam edebilirsiniz.

                                                                // Bilgilerin kontrolü
                                                                if (kullaniciDaireNo != null && kullaniciEmail != null) {
                                                            %>
                                                            <!-- Bilgiler varsa, bilgileri görüntüle -->
                                                        <p>Kullanıcı Daire No: <%= kullaniciDaireNo%></p>
                                                        <p>Kullanıcı Email: <%= kullaniciEmail%></p>
                                                        <p>Telefon: <%= telefon%></p>
                                                        <p>Ad Soyad: <%= isim%></p>
                                                        <p>Rol: <%= rol%></p>
                                                        <%
                                                        } else {
                                                        %>
                                                        <!-- Bilgiler yoksa, null yaz -->
                                                        <p>Bilgiler bulunamadı.</p>
                                                        <%
                                                            }
                                                        %>

                                                        </p>
                                                        <ul>
                                                            <li><a href="#"><i class="icon-facebook2"></i></a></li>
                                                            <li><a href="#"><i class="icon-twitter2"></i></a></li>
                                                            <li><a href="#"><i class="icon-instagram"></i></a></li>
                                                            <li><a href="#"><i class="icon-linkedin2"></i></a></li>
                                                        </ul>
                                                    </div>

                                                </aside>


                                                <div id="colorlib-main" style="heigth:900%">
                                                    <div class="colorlib-work">
                                                        <div class="colorlib-narrow-content">
                                                            <div class="row">
                                                                <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
                                                                    <span class="heading-meta">AKANA</span>
                                                                    <h2 class="colorlib-heading">Villalar</h2>
                                                                </div>
                                                            </div>
                                                            <div class="row row-bottom-padded-md">


                                                                <%
                                                                    List<String> villalar = (List<String>) request.getAttribute("villalar");
                                                                    if (villalar != null && !villalar.isEmpty()) {
                                                                        for (String villa : villalar) {
                                                                            String[] villaBilgileri = villa.split(", ");
                                                                            String id = villaBilgileri[0].substring(3);
                                                                            String daireno = villaBilgileri[1].trim();
                                                                            String metrekare = villaBilgileri[2].substring(10).trim();
                                                                            String kullanicid = villaBilgileri[3].substring(14);
                                                                            String doluBos = villaBilgileri[4].substring(10);
                                                                            String sonDuzenlenmeTarih = villaBilgileri[5].substring(19);
                                                                            String aidatimiz = villaBilgileri[6].substring(6).trim();                                                                  
                                                                            String bahcemetrekare = villaBilgileri[7].substring(8).trim(); // İndeks 6 (sıfır tabanlı)
                                                                            String email = villaBilgileri[8].substring(8).trim();
                                                                            String fullname = villaBilgileri[9].substring(10).trim();

                                                                            if (!aidatimiz.isEmpty()) {
                                                                                int m2fiyat = Integer.parseInt(aidatimiz);
                                                                                int mkare = Integer.parseInt(metrekare);
                                                                                double aidat = (mkare * m2fiyat) / 12;

// Geri kalan HTML kodları buraya eklenecek
%>
                                                                <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft" id="<%= id%>">
                                                                    <div class="project" style="background-image: url(images/img-1.jpg);">
                                                                        <div class="desc">
                                                                            <div class="con">
                                                                                <h3><a href="" data-userid=""><%= fullname%></a></h3>
                                                                                <span>Villa No: <%= daireno%></span>

                                                                                <p class="icon">
                                                                                    <span><a href="#">Dolu & Bos: <%= doluBos%></a></span>
                                                                                    <span><a href="#"><i class="icon-eye"></i>Metrekare: <%= metrekare%></a></span>
                                                                                    <span><a href="#"><i class="icon-eye"></i>Aidat: <%= aidat%> TL</a></span>
                                                                                     <span><a href="#"><i class="icon-eye"></i>Bahçe M2: <%= bahcemetrekare%></a></span></br></br>
                                                                                    <span><a href="#"><i class="icon-heart"></i>Son Düzenlenme Tarihi: <%= sonDuzenlenmeTarih%></a></span>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <%
                                                                        }
                                                                    }
                                                                } else {
                                                                %>
                                                                <div>
                                                                    Veri çekme işlemi başarısız oldu.
                                                                </div>
                                                                <%
                                                                    }
                                                                %>















                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%
                                                        if (villalar
                                                                != null && !villalar.isEmpty()) {
                                                            for (String villa : villalar) {
                                                                String[] villaBilgileri = villa.split(", ");
                                                                for (String bilgi : villaBilgileri) {
                                                                    out.println(bilgi + "<br>");
                                                                }
                                                                out.println("<hr>");
                                                            }
                                                        } else {
                                                            out.println("Hata! Veri çekme işlemi başarısız oldu.");
                                                        }
                                                    %>


                                                </div>
                                            </div>

                                            <!-- jQuery -->
                                            <script src="js/jquery.min.js"></script>
                                            <!-- jQuery Easing -->
                                            <script src="js/jquery.easing.1.3.js"></script>
                                            <!-- Bootstrap -->
                                            <script src="js/bootstrap.min.js"></script>
                                            <!-- Waypoints -->
                                            <script src="js/jquery.waypoints.min.js"></script>
                                            <!-- Flexslider -->
                                            <script src="js/jquery.flexslider-min.js"></script>
                                            <!-- Sticky Kit -->
                                            <script src="js/sticky-kit.min.js"></script>
                                            <!-- Owl carousel -->
                                            <script src="js/owl.carousel.min.js"></script>
                                            <!-- Counters -->
                                            <script src="js/jquery.countTo.js"></script>


                                            <!-- MAIN JS -->
                                            <script src="js/main.js"></script>

                                            </body>
                                            </html>



