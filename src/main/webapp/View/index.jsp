<%-- 
    Document   : index
    Created on : May 30, 2022, 4:07:25 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MoonHostel</title>
        <link rel="icon" type="image/png" href="../assets/img/logo.png" sizes="16x16">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    </head>
    <body class="sb-nav-fixed">

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">
            <main class="container-fluid">
                <div class="container-fluid px-4">
                    <h1 class="mt-4"><i class="fa fa-house"></i> Home</h1>
                    <div class="row mt-3">
                        <div class="col-xl-6">
                            <div class="card bg-warning text-white mb-4">
                                <div class="card-body">
                                    <h1>Room Status</h1>
                                    <hr>
                                </div>
                                
                                <div class="card-body">
                                    <canvas id="myPieChart" ></canvas>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-6">
                            <div class="card bg-warning text-white mb-4">
                                <div class="card-body">
                                    <h1>Total Revenue</h1>
                                    <hr>
                                </div>
                                <div class="card-body">
                                    <canvas id="myBarChart" ></canvas>
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-xl-6 ">
                            <div class="card bg-warning text-white mb-4">
                                <div class="card-body">
                                    <h1>List of available rooms</h1>
                                    <hr>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Hostel</th>
                                                <th scope="col">Room</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${RoomList}" var="o">
                                                <c:if test="${o.status == 'EMPTY'}">
                                                    <tr>
                                                        <c:forEach items="${HostelList}" var="h">
                                                            <c:if test="${h.hostelID == o.hostelID}">
                                                                <td scope="row">${h.hostelname}</td>
                                                            </c:if>
                                                        </c:forEach> 
                                                        <td>Room ${o.roomID}</td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>     

                                        </tbody>
                                    </table>
                                </div>
                                <div class="card-body">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 ">
                            <div class="card bg-warning text-white mb-4">
                                <div class="card-body">
                                    <h1>The invoice remains unpaid</h1>
                                    <hr>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">House</th>
                                                <th scope="col">Room</th>
                                                <th scope="col">Customer</th>
                                                <th scope="col">Month</th>
                                                <th scope="col">Money</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">Moon House</th>
                                                <td>Room 2.02</td>
                                                <td>Nhựt Minh</td>
                                                <td>8</td>
                                                <td>2.300.000</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Moon House</th>
                                                <td>Room 2.02</td>
                                                <td>Nhựt Minh</td>
                                                <td>8</td>
                                                <td>2.300.000</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card-body">

                                </div>

                            </div>
                        </div>

                    </div>

                </div>
                
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted ">Copyright &copy; by MoonHostel</div>
                    </div>
                </div>
            </footer>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>          
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
         <script src="${pageContext.request.contextPath}/js/scripts.js"></script>        
        <script src="${pageContext.request.contextPath}/assets/demo/chart-pie-demo.js"></script>
        <script src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
        
       
    </body>

</html>
