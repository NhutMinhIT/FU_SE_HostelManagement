<%-- 
    Document   : header
    Created on : Jun 12, 2022, 10:42:13 PM
    Author     : avillX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MoonHostel</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png" sizes="16x16">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->

            <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/MainController?action=UserPage">MoonHostel
                <img src="${pageContext.request.contextPath}/assets/img/logo.png" class="rounded-circle"  alt="logo"width="40" height="36">
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MainController?action=ChangePass">Đổi Mật Khẩu</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MainController?action=Logout">Đăng Xuất</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <c:choose>
                                <c:when test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/MainController?action=UserPage">
                                        <div class="sb-nav-link-icon"><i class="fas fa-palette"></i></div>
                                        Trang Chủ
                                    </a>
                                    <a class="nav-link collapsed" href="${pageContext.request.contextPath}/MainController?action=RoomPage">
                                        <div class="sb-nav-link-icon"><i class="fas fa-house"></i></div>
                                        Phòng                                
                                    </a>
                                    <a class="nav-link collapsed" href="${pageContext.request.contextPath}/MainController?action=ServicePage">
                                        <div class="sb-nav-link-icon"><i class="fas fa-cubes"></i></div>
                                        Dịch Vụ                                
                                    </a>
                                    <a class="nav-link collapsed" href="${pageContext.request.contextPath}/MainController?action=CartPage">
                                        <div class="sb-nav-link-icon"><i class="fas fa-bolt"></i></div>
                                        Quản Lý Tiêu                               
                                    </a>
                                    <a class="nav-link collapsed" href="${pageContext.request.contextPath}/MainController?action=BillPage">
                                        <div class="sb-nav-link-icon"><i class="fas fa-money-bill"></i></div>
                                        Tính tiền                               
                                    </a>
                                </c:when>
                                <c:when test="${sessionScope.LOGIN_USER.status == 'ACTIVE'}">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/MainController?action=CustomerPage&CusID=${sessionScope.LOGIN_USER.customerID}&roomID=${Room}">
                                        <div class="sb-nav-link-icon"><i class="fas fa-palette"></i></div>
                                        Thông tin
                                    </a>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>



                            <div class="sb-sidenav-menu-heading">Khác</div>

                            <a class="nav-link" href="${pageContext.request.contextPath}/View/contact.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-card"></i></div>
                                Liên Hệ
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${sessionScope.LOGIN_USER.fullname}                      
                    </div>
                </nav>
            </div>
    </body>
</html>