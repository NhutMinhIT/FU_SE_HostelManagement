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

    <body class="sb-nav-fixed jumbotron">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">MoonHostel
                <img src="../assets/img/logo.png" class="rounded-circle"  alt="logo"width="40" height="36">
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
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
             <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">

                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-palette"></i></div>
                                Home
                            </a>
                            <a class="nav-link collapsed" href="room.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-house"></i></div>
                                Room                                
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
                        MoonHostel
                        <img src="../assets/img/logo.png" class="rounded-circle"  alt="regisster"width="40" height="36">
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main class="container-fluid">
                    <div class="container-fluid px-4">                        
                        <h1 class="mt-4"><i class="fa fa-house"></i> Room Manager</h1>
                        <div class="breadcrumb mb-4 px-4">
                             <div class="row " style="float:right; display: flex">
                                    <a>
                                        <button type="button"  class="btn btn-success m-2"><i class="fa fa-add"></i> Add Room</button>
                                    </a>
                                </div> 
                                <div class="row mr-5" style="float:right; display: flex">
                                    <a>
                                        <button type="button"  class="btn btn-primary m-2"><i class="fa fa-edit"></i> Edit</button>
                                        </button>
                                    </a>
                                </div> 
                                <div class="row " style="float:right; display: flex">
                                    <a>
                                        <button type="button"  class="btn btn-danger m-2"><i class="fa fa-remove"></i> Delete Room</button>
                                    </a>
                                </div> 
                        </div>
                        
                        <div class="row">
                            <div class="col-xl-3 col-md-6" style="border-radius: 50px;">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h4><i class="fa fa-house"></i> Room 1.01</h4>
                                    </div>
                                    <div class="card-body">
                                        <i class="fas fa-user fa-fw"></i> Nguyễn Nhựt Minh
                                    </div>
                                    <div class="card-body">
                                        <i class="fas fa-money-bill-1 fa-fw"></i> 2,300,000 VND
                                    </div>
                                    <div class="card-footer align-items-centernt">
                                        <div  class="ml-2" style="float: left;">
                                            <a>                                           
                                                <button type="button"  class="btn btn-primary m-2"><i class="fa fa-edit"></i> Edit</button>
                                            </a>
                                        </div>
                                        <div  class="row">
                                            <a>
                                                <button type="button"  class="btn btn-danger m-2"><i class="fa fa-remove"></i> Delete</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">
                                        <h4><i class="fa fa-house"></i> Room 1.03</h4>
                                    </div>

                                    <div class="card-body">
                                        <i class="fas fa-user fa-fw"></i> Empty
                                    </div>
                                    <div class="card-body">
                                        <i class="fas fa-money-bill-1 fa-fw"></i> 2,300,000 VND
                                    </div>
                                    <div class="card-footer align-items-centernt">
                                        <div  class="ml-2" style="float: left">
                                            <a>                                           
                                                <button type="button"  class="btn btn-primary m-2"><i class="fa fa-edit"></i> Edit</button>
                                            </a>
                                        </div>
                                        <div  class="row">
                                            <a>
                                                <button type="button"  class="btn btn-danger m-2"><i class="fa fa-remove"></i> Delete</button>
                                            </a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h4><i class="fa fa-house"></i> Room 2.03</h4>
                                    </div>
                                    <div class="card-body">
                                        <i class="fas fa-user fa-fw"></i> Phan Minh Trí
                                    </div>
                                    <div class="card-body">
                                        <i class="fas fa-money-bill-1 fa-fw"></i> 2,300,000 VND
                                    </div>
                                    <div class="card-footer align-items-centernt">
                                        <div  class="ml-2" style="float: left">
                                            <a>                                           
                                                <button type="button"  class="btn btn-primary m-2"><i class="fa fa-edit"></i> Edit</button>
                                            </a>
                                        </div>
                                        <div  class="row">
                                            <a>
                                                <button type="button"  class="btn btn-danger m-2"><i class="fa fa-remove"></i> Delete</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">
                                        <h4><i class="fa fa-house"></i> Room 1.04</h4>
                                    </div>
                                    <div class="card-body">
                                        <i class="fas fa-user fa-fw"></i> Empty
                                    </div>
                                    <div class="card-body">
                                        <i class="fas fa-money-bill-1 fa-fw"></i> 2,300,000 VND
                                    </div>
                                    <div class="card-footer align-items-centernt">
                                        <div  class="ml-2" style="float: left">
                                            <a>                                           
                                                <button type="button"  class="btn btn-primary m-2"><i class="fa fa-edit"></i> Edit</button>
                                            </a>
                                        </div>
                                        <div  class="row">
                                            <a>
                                                <button type="button"  class="btn btn-danger m-2"><i class="fa fa-remove"></i> Delete</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>Tenant Information                               
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>CMND/CCCD</th>
                                            <th>Room</th>
                                            <th>Floor</th>
                                            <th>Start date</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>Nguyen Nhut Minh</td>
                                            <td>2567489055</td>
                                            <td>01</td>
                                            <td>01</td>
                                            <td>2021/05/25</td>
                                            <td>2,300,000 VND</td>
                                        </tr>
                                        <tr>
                                            <td>Phan Minh Tri</td>
                                            <td>2569358952</td>
                                            <td>03</td>
                                            <td>02</td>
                                            <td>2021/02/14</td>
                                            <td>2,500,000 VND</td>
                                        </tr>
                                        <tr>
                                            <td>Trần Quang Hùng</td>
                                            <td>4785962305</td>
                                            <td>03</td>
                                            <td>03</td>
                                            <td>2021/12/09</td>
                                            <td>2,500,000 VND</td>
                                        </tr>
                                        <tr>
                                            <td>Hồ Bảo Anh</td>
                                            <td>4856932652</td>
                                            <td>02</td>
                                            <td>01</td>
                                            <td>2022/03/29</td>
                                            <td>2,300,000 VND</td>
                                        </tr>
                                        <tr>
                                            <td>Airi Satou</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>33</td>
                                            <td>2008/11/28</td>
                                            <td>$162,700</td>
                                        </tr>
                                        <tr>
                                            <td>Brielle Williamson</td>
                                            <td>Integration Specialist</td>
                                            <td>New York</td>
                                            <td>61</td>
                                            <td>2012/12/02</td>
                                            <td>$372,000</td>
                                        </tr>
                                        <tr>
                                            <td>Herrod Chandler</td>
                                            <td>Sales Assistant</td>
                                            <td>San Francisco</td>
                                            <td>59</td>
                                            <td>2012/08/06</td>
                                            <td>$137,500</td>
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