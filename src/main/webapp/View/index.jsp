<%-- 
    Document   : index
    Created on : May 30, 2022, 4:07:25 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <h1 class="m-4 text-info"><i class="fa fa-house fa-beat"></i> Trang chủ</h1>
                    <div class="row mt-3">
                        <div class="col-xl-6">
                            <div class="card text-primary mb-4" style="background-color: rgba(240,240,240,1)">
                                <div class="card-body">
                                    <h1>Trạng thái phòng</h1>
                                    <hr>
                                </div>

                                <div class="card-body">
                                    <canvas id="myPieChart" ></canvas>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-6">
                            <div class="card text-primary mb-4" style="background-color: rgba(240,240,240,1)">
                                <div class="card-body">
                                    <h1>Tổng doanh thu</h1>
                                    <hr>
                                </div>
                                <div class="card-body">
                                    <canvas id="myLinechart" ></canvas>
                                </div>

                            </div>
                        </div>
                        <div class="col-xl-6 ">
                            <div class="card text-primary mb-4" style="background-color: rgba(240,240,240,1)">
                                <div class="card-body">
                                    <h1>Danh sách phòng còn trống</h1>
                                    <hr>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Tên nhà trọ</th>
                                                <th scope="col">Phòng</th>

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
                                                        <td>Room ${o.roomnumber}</td>
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
                            <div class="card text-primary mb-4" style="background-color: rgba(240,240,240,1)">
                                <div class="card-body">
                                    <h1>Danh sách hóa đơn chưa thanh toán</h1>
                                    <hr>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Tên nhà trọ</th>
                                                <th scope="col">Phòng</th>
                                                <th scope="col">Tên người thuê</th>
                                                <th scope="col">Tháng</th>
                                                <th scope="col">Còn lại</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${CheckoutList}" var="Check">
                                                <c:if test="${!Check.created.isEmpty()}">
                                                    <c:forEach items="${CusList}" var="Cus">
                                                        <c:if test="${Check.customerID == Cus.customerID}">
                                                            <c:forEach items="${ContractList}" var="C">
                                                                <c:if test="${Check.customerID == C.customerID}">
                                                                    <c:forEach items="${RoomList}" var="R">
                                                                        <c:if test="${C.roomID == R.roomID}">
                                                                            <c:forEach items="${HostelList}" var="H">
                                                                                <c:if test="${H.hostelID == R.hostelID}">
                                                                                    <tr>
                                                                                        <th scope="row">${H.hostelname}</th>
                                                                                        <td>${R.roomnumber}</td>
                                                                                        <td>${Cus.fullname}</td>
                                                                                        <td><fmt:formatDate pattern="MM" value="${Check.created}"/></td>
                                                                                        <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${Check.total}"/></td>
                                                                                    </tr>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
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
        <script src="${pageContext.request.contextPath}/assets/demo/chart-line-demo.js"></script>


    </body>

</html>
