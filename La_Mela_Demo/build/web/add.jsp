<%-- 
    Document   : add
    Created on : Oct 26, 2022, 1:01:02 PM
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
        <title>Add Product</title>
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
                            <h2>Add <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="addEmployeeModal" >
                <div class="modal-dialog">
                    <div class="modal-content">


                        <form action="add" method="get">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Category</label>
                                    <input name="category" type="text" value="${category}" readonly class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input name="title" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Color</label><br/>
                                    <c:forEach items="${color}" var="c">
                                        <input style="width: 15px" name="color" type="radio" value="${c.id}"  /> ${c.name} &ensp;&nbsp;
                                    </c:forEach>
                                </div>
                                <c:if test="${category != 4 and category != 5}">
                                    <div class="form-group">
                                        <label>Capacity</label><br/>
                                        <c:forEach items="${capacity}" var="c">
                                        <input style="width: 15px" name="capacity" type="radio" value="${c.id}"  /> ${c.name} &ensp;&nbsp;
                                        </c:forEach>
                                    </div>
                                </c:if>                             
                                <c:if test="${category == 4 }">
                                    <div class="form-group">
                                        <label>Size</label><br/>
                                        <c:forEach items="${size}" var="c">
                                        <input style="width: 15px" name="size" type="radio" value="${c.id}"  /> ${c.name} &ensp;&nbsp;
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input name="quantity" type="text" class="form-control" required>
                                </div>
                                
                                <div class="form-group">
                                    <label>Thumbnail</label>
                                    <input name="thumbnail" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Galery</label>
                                    <input name="galery" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea id="editor1" name="description" class="form-control" required></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
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
