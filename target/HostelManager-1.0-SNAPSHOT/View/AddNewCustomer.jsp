<%-- 
    Document   : AddNewCustomer
    Created on : Jun 2, 2022, 11:13:11 AM
    Author     : ASUS
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

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

                <form action="">
                    <div class="card mb-4">
                        <div class="card-header">
                            <div class="card-header">
                                <h2><i class="fa fa-plus"></i> Add Customer</h2>                              
                            </div>
                            <div class="mt-3 text-center" style="float:right; display: flex">
                                <button class="btn btn-warning" type="button" id="cancelButton"><i class="fa fa-mail-reply"></i> Return</button>
                                <button class="btn btn-success" type="button" id="sumbitButton"><i class="fa fa-check"></i> Save</button>
                            </div>                      
                        </div>
                    </div>


                    <main class="container-fluid">

                        <div class="room container-fluid px-4">                        

                            <ul class=" col-12 nav nav-tabs mb-4">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#cusInfor" role="tab" data-toggle="tab">Customer Information</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#service" role="tab" data-toggle="tab">Service</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#member" role="tab" data-toggle="tab">Member</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#contract" role="tab" data-toggle="tab">Contract</a>
                                </li>
                            </ul>

                            <div class="tab-content ">
                                <div role="tabpanel" class=" tab-pane fade show active" id="cusInfor" >
                                    <div class="card px-5 py-5">
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Enter your name">
                                            </div>
                                        </div>
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">Sex</label>
                                            <div class="col-sm-10">
                                                <input type="radio" name="radio" id="sex"  /> Male
                                                <input type="radio" name="radio" checked /> Female
                                            </div>
                                        </div>
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">Day of Birth (DOB)</label>
                                            <div class="col-sm-10">
                                                <input type="date" class="form-control" placeholder="Enter your DOB">
                                            </div>
                                        </div>
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">CMND/CCCD</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Enter your CMND/CCCD">
                                            </div>
                                        </div>
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">Phone</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Enter your phone">
                                            </div>
                                        </div>
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">Address</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Enter your address">
                                            </div>
                                        </div>
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">Room</label>
                                            <div class="col-sm-10">
                                                <input type="text" value="Room 1.01" class="form-control" placeholder="Enter your Room" disabled="disabled">
                                            </div>
                                        </div>
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">Start Day</label>
                                            <div class="col-sm-10">
                                                <input type="date" class="form-control" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade show " id="service" >
                                    <div class="card px-3 py-3">
                                        <table  class="table table-striped table-bordered "  width="100%">
                                            <thead>
                                                <tr>
                                                    <th style="width: 5%">Choose</th>
                                                    <th style="width: 55%; text-align: center">Service Name</th>
                                                    <th style="width: 20%; text-align: center ">Price (VNĐ)</th>
                                                    <th style="width: 20%; text-align: center">Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td ><input type="checkbox"></td>
                                                    <td style="text-align: center">Electricity</td>
                                                    <td><input type="text" name="price" style="width: 100%; text-align: right" value="3000"></td>
                                                    <td><input type="text" name="quantity" style="width: 100%; text-align: right" value="1"></td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox"></td>
                                                    <td style="text-align: center">Water</th>
                                                    <td><input type="text" name="price" style="width: 100%; text-align: right" value="10000"></td>
                                                    <td><input type="text" name="quantity" style="width: 100%; text-align: right" value="1"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div role="tabpanel" class="tab-pane fade show " id="member" >
                                    <div class="card px-3 py-3">
                                        <table  class="table table-striped table-bordered "  >
                                            <thead>
                                                <tr>
                                                    <th style=" text-align: center">Name</th>
                                                    <th style=" text-align: center">DOB</th>
                                                    <th style=" text-align: center">Sex</th>
                                                    <th style=" text-align: center">CMND/CCCD</th>
                                                    <th style=" text-align: center">Address</th>
                                                    <th style=" text-align: center">Phone</th>
                                                    <th style=""></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="text" name="name" style="width: 100% ;text-align: center"></td>
                                                    <td><input type="date" name="date"></td>
                                                    <td style="text-align: center">
                                                        <input type="radio" name="radio" id="sex"  /> Male
                                                        <input type="radio" name="radio" checked /> Female
                                                    </td>
                                                    <td><input type="text" name="cmnd" style=" text-align: center"></td>
                                                    <td><input type="text" name="address" style="width: 100%; text-align: center"></td>
                                                    <td><input type="text" name="phone" style="width: 100%; text-align: center"></td>
                                                    <td><button class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td><input type="text" name="name" style="width: 100% ;text-align: center"></td>
                                                    <td><input type="date" name="date"></td>
                                                    <td style="text-align: center">
                                                        <input type="radio" name="radio" id="sex"  /> Male
                                                        <input type="radio" name="radio" checked /> Female
                                                    </td>
                                                    <td><input type="text" name="cmnd" style=" text-align: center"></td>
                                                    <td><input type="text" name="address" style="width: 100%; text-align: center"></td>
                                                    <td><input type="text" name="phone" style="width: 100%; text-align: center"></td>
                                                    <td><button class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <div>
                                            <div style="float:right">
                                                <button id="addRowPerson" type="button" class="btn btn-success pull-right"><i class="fa fa-plus-circle"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div role="tabpanel" class="tab-pane fade show " id="contract" >
                                    <div class="card px-3 py-3">
                                        <div class="form-group row mt-2">
                                            <label  class="col-sm-2 col-form-label">ID Contract</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Enter your ID">
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="form-group row col-md-6 mt-2">
                                                <label  class="col-sm-4 col-form-label">Contract Start Date</label>
                                                <div class="col col-sm-8">
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group row col-md-6 mt-2">
                                                <label  class="col-sm-4 col-form-label">Contract End Date</label>
                                                <div class="col-sm-8">
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>

                            </div>

                        </div>
                    </main>
                </form>
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
