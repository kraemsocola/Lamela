<%-- 
    Document   : Edit
    Created on : Oct 21, 2022, 1:11:08 AM
    Author     : hp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Product</title>
        <link rel="shortcut icon" type="image/x-icon" href="images/logoapple.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>



        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="get">

                            <div class="modal-body">
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detail.id}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group" required>
                                    <label>Category ID</label>
                                    <select  name="category" class="form-control" >
                                        <c:forEach items="${data}" var="o">
                                            <c:if test="${detail.category.name == o.name}">
                                                <option selected="${detail.category.name}" value="${o.id}">${o.name}</option>
                                            </c:if>
                                            <c:if test="${detail.category.name != o.name}">
                                                <option value="${o.id}">${o.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>                             
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input value="${detail.title}" name="title" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Color</label><br/>
                                    <c:forEach items="${color}" var="c">
                                        <input style="width: 15px" name="color" type="radio" value="${c.id}"  /> ${c.name} &ensp;&nbsp;
                                    </c:forEach>
                                </div>
                                <c:if test="${detail.category.id != 4 and detail.category.id != 5}">
                                    <div class="form-group">
                                        <label>Capacity</label><br/>
                                        <c:forEach items="${capacity}" var="c">
                                        <input style="width: 15px" name="capacity" type="radio" value="${c.id}"  /> ${c.name} &ensp;&nbsp;
                                        </c:forEach>
                                    </div>
                                </c:if>                                                           
                                <c:if test="${detail.category.id == 4 }">
                                    <div class="form-group">
                                        <label>Size</label><br/>
                                        <c:forEach items="${size}" var="c">
                                        <input style="width: 15px" name="size" type="radio" value="${c.id}"  /> ${c.name} &ensp;&nbsp;
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${detail.price}" name="price" type="text" class="form-control" required>
                                </div>                              
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input value="${detail.quantity}" name="quantity" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Thumbnail</label>
                                    <input value="${detail.thumbnail}" name="thumbnail" type="text" class="form-control" required>
                                </div>    
                                <div class="form-group">
                                    <label>Galery</label>
                                    <input value="${detail.galery.thumbnail}" name="galery" type="text" class="form-control" required>
                                </div> 
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea value="${detail.description}" id="editor1" name="description" class="form-control" ></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <script src="js/manager.js" type="text/javascript"></script>       
    </body>
</html>
<script src="ckeditor/ckeditor.js"></script>
<script> CKEDITOR.replace('editor1');</script>