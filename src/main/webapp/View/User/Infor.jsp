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


                <div class="card mb-4">
                    <div class="card-header">
                        <div class="card-header">
                            <h2 class="text-info""><i class="fa fa-eye"></i> Thông Tin Cá Nhân</h2>                              
                        </div>
                        <div class="card-header ml-3"   style="padding-left:5%">
                            <h4><i class="fa fa-home"></i> Phòng 1</h4>                              
                        </div>

                    </div>
                </div>


                <main class="container-fluid">

                    <div class="room container-fluid px-4">                        

                        <ul class=" col-12 nav nav-tabs mb-4">
                            <li class="nav-item">
                                <a class="nav-link active" href="#cusInfor" role="tab" data-toggle="tab">Thông Tin</a>
                            </li>                            
                            <li class="nav-item">
                                <a class="nav-link" href="#member" role="tab" data-toggle="tab">Thành Viên</a>
                            </li>                         
                        </ul>

                        <div class="tab-content ">
                            <div role="tabpanel" class=" tab-pane fade show active" id="cusInfor" >
                                <div class="card px-5 py-5">
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Tên</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your name" value="Nguyễn Nhựt Minh" disabled="Name">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Giới tính</label>
                                        <div class="col-sm-10">  
                                            <input type="radio" name="checkbox" value="Male" disabled="disabled" />Nữ
                                            <input type="radio" name="checkbox" checked/> Nam
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Ngày Sinh</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control"placeholder="" value="16/01/2001" disabled="disable" >
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">CMND/CCCD</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your CMND/CCCD" value="261567736" disabled="cmnd" />
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Số Điện Thoại</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" placeholder="Enter your phone"value="0382694825" disabled="phone" />
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Địa chỉ</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your address" 
                                                   value="288/3 Man Thiên, phường Tăng Nhơn Phú A, Quận 9, Tp. Hồ Chí Minh." disabled=address />
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Phòng</label>
                                        <div class="col-sm-10">
                                            <input type="text" value="Room 1" class="form-control" placeholder="Enter your Room" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Ngày Thuê</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="" value="25/05/2019" disabled="disable" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade show " id="member" >
                                <div class="card px-3 py-3">
                                    <table  class="table table-striped table-bordered "  >
                                        <thead>
                                            <tr>
                                                <th style=" text-align: center">Tên</th>
                                                <th style=" text-align: center">Ngày Sinh</th>
                                                <th style=" text-align: center">Giới Tính</th>
                                                <th style=" text-align: center">CMND/CCCD</th>
                                                <th style=" text-align: center">Địa Chỉ</th>
                                                <th style=" text-align: center">Số Điện Thoại</th>
                                                <th style=""></th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="text" name="name" value="Phan Minh Tri" disabled="" style="width: 100% ;text-align: center"></td>
                                                <td><input type="text" name="date" value="24/09/2001" disabled=""></td>
                                                <td style="text-align: center">
                                                    <input type="radio" checked="" disabled="">Nam <br/>
                                                    <input type="radio" name="radio" disabled="" /> Nữ
                                                </td>
                                                <td><input type="text" name="cmnd" value="1234567890" disabled="cmnd" style=" text-align: center"></td>
                                                <td><input type="text" name="address" style="width: 100%; text-align: center"
                                                           value="288/3 Man Thiên, phường Tăng Nhơn Phú A, Quận 9, Tp. Hồ Chí Minh."
                                                           disabled="address"></td>
                                                <td><input type="text" name="phone" value="0986785483" disabled="phone"style="width: 100%; text-align: center"></td>                                              

                                            </tr>
                                            <tr>
                                                <td><input type="text" name="name" value="Trần Quang Hùng" disabled="" style="width: 100% ;text-align: center"></td>
                                                <td><input type="text" name="date" value="25/05/2001" disabled=""></td>
                                                <td style="text-align: center">
                                                    <input type="radio" checked=""disabled="">Nam <br/>
                                                    <input type="radio" name="radio" disabled=""/> Nữ
                                                </td>
                                                <td><input type="text" name="cmnd" value="2987986756" disabled="cmnd" style=" text-align: center"></td>
                                                <td><input type="text" name="address" style="width: 100%; text-align: center"
                                                           value="288/3 Man Thiên, phường Tăng Nhơn Phú A, Quận 9, Tp. Hồ Chí Minh."
                                                           disabled="address">
                                                </td>
                                                <td><input type="text" name="phone" value="0987689006" disabled="phone"style="width: 100%; text-align: center"></td>                                                
                                            </tr>
                                        </tbody>
                                    </table>


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
