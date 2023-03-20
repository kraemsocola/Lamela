<%-- 
    Document   : editproduct
    Created on : Oct 24, 2022, 11:56:23 PM
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
        <title>Profile Account</title>
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
                            <h2>Profile <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="profile" method="get">

                            <div class="modal-body">
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detail.id}" readonly name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Role</label>
                                    <input value="${detail.role.name}" readonly name="rolename" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Fullname</label>
                                    <input value="${detail.fullname}" readonly name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${detail.email}" readonly name="email" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Phone_number</label>
                                    <input value="${detail.phone_number}" readonly name="phone" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input value="${detail.address}" readonly name="address" type="text" class="form-control" >
                                </div>                            
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>

