<%-- 
    Document   : product-details
    Created on : Oct 18, 2022, 12:07:29 PM
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
        <title>Detail</title>
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
        <div class="breadcrumb-area bg-img border-top-1 pt-55">
            <div class="container">
                <div class="breadcrumb-content-2">
                    <ul>
                        <li><a class="active" href="home">home</a></li>
                        <li><a class="active" href="shop">Shop </a></li>
                        <li>${detail.title}</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="product-details ptb-100 pb-90">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-details-btn">

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-lg-7 col-12">
                        <div class="product-details-img-content">
                            <div class="product-details-tab mr-70">
                                <div class="product-details-large tab-content">

                                    <c:forEach items="${thumbnail}" var="t" begin="0"  end="0">
                                        <c:if test="${t.thumbnail == check.thumbnail or detail.category.id == 5}">
                                            <div class="tab-pane active show fade" id="pro-details1" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>                                        
                                        </c:if>
                                        <c:if test="${t.thumbnail != check.thumbnail or detail.category.id == 5}">
                                            <div class="tab-pane fade" id="pro-details1" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>                                        
                                        </c:if>
                                    </c:forEach>  


                                    <c:forEach items="${thumbnail}" var="t" begin="1"  end="1">
                                        <c:if test="${t.thumbnail == check.thumbnail}">
                                            <div class="tab-pane active show fade" id="pro-details2" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>       
                                        <c:if test="${t.thumbnail != check.thumbnail}">
                                            <div class="tab-pane fade" id="pro-details2" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if> 
                                    </c:forEach>

                                    <c:forEach items="${thumbnail}" var="t" begin="2"  end="2">
                                        <c:if test="${t.thumbnail == check.thumbnail}">
                                            <div class="tab-pane active show fade" id="pro-details3" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>     
                                        <c:if test="${t.thumbnail != check.thumbnail}">
                                            <div class="tab-pane fade" id="pro-details3" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if> 
                                    </c:forEach>

                                    <c:forEach items="${thumbnail}" var="t" begin="3"  end="3">
                                        <c:if test="${t.thumbnail == check.thumbnail}">
                                            <div class="tab-pane active show fade" id="pro-details4" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>   
                                        <c:if test="${t.thumbnail != check.thumbnail}">
                                            <div class="tab-pane fade" id="pro-details4" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>  
                                    </c:forEach>

                                    <c:forEach items="${thumbnail}" var="t" begin="4"  end="4">
                                        <c:if test="${t.thumbnail == check.thumbnail}">
                                            <div class="tab-pane active show fade" id="pro-details5" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${t.thumbnail != check.thumbnail}">
                                            <div class="tab-pane fade" id="pro-details5" role="tabpanel">
                                                <div class="easyzoom easyzoom--overlay">
                                                    <a href="${t.thumbnail}">
                                                        <img src="${t.thumbnail}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>





                                </div>
                                <div class="product-details-small nav mt-12 main-product-details " role=tablist>
                                    <c:forEach items="${thumbnail}" var="t" begin="0"  end="0">
                                        <a class="active mr-12" href="#pro-details1" data-toggle="tab" role="tab" aria-selected="true">
                                            <img src="${t.thumbnail}" alt="">
                                        </a>
                                    </c:forEach> 
                                    <c:forEach items="${thumbnail}" var="t" begin="1"  end="1">                                      
                                        <a class="mr-12" href="#pro-details2" data-toggle="tab" role="tab" aria-selected="true">
                                            <img src="${t.thumbnail}" alt="">
                                        </a>                                        
                                    </c:forEach>
                                    <c:forEach items="${thumbnail}" var="t" begin="2"  end="2">                                      
                                        <a class="mr-12" href="#pro-details3" data-toggle="tab" role="tab" aria-selected="true">
                                            <img src="${t.thumbnail}" alt="">
                                        </a>                                        
                                    </c:forEach>
                                    <c:forEach items="${thumbnail}" var="t" begin="3"  end="3">                                      
                                        <a class="mr-12" href="#pro-details4" data-toggle="tab" role="tab" aria-selected="true">
                                            <img src="${t.thumbnail}" alt="">
                                        </a>                                        
                                    </c:forEach>
                                    <c:forEach items="${thumbnail}" var="t" begin="4"  end="4">                                      
                                        <a class="mr-12" href="#pro-details5" data-toggle="tab" role="tab" aria-selected="true">
                                            <img src="${t.thumbnail}" alt="">
                                        </a>                                        
                                    </c:forEach>



                                </div>
                            </div>
                        </div>
                    </div>             
                    <div class="col-md-12 col-lg-5 col-12">
                        <div class="product-details-content">
                            <h3>${detail.title}</h3>                              
                            <div class="details-price">
                                <c:if test="${pid.price == nul}">
                                    <label>from</label>&ensp;<span>${detail.price}$</span>
                                </c:if>
                                <c:if test="${pid.price != nul}">
                                    <span>${pid.price}$</span>
                                </c:if>
                            </div>
                            <p>${detail.description}</p>
                            <c:if test="${detail.category.id != 5 and detail.category.id != 4}">
                                <div class="quick-view-select">
                                    <div class="select-option-part">


                                        <label>Color :</label>&ensp;&ensp;                   
                                        <c:forEach items="${color}" var="c"> &ensp;
                                            <c:if test="${c.color.name != pid.color.name}">
                                                <button style="border: whitesmoke"><a href="color?cl=${c.color.id}&title=${detail.title}&cpid=${pid.capacity.id}">${c.color.name}</a></button>
                                                </c:if>
                                                <c:if test="${c.color.name == pid.color.name}">
                                                <button style="border: red solid 1.5px"><a href="color?cl=${c.color.id}&title=${detail.title}&cpid=${pid.capacity.id}">${c.color.name}</a></button>
                                                </c:if>
                                            </c:forEach>                                               

                                    </div>           
                                </div>


                                <c:set var="id" value="${pid.id}"/>




                                <div class="quick-view-select">
                                    <div class="select-option-part">


                                        <label>Capcity :</label>&ensp;&ensp;                   
                                        <c:forEach items="${capacity}" var="c"> &ensp;
                                            <c:if test="${c.capacity.id == pid.capacity.id}">
                                                <button style="border: red solid 1.5px"><a href="price?cl=${pcolor}&title=${detail.title}&cpid=${c.capacity.id}">${c.capacity.name}</a></button>                    
                                                </c:if>
                                                <c:if test="${c.capacity.id != pid.capacity.id}">
                                                <button style="border: whitesmoke"><a href="price?cl=${pcolor}&title=${detail.title}&cpid=${c.capacity.id}">${c.capacity.name}</a></button>                    
                                                </c:if>  
                                            </c:forEach>                                               


                                    </div>           
                                </div>
                            </c:if>


                            <c:if test="${detail.category.id == 4}">

                                <div class="quick-view-select">
                                    <div class="select-option-part">


                                        <label>Color :</label>&ensp;&ensp;                   
                                        <c:forEach items="${color}" var="c"> &ensp;
                                            <c:if test="${c.color.name != pid.color.name}">
                                                <button style="border: whitesmoke"><a href="watch?cl=${c.color.id}&title=${detail.title}&sid=${pid.size.id}">${c.color.name}</a></button>
                                                </c:if>
                                                <c:if test="${c.color.name == pid.color.name}">
                                                <button style="border: red solid 1.5px"><a href="watch?cl=${c.color.id}&title=${detail.title}&sid=${pid.size.id}">${c.color.name}</a></button>
                                                </c:if>
                                            </c:forEach>                                               

                                    </div>           
                                </div>


                                <c:set var="id" value="${pid.id}"/>


                                <div class="quick-view-select">
                                    <div class="select-option-part">
                                        <label>Size :</label>&ensp;&ensp;                   
                                        <c:forEach items="${psize}" var="c"> &ensp;
                                            <c:if test="${c.size.id == pid.size.id}">
                                                <button style="border: red solid 1.5px"><a href="size?cl=${pcolor}&title=${detail.title}&sid=${c.size.id}">${c.size.name}</a></button>                    
                                                </c:if>
                                                <c:if test="${c.size.id != pid.size.id}">
                                                <button style="border: whitesmoke"><a href="size?cl=${pcolor}&title=${detail.title}&sid=${c.size.id}">${c.size.name}</a></button>                    
                                                </c:if>  
                                            </c:forEach>                                               


                                    </div>           
                                </div>
                            </c:if>
                                <c:if test="${detail.category.id == 5}">
                            <c:set var="id" value="${detail.id}"/>
                                </c:if>
                            <form name="f" action="buy" method="post">
                                <div class="quickview-plus-minus">
                                    <div class="cart-plus-minus">
                                        <input type="text" value="1" name="num" class="cart-plus-minus-box">
                                    </div>                                 
                                    <div class="quickview-btn-cart">
                                        <input type="button" onclick="buy('${id}')" class="btn-hover-black" value="Add to cart "/>       
                                    </div>

                                </div> 
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="product-collection-area pb-60">
            <div class="container">
                <div class="section-title text-center mb-55">
                    <h2>Related products</h2>
                </div>
                <div class="row">
                    <div class="new-collection-slider owl-carousel">
                        <c:forEach items="${product}" var="p">
                            <div class="col-md-3 col-lg-3 col-sm-4 col-xs-12">
                                <div class="single-product mb-35">
                                    <div class="product-img">
                                        <a href="detail?ptitle=${p.title}"><img style="width: 300px;height: 250px" src="${p.thumbnail}" alt=""></a>

                                        <div class="product-action">

                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-title-price">
                                            <div class="product-title">
                                                <h4><a href="detail?ptitle=${p.title}">${p.title}</a></h4>
                                            </div>
                                            <div class="product-price">

                                            </div>
                                        </div>
                                        <div class="product-cart-categori">
                                            <div class="product-cart">
                                                <span>from ${p.price}$</span>
                                            </div>                                          
                                            <div class="product-categori">
                                                <a href="detail?ptitle=${p.title}"><i class="ion-bag"></i>Shopping</a>
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
                            <div class="quick-view-list nav" role=tablist>
                                <a class="active" href="#modal1" data-toggle="tab" role="tab" aria-selected="true">
                                    <img src="assets/img/quick-view/s1.jpg" alt="">
                                </a>
                                <a href="#modal2" data-toggle="tab" role="tab" aria-selected="false">
                                    <img src="assets/img/quick-view/s2.jpg" alt="">
                                </a>
                                <a href="#modal3" data-toggle="tab" role="tab" aria-selected="false">
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
                                            <option value="">xl</option>
                                            <option value="">ml</option>
                                            <option value="">m</option>
                                            <option value="">sl</option>
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
<script type="text/javascript">
                                            function buy(id) {
                                                var m = document.f.num.value;
                                                document.f.action = "buy?id=" + id + "&num=" + m;
                                                document.f.submit();
                                            }
</script>

