<%-- 
    Document   : addnewrom
    Created on : May 31, 2022, 7:17:06 AM
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
                                <h1 class="text-info"><i class="fa fa-person-shelter fa-beat"></i> Thêm Phòng</h1>

                            </div>
                            <div class="card-body">

                                <form action="${pageContext.request.contextPath}/MainController" method="POST">
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">Số Phòng</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Số Phòng" name="roomnumber">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Tên Nhà</label>
                                        <div class="col-sm-10">
                                            <input type="hidden" class="form-control" value="${requestScope.Hostel.hostelID}" name="hostelID">
                                            <input type="text" class="form-control" value="${requestScope.Hostel.hostelname}" placeholder="Tên Nhà" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-2">
                                            <label>Giá Phòng</label>
                                        </div>
                                        <div class="form-group col-md-10">

                                            <input type="text" class="form-control"  placeholder="VND" name="price">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputAddress2">Mô Tả</label>
                                        <textarea rows="3" class="form-control" id="remarks" name="description"></textarea>
                                    </div>


                                    <div class="mt-3 text-center">
                                         <a href="${pageContext.request.contextPath}/MainController?action=RoomPage">
                                            <button class="btn btn-warning" type="button" id="cancelButton"><i class="fa fa-mail-reply"></i> Trở Về</button>
                                        </a>
                                         <button class="btn btn-success" type="submit" name="action" id="sumbitButton" value="AddRoom"><i class="fa fa-check"></i> Lưu</button>
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
