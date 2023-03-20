<%-- 
    Document   : manage-account
    Created on : Oct 24, 2022, 11:20:57 PM
    Author     : hp
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manage Accounts</title>
        <link rel="shortcut icon" type="image/x-icon" href="images/logoapple.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #000;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
        </style>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete category with id=" + id)) {
                    window.location = "deleteaccount?pid=" + id;
                }
            }
        </script>


    </head>



    <body>   

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Account</b></h2>
                            </div>
                            <div class="col-sm-6">                               
                                <a style="background-color: #bbb" href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Account</span></a> 
                                					
                            </div>
                        </div>
                    </div>

                    <div class="search" style="margin-bottom: 5px">
                        <form action="searchaccount">
                            <input name="txt" id="search-manage" placeholder="Search By Email" type="text">
                            <button type="submit">
                                Submit 
                            </button>
                        </form>
                    </div>
                    
                    <div style="color: red">${ms1} ${ms2}</div>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Address</th>  
                                <th>Role</th>  
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="p">
                                <tr>
                                    
                                    <td>${p.id}</td>
                                    <td>${p.fullname}</td>
                                    <td>${p.email}</td>
                                    <td>${p.phone_number}</td>
                                    <td>${p.address}</td> 
                                    <td>${p.role.name}</td>   
                                    <td>
                                        <a href="loadaccount?pid=${p.id}" class="edit" ><i class="material-icons" data-toggle="tooltip" title="Profile">&#xE254;</i></a>
                                        <a href="#" onclick="doDelete('${p.id}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:set var="page" value="${requestScope.page}"/>

                    <div class="clearfix">
                        <div class="hint-text">Showing <b>${list.size()}</b> out of <b>${list1.size()}</b> entries</div>
                        <ul class="pagination">                               
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <li class="page-item"><a href="manageproduct?page=${i}" class="page-link">${i}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>        
        </div>


        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addaccount" method="get">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group" required>
                                <label>Role</label>
                                <select name="role_id" class="form-control" >
                                    <c:forEach items="${data}" var="o">
                                        <c:if test="${o.id != 1}">
                                        <option value="${o.id}">${o.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>                             
                            </div>                              
                            <div class="form-group">
                                <label>Fullname</label>
                                <input  name="user" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input  name="email" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Phone_number</label>
                                <input  name="phone" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="address" type="text" class="form-control" required>
                            </div>    
                            <div class="form-group">
                                <label>Password</label>
                                <input name="pass" type="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Re-Password</label>
                                <input name="repass" type="password" class="form-control" required>
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
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group" required>
                                <label>Category ID</label>
                                <select name="category" class="form-control" >
                                    <c:forEach items="${data}" var="o">
                                        <option value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>                             
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <input name="title" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <input name="color" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Capacity</label>
                                <input name="capacity" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Model</label>
                                <input name="model" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Ram</label>
                                <input name="ram" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Size</label>
                                <input name="size" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Discount</label>
                                <input name="discount" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Thumbnail</label>
                                <input name="thumbnail" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->

    </body>
</html>
