<%-- 
    Document   : login
    Created on : Oct 19, 2022, 10:38:24 PM
    Author     : hp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Login</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="images/logoapple.png">

        <!-- all css here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slinky.min.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/bundle.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!-- header start -->

        <!-- Newsletter Popup End -->
        <header>
            <div class="header-area header-area-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-6">
                            <div style="margin-top: 18px" class="logo">
                                <a  href="home"><img width="20%"  src="images/logoapple.png" alt="" /></a>
                            </div>
                        </div>
                        <div class="col-lg-6 menu-none-block menu-center">
                            <div class="main-menu">
                                <nav>
                                    <ul>
                                        <li>                                           
                                            <c:if test="${sessionScope.acc.role_id != 1}">
                                                <a style="color: red">${sessionScope.acc.role.name}</a>
                                            </c:if>                                           
                                        </li>
                                        <c:if test="${sessionScope.acc != null}">
                                            <li><a href="#">Hi ${sessionScope.acc.fullname}!</a></li>
                                            </c:if>
                                        <li><a href="home">home</a></li>                                      
                                        <li><a href="shop">shop</a></li>
                                        <li><a href="show">cart</a></li> 
                                            <c:if test="${sessionScope.acc == null}">
                                            <li><a href="login">Sign In</a></li>
                                            <li><a href="register">Register</a></li>
                                            </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-6">
                            <div class="header-search-cart">
                                <div class="header-search common-style">
                                    <button class="sidebar-trigger-search">
                                        <span class="ion-ios-search-strong"></span>
                                    </button>
                                </div>
                                <div class="header-cart common-style">
                                    <button class="sidebar-trigger">
                                        <a style="color: #111" class="ion-bag" href="show">
                                            <span style="font-size: 12px;font-weight: bold">(${requestScope.size})</span>
                                        </a>
                                    </button>
                                </div>
                                <div class="header-sidebar common-style">
                                    <button class="header-navbar-active">
                                        <span class="ion-navicon"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header end --> 
        <!-- sidebar-cart start -->

        <!-- main-search start -->
        <div class="main-search-active">
            <div class="sidebar-search-icon">
                <button class="search-close"><span class="ion-android-close"></span></button>
            </div>
            <div class="sidebar-search-input">
                <form action="search">
                    <div class="form-search">
                        <input name="txt" id="search" class="input-text" placeholder="Search Entire Store" type="text">
                        <button type="submit">
                            <i class="ion-ios-search-strong"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- main-search start -->
        <div class="cur-lang-acc-active">
            <div class="wrap-sidebar">
                <div class="sidebar-nav-icon">
                    <button class="op-sidebar-close"><span class="ion-android-close"></span></button>
                </div>
                <div class="cur-lang-acc-all">
                    <div class="single-currency-language-account">
                        <div class="cur-lang-acc-title">
                            <h4>Currency: <span>USD </span></h4>
                        </div>
                        <div class="cur-lang-acc-dropdown">

                        </div>
                    </div>
                    <div class="single-currency-language-account">
                        <div class="cur-lang-acc-title">
                            <h4>Language: <span><img src="assets/img/icon-img/english.png" alt=""> English </span></h4>
                        </div>
                        <div class="cur-lang-acc-dropdown">

                        </div>
                    </div>
                    <div class="single-currency-language-account">
                        <div class="cur-lang-acc-title">
                            <c:if test="${sessionScope.acc != null}">
                                <h4>My Account:</h4>
                            </c:if>
                        </div>
                        <div class="cur-lang-acc-dropdown">
                            <ul>    
                                <c:if test="${sessionScope.acc != null}">                                   
                                    <c:set value="${sessionScope.acc.id}" var="id"></c:set>
                                    <li><a href="profileaccount?pid=${id}">My Profile</a></li>
                                    <li><a href="changepassword">Update My Account</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.acc.role_id == 3}">
                                    <li><a href="manageproduct">Manage Product</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.acc.role_id == 2}">
                                    <li><a href="manageaccount">Manage Account</a></li>
                                    <li><a href="manageproduct">Manage Product</a></li>
                                    <li><a href="statistical">Statistical</a></li>
                                    </c:if>


                                <c:if test="${sessionScope.acc == null}">
                                    <li><a href="login">Sign In</a></li>
                                    <li><a href="register">Register</a></li>
                                    </c:if>

                                <c:if test="${sessionScope.acc != null}">
                                    <li><a href="signout">Sign Out</a></li>
                                    </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="breadcrumb-area pt-205 pb-210" style="background-image: url(images/slider6.jpg)">
                <div class="container">
                    <div class="breadcrumb-content">
                        <h2>login</h2>
                        <ul>
                            <li><a href="#">home</a></li>
                            <li> login </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- login-area start -->
            <div class="register-area ptb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-12 col-lg-6 col-xl-6 ml-auto mr-auto">
                            <div class="login">
                                <div class="login-form-container">
                                    <div class="login-form">
                                        <form action="login" method="post">
                                            <div style="text-align: center"><h7 style="color: red">${ms}</h7></div>  
                                            <div style="margin-bottom: 30px"></div>
                                            <input type="text" name="user" value="${cookie.user.value}" placeholder="Username">
                                            <input type="password" name="pass" value="${cookie.pass.value}" placeholder="Password">
                                            <div class="button-box">
                                                <div class="login-toggle-btn">
                                                    <input type="checkbox" checked ${(cookie.crem.value eq 'on')?"checked":""} name="rem" value="on">
                                                    <label>Remember me</label>      
                                                    <a style="margin-top: 1px;margin-right: 20px" href="register">Register</a>
                                                </div>  
                                                <button type="submit" class="default-btn floatright">Login</button>                                              
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- login-area end -->
            <footer class="footer-area gray-bg pt-100 pb-95">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-5 col-12">
                        <div class="footer-widget">
                            <div class="footer-widget-l-content">
                                <h4>10 Years Experience</h4>
                                <ul>
                                    <li><a href="#"><i class="ion-social-twitter"></i></a></li> 
                                    <li><a href="#"><i class="ion-social-tumblr"></i></a></li>
                                    <li><a href="#"><i class="ion-social-facebook"></i></a></li> 
                                    <li><a href="#"><i class="ion-social-instagram-outline"></i></a></li> 
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-7 col-12">
                        <div class="footer-widget">
                            <div class="footer-widget-m-content text-center">
                                <div class="footer-logo">
                                    <a href="home"><img width="13%" src="images/logoapple.png" alt=""></a>
                                </div>
                                <div class="footer-nav">
                                    <nav>
                                        <ul>
                                            <li><a href="home">home</a></li>
                                            <li><a href="#">about us</a></li>
                                            <li><a href="shop">shop </a></li>
                                            <li><a href="#"> blog </a></li>
                                            <li><a href="#">pages </a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <p>The shop was founded in 2012</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-12 col-12">
                        <div class="footer-widget f-right">
                            <div class="footer-widget-r-content">
                                <ul>
                                    <li><span>Phone :</span> 0123 456 789</li>
                                    <li><span>Email : </span> lamela@gmail.com</li>
                                    <li><span>Address :</span> Ha Noi</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        </div>









        <!-- all js here -->
        <script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/slinky.min.js"></script>
        <script src="assets/js/ajax-mail.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script type="text/javascript">
            // grab an element
            var myElement = document.querySelector(".intelligent-header");
            // construct an instance of Headroom, passing the element
            var headroom = new Headroom(myElement);
            // initialise
            headroom.init();
        </script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
