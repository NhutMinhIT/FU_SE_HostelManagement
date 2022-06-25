
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />

    </head>
    <body class="sb-nav-fixed">

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">
            <main class="container-fluid">
                <div class="container-fluid px-4">
                    <div class="card mt-4">
                        <div class="card-header">
                            <h1 class="text-info"><i class="fa-solid fa-house-chimney-medical"></i> Thêm Nhà Trọ</h1>

                        </div>
                        <div class="card-body">

                            <form action="${pageContext.request.contextPath}/MainController" method="POST">
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">Tên Nhà</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="hostelname" class="form-control" placeholder="Nhập tên nhà">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">Địa Chỉ</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">Phường</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="ward" class="form-control" placeholder="Nhập tên phường">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">Quận</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="district" class="form-control" placeholder="Nhập tên quận">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">Thành Phố</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="city" class="form-control" placeholder="Nhập thành phố">
                                    </div>
                                </div>

                                <div class="mt-3 text-center">
                                    <a href="${pageContext.request.contextPath}/MainController?action=RoomPage">
                                        <button class="btn btn-warning" type="button" id="cancelButton"><i class="fa fa-mail-reply"></i> Trở Về</button>
                                    </a>
                                        <button class="btn btn-success" type="submit" name="action" id="sumbitButton" value="AddHostel"><i class="fa fa-check"></i> Lưu</button>
                                </div>
                            </form>



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
