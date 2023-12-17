
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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
                        <li class="colorlib-active"><a href="AnaSayfa.jsp">Ana Sayfa</a></li>
                        <li><a href="VillariCekServletSayfada">VİLLALAR</a></li>
                        <li><a href="KisileriCekServletSayfada">SİTE SAKİNLERİ</a></li>
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
        <aside id="colorlib-hero" class="js-fullheight">
            <div class="flexslider js-fullheight">
                <ul class="slides">
                    <li style="background-image: url(images/34.jpg);">
                    <div class="overlay"></div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3 col-md-push-3 col-sm-12 col-xs-12 js-fullheight slider-text">
                                <div class="slider-text-inner">

                                </div>
                            </div>
                        </div>
                    </div>
                    </li>
                    <li style="background-image: url(images/37.jpg);">
                    <div class="overlay"></div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3 col-md-push-3 col-sm-12 col-xs-12 js-fullheight slider-text">
                                <div class="slider-text-inner">

                                </div>
                            </div>
                        </div>
                    </div>
                    </li>
                    <li style="background-image: url(images/30.jpg);">
                    <div class="overlay"></div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3 col-md-push-3 col-sm-12 col-xs-12 js-fullheight slider-text">
                                <div class="slider-text-inner">

                                </div>
                            </div>
                        </div>
                    </div>
                    </li>
                </ul>
            </div>
        </aside>

        <script>
            // Flexslider'ı etkinleştir
            $(document).ready(function () {
                $('.flexslider').flexslider({
                    animation: "slide", // Geçiş animasyonu
                    slideshow: true, // Otomatik geçiş
                    slideshowSpeed: 5000, // Geçiş süresi (milisaniye cinsinden)
                    pauseOnHover: false, // Fare üzerine gelindiğinde geçişi duraklatma
                    directionNav: false, // Yönlendirme okları gösterme
                    controlNav: true // Sayfa kontrol noktalarını gösterme
                });
            });
        </script>


        <div class="colorlib-about">
            <div class="colorlib-narrow-content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="about-img animate-box" data-animate-effect="fadeInLeft" style="background-image: url(images/8.jpg);">
                        </div>
                    </div>
                    <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                        <div class="about-desc">
                            <h3 >Akana Villa Sitesi Yönetimi Sayfasına Hoş Geldiniz</h3>
                            <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country.</p>
                            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="colorlib-work">
            <div class="colorlib-narrow-content">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
                        <h2 >VİLLALAR</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                        <div class="project" style="background-image: url(images/16.jpg);">
                            <div class="desc">
                                <div class="con">
                                    <h3><a href="work.html">Work 01</a></h3>
                                    <span>Building</span>
                                    <p class="icon">
                                        <span><a href="#"><i class="icon-share3"></i></a></span>
                                        <span><a href="#"><i class="icon-eye"></i> 100</a></span>
                                        <span><a href="#"><i class="icon-heart"></i> 49</a></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
                        <div class="project" style="background-image: url(images/15.jpg);">
                            <div class="desc">
                                <div class="con">
                                    <h3><a href="work.html">Work 02</a></h3>
                                    <span>House, Apartment</span>
                                    <p class="icon">
                                        <span><a href="#"><i class="icon-share3"></i></a></span>
                                        <span><a href="#"><i class="icon-eye"></i> 100</a></span>
                                        <span><a href="#"><i class="icon-heart"></i> 49</a></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
                        <div class="project" style="background-image: url(images/14.jpg);">
                            <div class="desc">
                                <div class="con">
                                    <h3><a href="work.html">Work 03</a></h3>
                                    <span>Dining Room</span>
                                    <p class="icon">
                                        <span><a href="#"><i class="icon-share3"></i></a></span>
                                        <span><a href="#"><i class="icon-eye"></i> 100</a></span>
                                        <span><a href="#"><i class="icon-heart"></i> 49</a></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
                        <div class="project" style="background-image: url(images/9.jpg);">
                            <div class="desc">
                                <div class="con">
                                    <h3><a href="work.html">Work 04</a></h3>
                                    <span>House, Building</span>
                                    <p class="icon">
                                        <span><a href="#"><i class="icon-share3"></i></a></span>
                                        <span><a href="#"><i class="icon-eye"></i> 100</a></span>
                                        <span><a href="#"><i class="icon-heart"></i> 49</a></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
                        <div class="project" style="background-image: url(images/19.jpg);">
                            <div class="desc">
                                <div class="con">
                                    <h3><a href="work.html">Work 05</a></h3>
                                    <span>Condo, Pad</span>
                                    <p class="icon">
                                        <span><a href="#"><i class="icon-share3"></i></a></span>
                                        <span><a href="#"><i class="icon-eye"></i> 100</a></span>
                                        <span><a href="#"><i class="icon-heart"></i> 49</a></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                        <div class="project" style="background-image: url(images/28.jpg);">
                            <div class="desc">
                                <div class="con">
                                    <h3><a href="work.html">Work 06</a></h3>
                                    <span>Table, Chairs</span>
                                    <p class="icon">
                                        <span><a href="#"><i class="icon-share3"></i></a></span>
                                        <span><a href="#"><i class="icon-eye"></i> 100</a></span>
                                        <span><a href="#"><i class="icon-heart"></i> 49</a></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

<div id="colorlib-counter" class="colorlib-counters" data-stellar-background-ratio="0.5" style="background-image: url(images/34.jpg);">
    <div class="overlay"></div>
    <div class="colorlib-narrow-content">
        <div class="row">
        </div>
        <div class="row">
            <div class="col-md-3 text-center animate-box">
                <span class="icon"><i class="flaticon-skyline"></i></span>
                <span class="colorlib-counter js-counter" data-from="0" data-to="1539" data-speed="5000" data-refresh-interval="50"></span>
                <span class="colorlib-counter-label">Toplam Villa Sayısı</span>
            </div>
            <div class="col-md-3 text-center animate-box">
                <span class="icon"><i class="flaticon-engineer"></i></span>
                                    <%
                        // Session'dan toplam villa sayısını çek
                        Integer toplamVillaSayisi = (Integer) session.getAttribute("toplamVillaSayisi");

                        // toplamVillaSayisi null kontrolü
                        if (toplamVillaSayisi != null) {
                    %>
                                    <p style="color:white; font-size:26px"><b><%= toplamVillaSayisi %></b> </p>
                    <%
                        } else {
                    %>
                        <p>Toplam villa sayısı bulunamadı.</p>
                    <%
                        }
                    %>

                <span class="colorlib-counter-label">Toplam Villa Sayısı</span>
            </div>
            <div class="col-md-3 text-center animate-box">
                <span class="icon"><i class="flaticon-architect-with-helmet"></i></span>
                                 <%
                        // Session'dan toplam villa sayısını çek
                        Integer doluvillasayisi = (Integer) session.getAttribute("doluVillaSayisi");

                        // toplamVillaSayisi null kontrolü
                        if (doluvillasayisi != null) {
                    %>
                                    <p style="color:white; font-size:26px"><b><%= doluvillasayisi %></b> </p>
                    <%
                        } else {
                    %>
                        <p>Toplam villa sayısı bulunamadı.</p>
                    <%
                        }
                    %>
                <span class="colorlib-counter-label">Dolu Villa Sayısı</span>
            </div>
            <div class="col-md-3 text-center animate-box">
                <span class="icon"><i class="flaticon-worker"></i></span>
                 <%
                        // Session'dan toplam villa sayısını çek
                        Integer bosvillasayisi = (Integer) session.getAttribute("bosVillaSayisi");

                        // toplamVillaSayisi null kontrolü
                        if (bosvillasayisi != null) {
                    %>
                                    <p style="color:white; font-size:26px"><b><%= bosvillasayisi %></b> </p>
                    <%
                        } else {
                    %>
                        <p>Toplam villa sayısı bulunamadı.</p>
                    <%
                        }
                    %>
                <span class="colorlib-counter-label">Boş Villa Sayısı</span>
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


<!-- MAIN JS -->
<script src="js/main.js"></script>

</body>
</html>

