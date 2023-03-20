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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>



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
                                <h2>Statiscal <b></b></h2>
                            </div>
                            <div class="col-sm-6">                               
                                <a style="background-color: #bbb" href="home" class="btn btn-success" > <span>Home</span></a> 

                            </div>
                        </div>
                    </div>                                  



                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>                              
                                <th>Statiscal</th>                                                    
                            </tr>
                        </thead>
                        <tbody>                           
                            <tr>                                 
                                <td>There are total ${sumOrder} orders</td>                                                               
                            </tr>
                            <tr>                                 
                                <td>The amount obtained is ${sumPrice}$</td>                                                               
                            </tr>                         
                        </tbody>
                    </table>     

                </div>
            </div>        
        </div>

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Top 5 <b>Account with the most orders</b></h2>
                            </div>
                            <div class="col-sm-6">                               
                                <a style="background-color: #bbb" href="home" class="btn btn-success" > <span>Home</span></a> 

                            </div>
                        </div>
                    </div>       

                    <form action="searchtop5" method="get">
                        <select name="year">
                            <c:if test="${year == 2022}">
                                <option selected>2022</option>
                            </c:if>
                            <c:if test="${year != 2022}">
                                <option >2022</option>
                            </c:if>
                            <c:if test="${year == 2021}">
                                <option selected>2021</option>
                            </c:if>
                            <c:if test="${year != 2021}">
                                <option >2021</option>
                            </c:if>
                                <c:if test="${year == 2020}">
                                <option selected>2020</option>
                            </c:if>
                            <c:if test="${year != 2020}">
                                <option >2020</option>
                            </c:if>
                        </select>
                        <input type="submit" value="search"/>
                    </form>


                    <div>
                        <canvas id="bar-chart-1"></canvas>
                    </div>

                    <script type="text/javascript">
                        new Chart(document.getElementById("bar-chart-1"), {
                        type: 'bar',
                                data: {

                                labels: [
                        <c:forEach items="${u}" var="p">
                                "${p.fullname}",
                        </c:forEach>
                                ],
                                        datasets: [
                                        {
                                        label: "Population (millions)",
                                                backgroundColor: [<c:forEach items="${u}" var="p">"#3e95cd",</c:forEach>],
                                                data: [<c:forEach items="${u}" var="p">${p.quantity},</c:forEach>]
                                        }
                                        ]
                                },
                                options: {
                                legend: {display: false},
                                        title: {
                                        display: true,
                                                
                                        }
                                }
                        });
                        </script>

                    </div>
                </div>        
            </div>

            <div class="container-xl">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2>Top 5 <b>Product with the most orders</b></h2>
                                </div>
                                <div class="col-sm-6">                               
                                    <a style="background-color: #bbb" href="home" class="btn btn-success" > <span>Home</span></a> 

                                </div>
                            </div>
                        </div>                                  

                        <form action="searchtop5" method="get">
                        <select name="year">
                            <c:if test="${year == 2022}">
                                <option selected>2022</option>
                            </c:if>
                            <c:if test="${year != 2022}">
                                <option >2022</option>
                            </c:if>
                            <c:if test="${year == 2021}">
                                <option selected>2021</option>
                            </c:if>
                            <c:if test="${year != 2021}">
                                <option >2021</option>
                            </c:if>
                                <c:if test="${year == 2020}">
                                <option selected>2020</option>
                            </c:if>
                            <c:if test="${year != 2020}">
                                <option >2020</option>
                            </c:if>
                        </select>
                        <input type="submit" value="search"/>
                    </form>
                        
                        <div>
                            <canvas id="bar-chart-2"></canvas>
                        </div>

                        <script type="text/javascript">
                        new Chart(document.getElementById("bar-chart-2"), {
                        type: 'bar',
                                data: {

                                labels: [
                        <c:forEach items="${bs0}" var="p">
                                "${p.title}",
                        </c:forEach>
                                ],
                                        datasets: [
                                        {
                                        label: "Population (millions)",
                                                backgroundColor: [<c:forEach items="${bs0}" var="p">"#3e95cd",</c:forEach>],
                                                data: [<c:forEach items="${bs0}" var="p">${p.quantity},</c:forEach>]
                                        }
                                        ]
                                },
                                options: {
                                legend: {display: false},
                                        title: {
                                        display: true,
                                                
                                        }
                                }
                        });
                        </script>

                                            
                </div>
            </div>        
        </div>

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Top 5 <b>iPhone with the most orders</b></h2>
                            </div>
                            <div class="col-sm-6">                               
                                <a style="background-color: #bbb" href="home" class="btn btn-success" > <span>Home</span></a> 

                            </div>
                        </div>
                    </div>                                  

                    <form action="searchtop5" method="get">
                        <select name="year">
                            <c:if test="${year == 2022}">
                                <option selected>2022</option>
                            </c:if>
                            <c:if test="${year != 2022}">
                                <option >2022</option>
                            </c:if>
                            <c:if test="${year == 2021}">
                                <option selected>2021</option>
                            </c:if>
                            <c:if test="${year != 2021}">
                                <option >2021</option>
                            </c:if>
                                <c:if test="${year == 2020}">
                                <option selected>2020</option>
                            </c:if>
                            <c:if test="${year != 2020}">
                                <option >2020</option>
                            </c:if>
                        </select>
                        <input type="submit" value="search"/>
                    </form>
                    
                    <div>
                        <canvas id="bar-chart-3"></canvas>
                    </div>

                    <script type="text/javascript">
                        new Chart(document.getElementById("bar-chart-3"), {
                        type: 'bar',
                                data: {

                                labels: [
                        <c:forEach items="${bs1}" var="p">
                                "${p.title}",
                        </c:forEach>
                                ],
                                        datasets: [
                                        {
                                        label: "Population (millions)",
                                                backgroundColor: [<c:forEach items="${bs1}" var="p">"#3e95cd",</c:forEach>],
                                                data: [<c:forEach items="${bs1}" var="p">${p.quantity},</c:forEach>]
                                        }
                                        ]
                                },
                                options: {
                                legend: {display: false},
                                        title: {
                                        display: true,
                                                
                                        }
                                }
                        });
                        </script>
                                 
                </div>
            </div>        
        </div>

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Top 5 <b>iPad with the most orders</b></h2>
                            </div>
                            <div class="col-sm-6">                               
                                <a style="background-color: #bbb" href="home" class="btn btn-success" > <span>Home</span></a> 

                            </div>
                        </div>
                    </div>     
                    
                    <form action="searchtop5" method="get">
                        <select name="year">
                            <c:if test="${year == 2022}">
                                <option selected>2022</option>
                            </c:if>
                            <c:if test="${year != 2022}">
                                <option >2022</option>
                            </c:if>
                            <c:if test="${year == 2021}">
                                <option selected>2021</option>
                            </c:if>
                            <c:if test="${year != 2021}">
                                <option >2021</option>
                            </c:if>
                                <c:if test="${year == 2020}">
                                <option selected>2020</option>
                            </c:if>
                            <c:if test="${year != 2020}">
                                <option >2020</option>
                            </c:if>
                        </select>
                        <input type="submit" value="search"/>
                    </form>

                    <div>
                        <canvas id="bar-chart-4"></canvas>
                    </div>

                    <script type="text/javascript">
                        new Chart(document.getElementById("bar-chart-4"), {
                        type: 'bar',
                                data: {

                                labels: [
                        <c:forEach items="${bs2}" var="p">
                                "${p.title}",
                        </c:forEach>
                                ],
                                        datasets: [
                                        {
                                        label: "Population (millions)",
                                                backgroundColor: [<c:forEach items="${bs2}" var="p">"#3e95cd",</c:forEach>],
                                                data: [<c:forEach items="${bs2}" var="p">${p.quantity},</c:forEach>]
                                        }
                                        ]
                                },
                                options: {
                                legend: {display: false},
                                        title: {
                                        display: true,
                                                
                                        }
                                }
                        });
                        </script>

                                      
                </div>
            </div>        
        </div>

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Top 5 <b>Mac with the most orders</b></h2>
                            </div>
                            <div class="col-sm-6">                               
                                <a style="background-color: #bbb" href="home" class="btn btn-success" > <span>Home</span></a> 

                            </div>
                        </div>
                    </div>         
                    
                    <form action="searchtop5" method="get">
                        <select name="year">
                            <c:if test="${year == 2022}">
                                <option selected>2022</option>
                            </c:if>
                            <c:if test="${year != 2022}">
                                <option >2022</option>
                            </c:if>
                            <c:if test="${year == 2021}">
                                <option selected>2021</option>
                            </c:if>
                            <c:if test="${year != 2021}">
                                <option >2021</option>
                            </c:if>
                                <c:if test="${year == 2020}">
                                <option selected>2020</option>
                            </c:if>
                            <c:if test="${year != 2020}">
                                <option >2020</option>
                            </c:if>
                        </select>
                        <input type="submit" value="search"/>
                    </form>

                    <div>
                        <canvas id="bar-chart-5"></canvas>
                    </div>

                    <script type="text/javascript">
                        new Chart(document.getElementById("bar-chart-5"), {
                        type: 'bar',
                                data: {

                                labels: [
                        <c:forEach items="${bs3}" var="p">
                                "${p.title}",
                        </c:forEach>
                                ],
                                        datasets: [
                                        {
                                        label: "Population (millions)",
                                                backgroundColor: [<c:forEach items="${bs3}" var="p">"#3e95cd",</c:forEach>],
                                                data: [<c:forEach items="${bs3}" var="p">${p.quantity},</c:forEach>]
                                        }
                                        ]
                                },
                                options: {
                                legend: {display: false},
                                        title: {
                                        display: true,
                                                
                                        }
                                }
                        });
                        </script>                   

                                       
                </div>
            </div>        
        </div>

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Top 5 <b>Watch with the most orders</b></h2>
                            </div>
                            <div class="col-sm-6">                               
                                <a style="background-color: #bbb" href="home" class="btn btn-success" > <span>Home</span></a> 

                            </div>
                        </div>
                    </div>         
                    
                    <form action="searchtop5" method="get">
                        <select name="year">
                            <c:if test="${year == 2022}">
                                <option selected>2022</option>
                            </c:if>
                            <c:if test="${year != 2022}">
                                <option >2022</option>
                            </c:if>
                            <c:if test="${year == 2021}">
                                <option selected>2021</option>
                            </c:if>
                            <c:if test="${year != 2021}">
                                <option >2021</option>
                            </c:if>
                                <c:if test="${year == 2020}">
                                <option selected>2020</option>
                            </c:if>
                            <c:if test="${year != 2020}">
                                <option >2020</option>
                            </c:if>
                        </select>
                        <input type="submit" value="search"/>
                    </form>
                    
                    <div>
                        <canvas id="bar-chart-6"></canvas>
                    </div>

                    <script type="text/javascript">
                        new Chart(document.getElementById("bar-chart-6"), {
                        type: 'bar',
                                data: {

                                labels: [
                        <c:forEach items="${bs4}" var="p">
                                "${p.title}",
                        </c:forEach>
                                ],
                                        datasets: [
                                        {
                                        label: "Population (millions)",
                                                backgroundColor: [<c:forEach items="${bs4}" var="p">"#3e95cd",</c:forEach>],
                                                data: [<c:forEach items="${bs4}" var="p">${p.quantity},</c:forEach>]
                                        }
                                        ]
                                },
                                options: {
                                legend: {display: false},
                                        title: {
                                        display: true,
                                                
                                        }
                                }
                        });
                        </script>

                                       
                </div>
            </div>        
        </div>

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">          

                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Top 5 <b>Airpods & Accessories with the most orders</b></h2>
                            </div>
                            <div class="col-sm-6">                               
                                <a style="background-color: #bbb" href="home" class="btn btn-success" > <span>Home</span></a> 

                            </div>
                        </div>
                    </div>       
                    
                    <form action="searchtop5" method="get">
                        <select name="year">
                            <c:if test="${year == 2022}">
                                <option selected>2022</option>
                            </c:if>
                            <c:if test="${year != 2022}">
                                <option >2022</option>
                            </c:if>
                            <c:if test="${year == 2021}">
                                <option selected>2021</option>
                            </c:if>
                            <c:if test="${year != 2021}">
                                <option >2021</option>
                            </c:if>
                                <c:if test="${year == 2020}">
                                <option selected>2020</option>
                            </c:if>
                            <c:if test="${year != 2020}">
                                <option >2020</option>
                            </c:if>
                        </select>
                        <input type="submit" value="search"/>
                    </form>

                    <div>
                        <canvas id="bar-chart-7"></canvas>
                    </div>

                    <script type="text/javascript">
                        new Chart(document.getElementById("bar-chart-7"), {
                        type: 'bar',
                                data: {

                                labels: [
                        <c:forEach items="${bs5}" var="p">
                                "${p.title}",
                        </c:forEach>
                                ],
                                        datasets: [
                                        {
                                        label: "Population (millions)",
                                                backgroundColor: [<c:forEach items="${bs5}" var="p">"#3e95cd",</c:forEach>],
                                                data: [<c:forEach items="${bs5}" var="p">${p.quantity},</c:forEach>]
                                        }
                                        ]
                                },
                                options: {
                                legend: {display: false},
                                        title: {
                                        display: true,
                                                
                                        }
                                }
                        });
                        </script>

                                       
                </div>
            </div>        
        </div>       

        


        <!-- Delete Modal HTML -->

    </body>
</html>