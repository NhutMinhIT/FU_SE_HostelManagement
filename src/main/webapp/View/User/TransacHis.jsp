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
        <link rel="icon" type="image/png" href="../../assets/img/logo.png" sizes="16x16">
        <link href="../../css/styles.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    </head>

    <body class="sb-nav-fixed jumbotron">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">MoonHostel
                <img src="../../assets/img/logo.png" class="rounded-circle"  alt="logo"width="40" height="36">
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Tìm Kiếm..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">                        
                        <li><a class="dropdown-item" href="changePass.jsp">Đổi Mật Khẩu</a></li>

                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="#!">Đăng Xuất</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">

                            <a class="nav-link" href="Infor.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-palette"></i></div>
                                Thông Tin
                            </a>
                            <a class="nav-link collapsed" href="Bill.jsp">
                                <div class="sb-nav-link-icon"><i class="fab fa-cc-paypal "></i></div>
                                Hóa Đơn                                
                            </a>
                            <a class="nav-link collapsed" href="TransacHis.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-history"></i></div>
                                Lịch Sử Giao Dịch                               
                            </a>

                            <div class="sb-sidenav-menu-heading">Khác</div>

                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-card"></i></div>
                                Liên Hệ
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        MoonHostel
                        <img src="../assets/img/logo.png" class="rounded-circle"  alt="regisster"width="40" height="36">
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <h1 class="mt-4 col-md-4 text-info" style="padding-left: 3%"> <i class="fas fa-history"></i> Lịch Sử Giao Dịch</h1>               

                <main class="container-fluid">

                    <div class="room container-fluid px-4">                        

                        <ul class=" col-12 nav nav-tabs mb-4">
                            <li class="nav-item">
                                <a class="nav-link active" href="#y2022" role="tab" data-toggle="tab">2022</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#y2021" role="tab" data-toggle="tab">2021</a>
                            </li>
                        </ul>

                        <div class="tab-content ">
                            <div role="tabpanel" class=" tab-pane fade show active" id="y2022" >
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>                                                
                                                <th>Name</th>                                      
                                                <th>Ngày Thanh Toán</th>
                                                <th>Số Tiền (VND)</th>
                                                <th>Phương Thức</th>
                                                <th>Còn Nợ</th>
                                                <th>Trạng Thái</th>
                                                <th>Chức Năng</th>                                                 
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>                                                
                                                <th>Name</th>                                      
                                                <th>Ngày Thanh Toán</th>
                                                <th>Số Tiền (VND)</th>
                                                <th>Phương Thức</th>
                                                <th>Còn Nợ</th>
                                                <th>Trạng Thái</th>
                                                <th>Chức Năng</th>                                                  
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>                                             

                                                <td>Tiền Trọ Tháng 1</td>
                                                <td>21/01/2022</td>
                                                <td>2,830,000 VND</td>                                                
                                                <td>Chuyển Khoản</td>
                                                <td>Không</td>
                                                <td class="text-success">Đã Thanh Toán</td> 
                                                <td></td>
                                            </tr>                                       

                                            <tr>                                             

                                                <td>Tiền Trọ Tháng 2</td>
                                                <td>21/02/2022</td>
                                                <td>2,830,000 VND</td>                                                
                                                <td>Chuyển Khoản</td>
                                                <td>Không</td>
                                                <td class="text-success">Đã Thanh Toán</td>
                                                <td></td>
                                            </tr>    
                                            <tr>                                             

                                                <td>Tiền Trọ Tháng 3</td>
                                                <td></td>
                                                <td>2,830,000 VND</td>                                                
                                                <td></td>
                                                <td></td>
                                                <td class="text-danger">Chưa Thanh Toán</td> 
                                                <td>
                                                    <a href="Bill.jsp">                                                                                        
                                                        <button class="btn btn-primary" title="payment"><i class="fab fa-cc-paypal"></i> Xem Hóa Đơn</button>                
                                                    </a>
                                                </td>
                                            </tr>    
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <div role="tabpanel" class="tab-pane fade show " id="y2021" >
                                <div class="card-body">
                                    <table id="datatablesSimple1">
                                        <thead>
                                            <tr>                                                
                                                <th>Name</th>                                      
                                                <th>Ngày Thanh Toán</th>
                                                <th>Số Tiền (VND)</th>
                                                <th>Phương Thức</th>
                                                <th>Còn Nợ</th>
                                                <th>Status</th>
                                                <th>Function</th>                                                
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>                                                
                                                <th>Name</th>                                      
                                                <th>Ngày Thanh Toán</th>
                                                <th>Số Tiền (VND)</th>
                                                <th>Phương Thức</th>
                                                <th>Còn Nợ</th>
                                                <th>Status</th> 
                                                <th>Function</th>  
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>                                             

                                                <td>Tiền Trọ Tháng 1</td>
                                                <td>21/01/2021</td>
                                                <td>2,830,000 VND</td>                                                
                                                <td>Chuyển Khoản</td>
                                                <td>Không</td>
                                                <td class="text-success">Đã Thanh Toán</td>  
                                                <td></td>
                                            </tr>                                       

                                            <tr>                                             

                                                <td>Tiền Trọ Tháng 2</td>
                                                <td>21/02/2021</td>
                                                <td>2,830,000 VND</td>                                                
                                                <td>Chuyển Khoản</td>
                                                <td>Không</td>
                                                <td class="text-success">Đã Thanh Toán</td> 
                                                <td></td>
                                            </tr>   
                                               
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto jumbotron">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted ">Copyright &copy; by MoonHostel</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
        <script src="${pageContext.request.contextPath}/assets/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>    
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    </body>

</html>