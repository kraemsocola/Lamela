f<%-- 
    Document   : shop-grid-view-5-col
    Created on : Oct 18, 2022, 12:43:07 PM
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
        <title>Shop</title>
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
        <div class="breadcrumb-area pt-205 pb-210 bg-img" style="background-image: url(images/slider7.jpg)">
            <div class="container">
                <div class="breadcrumb-content">
                    <h2>shop</h2>
                    <ul>
                        <li><a href="home">home</a></li>
                        <li> shop </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="shop-page-wrapper hidden-items padding-filter">
            <div class="container-fluid">
                <div style="margin-top: 7px" class="shop-filters-left">
                    <div  class="shop-sidebar">
                        <div class="sidebar-widget mb-50">
                            <h3 class="sidebar-title">Search Products</h3>
                            <div class="sidebar-search">




                                <form action="search">
                                    <input placeholder="Search Products..." name="txt" type="text">
                                    <button type="submit"><i class="ion-ios-search-strong"></i></button>
                                </form>
                            </div>
                        </div>
                        <div class="sidebar-widget mb-40">
                            <h3 class="sidebar-title">Filter by Price </h3>
                            <div class="price_filter">
                                <div id="slider-range"></div>
                                <div class="price_slider_amount">
                                    <form action="sort">
                                        <div class="label-input">
                                            <label>price : </label>
                                            <input type="text" id="amount" name="price" placeholder="Add Your Price" />             
                                        </div>                                       
                                        <input type="submit" value="Filter">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar-widget mb-45">
                            <h3 class="sidebar-title">Categories</h3>
                            <div class="sidebar-categories">
                                <ul>
                                    <li><a href="category?cid=0">All</a></li>
                                        <c:forEach items="${data}" var="d">
                                        <li><a href="category?cid=${d.id}">${d.name}</a></li>
                                        </c:forEach>                                      
                                </ul>
                            </div>
                        </div>                                                   

                    </div>
                </div>
                <div class="shop-filters-right">
                    <div class="shop-bar-area pb-60">
                        <div class="shop-bar">
                            <div class="shop-found-selector">
                                <div style="margin-top: 9.5px" class="shop-found">
                                    <p><span>${title.size()}</span> Product Found of <span>${list.size()}</span></p>
                                </div>
                                <div class="shop-selector">
                                    <form  action="sortby" method="doGet">
                                        <label>Sort By : </label>
                                        <select name="select">
                                            <option value="0">Default</option>
                                            <option value="1">A to Z</option>
                                            <option value="2">Z to A</option>
                                            <option value="4">High to Low</option>
                                            <option value="3">Low to High</option>
                                        </select>
                                        <label><input style="padding-right: 9px;margin-left: 10px;margin-top: 3px" type="submit" value="Sort"></label>
                                    </form>
                                </div>
                            </div>
                            <div class="shop-filter-tab">
                                <div style="margin-top: 11px" class="shop-filter">
                                    <a class="shop-filter-active" href="#">Filters <i class="ion-android-options"></i></a>
                                </div>
                                <div style="margin-top: 11px" class="shop-tab nav" role=tablist>
                                    <a class="active" href="#grid-5-col1" data-toggle="tab" role="tab" aria-selected="false">
                                        <i class="ion-android-apps"></i>
                                    </a>
                                    <a href="#grid-5-col2" data-toggle="tab" role="tab" aria-selected="true">
                                        <i class="ion-android-menu"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shop-product-content tab-content">
                        <div id="grid-5-col1" class="tab-pane fade active show">
                            <div class="row custom-row">
                                
                                <c:if test="${title.size()==0}">
                                    <h5 style="text-align: center;margin-left: 50px">No Product<h5>
                                </c:if>
                                
                                <c:forEach items="${title}" var="l">
                                    <div class="custom-col-5 custom-col-style">
                                        <div class="single-product mb-35">
                                            <div class="product-img">
                                                <a href="detail?ptitle=${l.title}"><img width="400px" height="220px" src="${l.thumbnail}" alt=""></a>
                                                <div class="product-action">                                                   
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <div class="product-title-price">
                                                    <div class="product-title">
                                                        <h4><a href="detail?ptitle=${l.title}">${l.title}</a></h4>
                                                    </div>
                                                    <div class="product-price">
                                                        <span></span>
                                                    </div>
                                                </div>
                                                <div class="product-cart-categori">
                                                    <div class="product-cart">
                                                        <span>from ${l.price}$</span>
                                                    </div>
                                                    <div class="product-categori">
                                                        <a href="detail?ptitle=${l.title}><i class="ion-bag"></i>Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="grid-5-col2" class="tab-pane fade">
                            <div class="row">
                                <c:forEach items="${title}" var="l">
                                    <div class="col-md-12 col-lg-12 col-xl-6">
                                        <div class="single-product single-product-list product-list-right-pr mb-40">
                                            <div class="product-img list-img-width">
                                                <a href="detail?ptitle=${l.title}"><img width="400px" height="220px" src="${l.thumbnail}" alt=""></a>
                                                <div class="product-action">

                                                </div>
                                            </div>
                                            <div class="product-content-list">
                                                <div class="product-list-info">
                                                    <h4><a href="detail?ptitle=${l.title}">${l.title}</a></h4>
                                                    <span>from ${l.price}$</span>
                                                    <p>${l.description}</p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <c:set var="page" value="${requestScope.page}"/>
                    <div style="text-align: right;margin-bottom: 10px">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a style="background: #EBEBEB;padding: 10px" href="shop?page=${i}">${i}</a>
                        </c:forEach>
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
