<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
                                                            <li ><a href="AnaSayfa.jsp">Ana Sayfa</a></li>
                                                            <li><a href="VillariCekServletSayfada">VİLLALAR</a></li>
                                                            <li><a href="Hakkimizda.jsp">HAKKIMIZDA</a></li>
                                                            <li class="colorlib-active"><a href="Iletisim.jsp">İLETİŞİM</a></li>
                                                        </ul>
                                                    </nav>

                                                    <div class="colorlib-footer">
                                                        <p>

                                                               <%
                                                                // Kullanıcı bilgilerini session'dan çek
                                                                Integer kullaniciDaireNo = (Integer) session.getAttribute("kullaniciDaireNo");
                                                                String kullaniciEmail = (String) session.getAttribute("kullaniciEmail");
                                                                String telefon = (String) session.getAttribute("kullaniciTelefon");
                                                                String fullnameee = (String) session.getAttribute("kullaniciFullname");
                                                                String rol = (String) session.getAttribute("kullaniciRol");
                                                                Integer aidatttt = (Integer) session.getAttribute("kullaniciAidatFiyati");
                                                                Integer kullanicimetre2 = (Integer) session.getAttribute("kullanicimetrekare");
                                                                 double aidatim = (kullanicimetre2 * aidatttt) / 12;
                                                                
                                                                // Diğer bilgileri de çekmek istiyorsanız aynı şekilde devam edebilirsiniz.
                                                                // Bilgilerin kontrolü
                                                                if (kullaniciDaireNo != null && kullaniciEmail != null) {
                                                            %>
                                                            <!-- Bilgiler varsa, bilgileri görüntüle -->
                                                        <p>Kullanıcı Daire No: <%= kullaniciDaireNo%></p>
                                                        <p>Kullanıcı Email: <%= kullaniciEmail%></p>
                                                        <p>Telefon: <%= telefon%></p>
                                                        <p>Ad Soyad: <%= fullnameee%></p>
                                                        <p>Aylık Aidat: <%= aidatim%>  TL</p>


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

                                                <div id="colorlib-main">
                                                    <div class="colorlib-contact">
                                                        <div class="colorlib-narrow-content">
                                                            <div class="row">
                                                                <div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
                                                                    <h2 class="colorlib-heading">İLETİŞİM</h2>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <!-- Resim Sağ Tarafta -->
                                                                <div class="col-md-6">
                                                                    <div class="about-img animate-box" data-animate-effect="fadeInRight" style="background-image: url(images/18.jpg);"></div>
                                                                </div>
                                                                <!-- Resim Sağ Tarafta Sonu -->

                                                                <!-- Form ve Bilgiler Sol Tarafta -->
                                                                <div class="col-md-6">
                                                                    <div class="row">
                                                                        <h2 class="colorlib-heading">BİZİMLE İLETİŞİME GEÇ</h2>
                                                                        <!-- Form Sol Tarafta -->
                                                                        <div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInRight">
                                                                            <form action="">
                                                                                <form action="">
                                                                                    <div class="form-group">
                                                                                        <input type="text" class="form-control" placeholder="İsim">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <input type="text" class="form-control" placeholder="Email">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <input type="text" class="form-control" placeholder="Konu">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <textarea name="" id="message" cols="30" rows="7" class="form-control" placeholder="Mesaj"></textarea>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <input type="submit" class="btn btn-primary btn-send-message" value="Gönder">
                                                                                    </div>
                                                                                </form>
                                                                            </form>
                                                                        </div>
                                                                        <!-- Form Sol Tarafta Sonu -->
                                                                    </div>
                                                                </div>
                                                                <!-- Form ve Bilgiler Sol Tarafta Sonu -->
                                                            </div>

                                                            <!-- Bilgiler Sağ Tarafta -->
                                                            <div class="row">
                                                                <h2 class="colorlib-heading">İLETİŞİM BİLGİLERİ</h2>
                                                                <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                                                                    <div class="about-desc">
                                                                        <div class="colorlib-feature colorlib-feature-sm animate-box" data-animate-effect="fadeInLeft">
                                                                            <div class="colorlib-icon">
                                                                                <i class="icon-globe-outline"></i>
                                                                            </div>
                                                                            <div class="colorlib-text">
                                                                                <p><a href="#">bsra_evn52@hotmail.com</a></p>
                                                                            </div>
                                                                        </div>

                                                                        <div class="colorlib-feature colorlib-feature-sm animate-box" data-animate-effect="fadeInLeft">
                                                                            <div class="colorlib-icon">
                                                                                <i class="icon-map"></i>
                                                                            </div>
                                                                            <div class="colorlib-text">
                                                                                <p>Ostim, 100. Yıl Blv 55/F, 06374 Ostim Osb/Yenimahalle/Ankara</p>
                                                                            </div>
                                                                        </div>

                                                                        <div class="colorlib-feature colorlib-feature-sm animate-box" data-animate-effect="fadeInLeft">
                                                                            <div class="colorlib-icon">
                                                                                <i class="icon-phone"></i>
                                                                            </div>
                                                                            <div class="colorlib-text">
                                                                                <p><a href="tel://">+5555555</a></p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- Resim Sağ Tarafta -->
                                                                <div class="col-md-6">
                                                                    <div class="about-img animate-box" data-animate-effect="fadeInRight" style="background-image: url(images/16.jpg);"></div>
                                                                </div>
                                                                <!-- Resim Sağ Tarafta Sonu -->
                                                            </div>
                                                            <!-- Bilgiler Sağ Tarafta Sonu -->


                                                        </div>
                                                    </div>
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
                                            <!-- Google Map -->
                                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
                                            <script src="js/google_map.js"></script>
                                            <!-- MAIN JS -->
                                            <script src="js/main.js"></script>
                                            </body>
                                            </html>
