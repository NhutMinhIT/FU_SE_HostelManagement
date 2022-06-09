<%-- 
    Document   : index
    Created on : May 30, 2022, 4:07:25 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
<<<<<<< HEAD
            <a class="navbar-brand ps-3" href="index.jsp">MoonHostel
                <img src="../assets/img/logo.png" class="rounded-circle"  alt="logo"width="40" height="36">
=======

            <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/MainController?action=">MoonHostel
                <img src="${pageContext.request.contextPath}/assets/img/logo.png" class="rounded-circle"  alt="logo"width="40" height="36">
>>>>>>> 83b97c015f16896776d71e898a477cec1d789937
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
                        <li><a class="dropdown-item" href="#!">Profile</a></li>
                        <li><a class="dropdown-item" href="#!">Settings</a></li>

                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MainController?action=Logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">

<<<<<<< HEAD
                            <a class="nav-link" href="index.jsp">
=======
                            <a class="nav-link" href="${pageContext.request.contextPath}/UserPageController">
>>>>>>> 83b97c015f16896776d71e898a477cec1d789937
                                <div class="sb-nav-link-icon"><i class="fas fa-palette"></i></div>
                                Home
                            </a>
                            <a class="nav-link collapsed" href="room.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-house"></i></div>
                                Room                                
                            </a>
                            <a class="nav-link collapsed" href="service.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-cubes"></i></div>
                                Service                                
                            </a>
                            <a class="nav-link" href="signup.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-add"></i></div>
                                New Account
                            </a> 


                            <div class="sb-sidenav-menu-heading">About</div>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-map"></i></div>
                                Maps
                            </a>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-card"></i></div>
                                Contact
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
<<<<<<< HEAD
                        MoonHostel
                        <img src="../assets/img/logo.png" class="rounded-circle"  alt="regisster"width="40" height="36">
=======

                        ${sessionScope.LOGIN_USER.fullname}
                       
>>>>>>> 83b97c015f16896776d71e898a477cec1d789937
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main class="container-fluid">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4"><i class="fa fa-house"></i> Home</h1>
                        <div class="row mt-3">
                            <div class="col-xl-6 ">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">
                                        <h1>Room Status</h1>
                                        <hr>
                                    </div>
                                    <div class="card-body">
                                        <button class="border-0 rounded-3 bg-primary text-white">Renting Room</button>
                                        <button class="border-0 rounded-3 bg-danger text-white">Empty</button>
                                    </div>
                                    <div class="card-body">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 ">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">
                                        <h1>Total Revenue</h1>
                                        <hr>
                                    </div>
                                    <div class="card-body">
                                    </div>
                                    <div class="card-body">                                       
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
                                                    <th scope="col">House</th>
                                                    <th scope="col">Room</th>
        
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
<<<<<<< HEAD
                                                    <th scope="row">Moon House</th>
                                                    <td>Room 1.02</td>
=======
                                                    <c:forEach items="${HostelList}" var="h">
                                                        <c:if test="${h.hostelID == o.hostelID}">
                                                            <td scope="row">${h.hostelname}</td>
                                                        </c:if>
                                                    </c:forEach> 
                                                    <td>Room ${o.roomID}</td>
                                                </tr>
                                                </c:if>
                                            </c:forEach>     
>>>>>>> 83b97c015f16896776d71e898a477cec1d789937

                                                </tr>
                                                <tr>
                                                    <th scope="row">Star House</th>
                                                    <td>Room 2.03</td>
                                                </tr>
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
                                        <h1>The customer owes the room</h1>
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
        </div>
        <script src="../js/scripts.js"></script>
        <script src="../js/datatables-simple-demo.js"></script>
        <script src="../assets/demo/chart-area-demo.js"></script>
        <script src="../assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>    
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    </body>

</html>
