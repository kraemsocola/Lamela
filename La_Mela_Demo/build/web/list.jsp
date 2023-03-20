<%-- 
    Document   : list
    Created on : Oct 5, 2022, 10:33:05 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #wrapper{
                font-family: arial;
                margin-left: 30px;
                width: 90%;
            }
            .clr {
                clear:both;
            }
            /*Phan Menu*/
            #menu_tab {
                width:100%;
            }
            ul.menu {
                float:left;
                background:url(images/background_menu.jpg) repeat-x;
                display:block;
                list-style-type:none;
                font-weight:bold;
                height: 55px;
                padding:12px;
                width: 100%;
            }
            ul.menu li {
                display:inline;
                font-size:14px;
                padding-top: 15px;
                text-align:center;
                line-height:30px;
                color:#E2D9BC;
            }
            ul.menu li a{
                margin: 10px;
                padding-left:0px;
                text-decoration:none;
                text-align:center;
                color:#E2D9BC;
                position:relative;
            }
            ul.menu li a img{
                float:left;
                margin-left:10px;
            }
            ul.menu li a:hover{
                color:#F90;
            }
            ul.menu li a:active{
                color:#FF0;
            }
            ul.menu li a:focus {
                color:#96F;
            }
            #content{
                margin-left: 20px;
            }
            table{
                border-collapse: collapse;
            }
            td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        
        <h3 style="color:red ">${requestScope.ms }</h3>
        <form action="login" method="post">
            Username:<input type="text" name="user"/><br/>
            Password:<input type="password" name="pass"/><br/>
            <input type="submit" value="Login"/><br/>
        </form>
        
        <div id="wrapper">
            <div id="menu_tab">
                <ul class="menu">
                    <li><a href="products?category_id=${0}">All</a></li>
                        <c:forEach items="${requestScope.data}" var="c">                  
                        <li><a href="products?category_id=${c.id}">${c.name}</a></li>
                        </c:forEach>
                </ul>
            </div>
            <div class="clr"></div>
            <div id="content">
                <c:set var="list" value="${requestScope.products}"/>
                <c:if test="${((list==null) || (list.size()==0))}">
                    <h3>No product</h3>
                </c:if>
                <c:if test="${((list!=null) && (list.size()>0))}">   
                      <table border="1px">
                          <tr>
                              <th>ID</th>
                              <th>Name</th>
                              <th>Price</th>
                              <th>Image</th>
                              <th>Description</th>
                              <th>Category name</th>
                          </tr>                         
                          <c:forEach items="${requestScope.products}" var="p">
                              <tr>
                                  <td>${p.id}</td>
                                  <td>${p.title}</td>
                                  <td>${p.price}</td>
                                  <td><img src="${p.thumbnail}" width="80px" height="80px"/></td>
                                  <td>${p.description}</td>
                                  <td>${p.category.name}</td>
                              </tr>
                          </c:forEach>
                      </table>
                </c:if>      
                </div>
            </div>
        </body>
    </html>
