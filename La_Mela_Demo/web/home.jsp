<%-- 
    Document   : HomePage
    Created on : Oct 15, 2022, 11:19:57 AM
    Author     : hp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Home</title>
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
        <div class="slider-area">
            <div class="slider-active owl-carousel">
                <div class="single-slider single-slider-hm1 bg-img ptb-260" style="background-image: url(images/slider1.jpg)">
                    <div class="container">
                        <div class="slider-content slider-content-style-1 slider-animated-1">
                            <h3 class="animated" >New Collection <span>2022.</span></h3>

                            <p class="animated">Amazing Product</p>
                            <a class="btn-hover slider-btn-style animated" href="shop">shop now</a>
                        </div>
                    </div>
                </div>
                <div class="single-slider single-slider-hm1 bg-img slider-content-style-1 ptb-260" style="background-image: url(images/slider3.png)">
                    <div class="container">
                        <div class="slider-content slider-content-style-1 slider-animated-2 slider-text-right">
                            <h3 class="animated">New Collection <span>2022.</span></h3>  
                            <div class="slide-right-pera">
                                <p class="animated">Awesome Feature</p>
                            </div>
                            <a class="btn-hover slider-btn-style animated" href="shop">shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="product-area pb-100">
            <div class="container">
                <div class="section-title text-center mb-35 mt-40">
                    <h2>New Collection</h2>
                    <p>The latest genuine products of 2022</p>
                </div>
                <div class="product-style">
                    <div class="product-tab-list text-center mb-45 nav product-menu-mrg" role="tablist">
                        <a class="active" href="#home1" data-toggle="tab" role="tab" aria-selected="true" aria-controls="home1">
                            <h4>iPhone</h4>
                        </a>
                        <a href="#home2" data-toggle="tab" role="tab" aria-selected="false" aria-controls="home2">
                            <h4>iPad</h4>
                        </a>
                        <a href="#home3" data-toggle="tab" role="tab" aria-selected="false" aria-controls="home3">
                            <h4>Macbook</h4>
                        </a>
                        <a href="#home4" data-toggle="tab" role="tab" aria-selected="false" aria-controls="home4">
                            <h4>Apple Watch</h4>
                        </a>
                    </div>
                    <div class="tab-content jump">
                        <div class="tab-pane active show fade" id="home1" role="tabpanel">
                            <div class="row"> 
                                <div class="product-slider-active owl-carousel">

                                    <c:forEach items="${pCid1}" var="o">     

                                        <div class="col-md-3 col-lg-3 col-sm-4">           
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="detail?ptitle=${o.title}"><img style="width: 250px;height: 200px" src="${o.thumbnail}" alt=""></a>
                                                                                                      
                                                </div>
                                                <div class="product-content">
                                                    <div class="product-title-price">
                                                        <div class="product-title">
                                                            <h4><a href="detail?ptitle=${o.title}">${o.title}</a></h4>
                                                        </div>

                                                    </div>
                                                    <div class="product-cart-categori">
                                                        <div class="product-cart">
                                                            <span>from ${o.price}$</span>
                                                        </div>
                                                        <div class="product-categori">
                                                            <a href="detail?ptitle=${o.title}"><i class="ion-bag"></i>Shopping</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>

                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="home2" role="tabpanel">
                            <div class="row">
                                <div class="product-slider-active owl-carousel">

                                    <c:forEach items="${pCid2}" var="o">

                                        <div class="col-md-3 col-lg-3 col-sm-4">
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="detail?ptitle=${o.title}"><img style="width: 250px;height: 200px" src="${o.thumbnail}" alt=""></a>
                                                    

                                                </div>
                                                <div class="product-content">
                                                    <div class="product-title-price">
                                                        <div class="product-title">
                                                            <h4><a href="detail?ptitle=${o.title}"">${o.title}</a></h4>
                                                        </div>
                                                        <div class="product-price">

                                                        </div>
                                                    </div>
                                                    <div class="product-cart-categori">
                                                        <div class="product-cart">
                                                            <span>from ${o.price}$</span>
                                                        </div>
                                                        <div class="product-categori">
                                                            <a href="detail?ptitle=${o.title}"><i class="ion-bag"></i>Shopping</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="home3" role="tabpanel">
                            <div class="row">
                                <div class="product-slider-active owl-carousel">

                                    <c:forEach items="${pCid3}" var="o">

                                        <div class="col-md-3 col-lg-3 col-sm-4">
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="detail?ptitle=${o.title}"><img style="width: 250px;height: 200px" src="${o.thumbnail}" alt=""></a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="product-title-price">
                                                        <div class="product-title">
                                                            <h4><a href="detail?ptitle=${o.title}">${o.title}</a></h4>
                                                        </div>
                                                        <div class="product-price">

                                                        </div>
                                                    </div>
                                                    <div class="product-cart-categori">
                                                        <div class="product-cart">
                                                            <span>from ${o.price}$</span>
                                                        </div>
                                                        <div class="product-categori">
                                                            <a href="detail?ptitle=${o.title}"><i class="ion-bag"></i>Shopping</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="home4" role="tabpanel">
                            <div class="row">
                                <div class="product-slider-active owl-carousel">

                                    <c:forEach items="${pCid4}" var="o">

                                        <div class="col-md-3 col-lg-3 col-sm-4">
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="detail?ptitle=${o.title}"><img style="width: 250px;height: 200px" src="${o.thumbnail}" alt=""></a>
                                                    

                                                </div>
                                                <div class="product-content">
                                                    <div class="product-title-price">
                                                        <div class="product-title">
                                                            <h4><a href="detail?ptitle=${o.title}">${o.title}</a></h4>
                                                        </div>
                                                        <div class="product-price">

                                                        </div>
                                                    </div>
                                                    <div class="product-cart-categori">
                                                        <div class="product-cart">
                                                            <span>from ${o.price}$</span>
                                                        </div>
                                                        <div class="product-categori">
                                                            <a href="detail?ptitle=${o.title}"><i class="ion-bag"></i>Shopping</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="shop-limited-area bg-img pt-90 pb-100" style="background-image: url(images/slider4.jpg)" data-overlay="3">
            <div class="container">
                <div class="shop-limited-content text-center">
                    <h2>Shop Limited Edition.</h2>
                    <a class="btn-hover limited-btn" href="shop">view more</a>
                </div>
            </div>
        </div>
        
        <div style="margin-top: 30px;padding-bottom: 60px" class="product-area pb-100">
            <div class="container">
                <div class="section-title text-center mb-35 mt-40">
                    <h2>Best Seller Collection</h2>
                    <p>The best seller products of 2022</p>
                </div>
                <div class="product-style">
                    <div class="product-tab-list text-center mb-45 nav product-menu-mrg" role="tablist">
                        <a class="active" href="#home5" data-toggle="tab" role="tab" aria-selected="true" aria-controls="home1">
                            <h4>iPhone</h4>
                        </a>
                        <a href="#home6" data-toggle="tab" role="tab" aria-selected="false" aria-controls="home2">
                            <h4>iPad</h4>
                        </a>
                        <a href="#home7" data-toggle="tab" role="tab" aria-selected="false" aria-controls="home3">
                            <h4>Macbook</h4>
                        </a>
                        <a href="#home8" data-toggle="tab" role="tab" aria-selected="false" aria-controls="home4">
                            <h4>Apple Watch</h4>
                        </a>
                    </div>
                    <div class="tab-content jump">
                        <div class="tab-pane active show fade" id="home5" role="tabpanel">
                            <div class="row"> 
                                <div class="product-slider-active owl-carousel">

                                    <c:forEach items="${bs1}" var="o">     

                                        <div class="col-md-3 col-lg-3 col-sm-4">           
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="detail?ptitle=${o.title}"><img style="width: 250px;height: 200px" src="${o.thumbnail}" alt=""></a>
                                                                                                      
                                                </div>
                                                <div class="product-content">
                                                    <div class="product-title-price">
                                                        <div class="product-title">
                                                            <h4><a href="detail?ptitle=${o.title}">${o.title}</a></h4>
                                                        </div>

                                                    </div>
                                                    <div class="product-cart-categori">
                                                        <div class="product-cart">
                                                            <span>from ${o.price}$</span>
                                                        </div>
                                                        <div class="product-categori">
                                                            <a href="detail?ptitle=${o.title}"><i class="ion-bag"></i>Shopping</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>

                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="home6" role="tabpanel">
                            <div class="row">
                                <div class="product-slider-active owl-carousel">

                                    <c:forEach items="${bs2}" var="o">

                                        <div class="col-md-3 col-lg-3 col-sm-4">
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="detail?ptitle=${o.title}"><img style="width: 250px;height: 200px" src="${o.thumbnail}" alt=""></a>
                                                    

                                                </div>
                                                <div class="product-content">
                                                    <div class="product-title-price">
                                                        <div class="product-title">
                                                            <h4><a href="detail?ptitle=${o.title}"">${o.title}</a></h4>
                                                        </div>
                                                        <div class="product-price">

                                                        </div>
                                                    </div>
                                                    <div class="product-cart-categori">
                                                        <div class="product-cart">
                                                            <span>from ${o.price}$</span>
                                                        </div>
                                                        <div class="product-categori">
                                                            <a href="detail?ptitle=${o.title}"><i class="ion-bag"></i>Shopping</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="home7" role="tabpanel">
                            <div class="row">
                                <div class="product-slider-active owl-carousel">

                                    <c:forEach items="${bs3}" var="o">

                                        <div class="col-md-3 col-lg-3 col-sm-4">
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="detail?ptitle=${o.title}"><img style="width: 250px;height: 200px" src="${o.thumbnail}" alt=""></a>
                                                    

                                                </div>
                                                <div class="product-content">
                                                    <div class="product-title-price">
                                                        <div class="product-title">
                                                            <h4><a href="detail?ptitle=${o.title}">${o.title}</a></h4>
                                                        </div>
                                                        <div class="product-price">

                                                        </div>
                                                    </div>
                                                    <div class="product-cart-categori">
                                                        <div class="product-cart">
                                                            <span>from ${o.price}$</span>
                                                        </div>
                                                        <div class="product-categori">
                                                            <a href="detail?ptitle=${o.title}"><i class="ion-bag"></i>Shopping</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="home8" role="tabpanel">
                            <div class="row">
                                <div class="product-slider-active owl-carousel">

                                    <c:forEach items="${bs4}" var="o">

                                        <div class="col-md-3 col-lg-3 col-sm-4">
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="detail?ptitle=${o.title}"><img style="width: 250px;height: 200px" src="${o.thumbnail}" alt=""></a>
                                                    

                                                </div>
                                                <div class="product-content">
                                                    <div class="product-title-price">
                                                        <div class="product-title">
                                                            <h4><a href="detail?ptitle=${o.title}">${o.title}</a></h4>
                                                        </div>
                                                        <div class="product-price">

                                                        </div>
                                                    </div>
                                                    <div class="product-cart-categori">
                                                        <div class="product-cart">
                                                            <span>from ${o.price}$</span>
                                                        </div>
                                                        <div class="product-categori">
                                                            <a href="detail?ptitle=${o.title}"><i class="ion-bag"></i>Shopping</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="blog-area pb-65">
            <div class="container">
                <div class="section-title text-center mb-55">
                    <h2> Top Stories</h2>
                    <p>Coming to us, you not only get the best experience about Apple products and services, but through our service, you are also the loved ones we cherish the most!.</p>
                    <p>Owner and Founder of La Mela shop Nguyen Tuan Linh</p>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-blog mb-30">
                            <div class="blog-img">
                                <a><img width="330px" height="440px" src="images/buiquangtruong.jpg" alt=""></a>
                            </div>
                            <div class="blog-info">
                                <h3>Bui Quang Truong</h3>
                                <div class="blog-meta">
                                    <ul>
                                        <li>October 13</li>
                                        <li>1 comments</li>
                                    </ul>
                                </div>
                                <p>This shop selling quality products and the price here is cheaper than the common ground but the product is still very good quality!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-blog mb-30">
                            <div class="blog-img">
                                <a><img width="330px" height="440px" src="images/canduykhanh.jpg" alt=""></a>
                            </div>
                            <div class="blog-info">
                                <h3>Can Duy Khanh</a</h3>
                                <div class="blog-meta">
                                    <ul>
                                        <li>October 15</li>
                                        <li>1 comments</li>
                                    </ul>
                                </div>
                                <p>My impression about the store is that the service attitude is very attentive and enthusiastic <3</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-blog mb-30">
                            <div class="blog-img">
                                <a><img width="330px" height="440px" src="images/khanhsp.jpg" alt=""></a>
                            </div>
                            <div class="blog-info">
                                <h3>Dang Dinh Quoc Khanh</h3>
                                <div class="blog-meta">
                                    <ul>
                                        <li>October 17</li>                                      
                                        <li>1 comments</li>
                                    </ul>
                                </div>
                                <p>The store is very big and spacious. There are many products for me to experience!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        <!-- modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span class="ion-android-close" aria-hidden="true"></span>
            </button>
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="qwick-view-left">
                            <div class="quick-view-learg-img">
                                <div class="quick-view-tab-content tab-content">
                                    <div class="tab-pane active show fade" id="modal1" role="tabpanel">
                                        <img src="assets/img/quick-view/l1.jpg" alt="">
                                    </div>
                                    <div class="tab-pane fade" id="modal2" role="tabpanel">
                                        <img src="assets/img/quick-view/l2.jpg" alt="">
                                    </div>
                                    <div class="tab-pane fade" id="modal3" role="tabpanel">
                                        <img src="assets/img/quick-view/l3.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="quick-view-list nav" role="tablist">
                                <a class="active" href="#modal1" data-toggle="tab" role="tab" aria-selected="true" aria-controls="home1">
                                    <img src="assets/img/quick-view/s1.jpg" alt="">
                                </a>
                                <a href="#modal2" data-toggle="tab" role="tab" aria-selected="false" aria-controls="home2">
                                    <img src="assets/img/quick-view/s2.jpg" alt="">
                                </a>
                                <a href="#modal3" data-toggle="tab" role="tab" aria-selected="false" aria-controls="home3">
                                    <img src="assets/img/quick-view/s3.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="qwick-view-right">
                            <div class="qwick-view-content">
                                <h3>Handcrafted Supper Mug</h3>
                                <div class="price">
                                    <span class="new">$90.00</span>
                                    <span class="old">$120.00  </span>
                                </div>
                                <div class="rating-number">
                                    <div class="quick-view-rating">
                                        <i class="ion-ios-star red-star"></i>
                                        <i class="ion-ios-star red-star"></i>
                                        <i class="ion-android-star-outline"></i>
                                        <i class="ion-android-star-outline"></i>
                                        <i class="ion-android-star-outline"></i>
                                    </div>
                                    <div class="quick-view-number">
                                        <span>2 Ratting (S)</span>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do tempor incididun ut labore et dolore magna aliqua. Ut enim ad mi , quis nostrud veniam exercitation .</p>
                                <div class="quick-view-select">
                                    <div class="select-option-part">
                                        <label>Size*</label>
                                        <select class="select">
                                            <option value="">- Please Select -</option>
                                            <option value="">900</option>
                                            <option value="">700</option>
                                        </select>
                                    </div>
                                    <div class="select-option-part">
                                        <label>Color*</label>
                                        <select class="select">
                                            <option value="">- Please Select -</option>
                                            <option value="">orange</option>
                                            <option value="">pink</option>
                                            <option value="">yellow</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="quickview-plus-minus">
                                    <div class="cart-plus-minus">
                                        <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                    </div>
                                    <div class="quickview-btn-cart">
                                        <a class="btn-hover-black" href="#">add to cart</a>
                                    </div>
                                    <div class="quickview-btn-wishlist">
                                        <a class="btn-hover" href="#"><i class="ion-ios-heart-outline"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clickable-mainmenu-btn">
            <a class="clickable-mainmenu-active" href="#"><i class="ion-navicon"></i></a>
        </div>
        <div class="clickable-mainmenu text-center">
            <div class="clickable-mainmenu-icon">
                <button class="clickable-mainmenu-close">
                    <span class="ion-android-close"></span>
                </button>
            </div>
            <div id="menu" class="text-left">
                <ul>
                    <li><a href="home">home</a></li>
                    <li><a href="about-us.html">about us</a></li>
                    <li><a href="shop">shop</a></li>
                    <li><a href="#">pages</a>
                        <ul class="dropdown">
                            <li><a href="about-us.html">about us</a></li>
                            <li><a href="cart.html">cart</a></li>
                            <li><a href="checkout.html">checkout</a></li>
                            <li><a href="wishlist.html">wishlist</a></li>
                            <li><a href="contact.html">contact</a></li>
                            <li><a href="login.jsp">login</a></li>
                            <li><a href="register.jsp">register</a></li>
                        </ul>
                    </li>
                    <li><a href="#">blog</a>
                        <ul class="dropdown">
                            <li><a href="blog.html">blog </a></li>
                            <li><a href="blog-details.html">blog details</a></li>
                        </ul>
                    </li>
                    <li><a href="contact.html">contact</a></li>
                </ul>
            </div>
        </div>
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
    <script src="assets/js/main.js"></script>
</body>
</html>
