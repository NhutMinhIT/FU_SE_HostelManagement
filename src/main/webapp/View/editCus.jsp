
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    </head>

    <body class="sb-nav-fixed jumbotron">

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">

            <form action="${pageContext.request.contextPath}/MainController" method="POST" enctype="multipart/form-data">
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="card-header">
                            <h2 class="text-info"><i class="fa fa-edit"></i> Chỉnh Sửa Thông Tin Khách Thuê</h2>                              
                        </div>
                        <div class="card-header">
                            <h4 style="padding-left: 20px;"><i class="fa fa-home"></i> ${Hostel.hostelname}</h4>                              
                        </div>
                        <div class="card-header">
                            <h4 style="padding-left: 20px;"><i class="fa fa-person-shelter"></i> Phòng ${Room.roomnumber}</h4>                              
                        </div>
                        <div class="mt-3 text-center" style="float:right; display: flex">                               
                            <a href="${pageContext.request.contextPath}/MainController?action=RoomPage">
                                <button class="btn btn-warning" type="button" id="cancelButton"><i class="fa fa-mail-reply"></i> Trở Lại</button>
                            </a>
                            <button class="btn btn-success" type="button" id="sumbitButton"><i class="fa fa-edit"></i> Lưu</button>                              
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
                            <li class="nav-item">
                                <a class="nav-link" href="#contract" role="tab" data-toggle="tab">Hợp Đồng</a>
                            </li>

                        </ul>

                        <div class="tab-content ">
                            <div role="tabpanel" class=" tab-pane fade show active" id="cusInfor" >
                                <div class="card px-5 py-5">
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Tên</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your name" value="${Customer.fullname}">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Giới tính</label>
                                        <div class="col-sm-10">  
                                            <input type="radio" name="gender" value="${Customer.gender}"  />Nữ
                                            <input type="radio" name="gender" value="${Customer.gender}"checked/> Nam
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Ngày Sinh</label>
                                        <div class="col-sm-10">

                                            <input type="date" class="form-control"placeholder="" value="${Customer.dob}" >
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">CMND/CCCD</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your CMND/CCCD" value="${Customer.customerID}" >
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Số Điện Thoại</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your phone"value="${Customer.phone}" >
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Địa chỉ</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your address" 
                                                   value="${Customer.address}" disabled="disabled">
                                        </div>
                                    </div>

                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Ngày Thuê</label>
                                        <div class="col-sm-10">
                                            <input type="date" class="form-control" value="${Contract.signed_date}" disabled="disabled" >
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div role="tabpanel" class="tab-pane fade show " id="member" >
                                <div class="card px-3 py-3">
                                    <table  class="table table-striped table-bordered">                                           
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
                                        <tbody id="tblSample">
                                            <tr>
                                                <td><input type="text" name="name" value="Phan Minh Tri" style="width: 100% ;text-align: center"></td>
                                                <td><input type="text" name="date" value="24/09/2001" ></td>
                                                <td style="text-align: center">
                                                    <input type="radio" checked="">Nam <br/>
                                                    <input type="radio" name="radio"  /> Nữ
                                                </td>
                                                <td><input type="text" name="cmnd" value="1234567890" style=" text-align: center"></td>
                                                <td><input type="text" name="address" style="width: 100%; text-align: center"
                                                           value="288/3 Man Thiên, phường Tăng Nhơn Phú A, Quận 9, Tp. Hồ Chí Minh."
                                                           disabled="disabled">
                                                </td>
                                                <td><input type="text" name="phone" value="0986785483" style="width: 100%; text-align: center"></td>
                                                <td style="display: flex;">
                                                <td><button onclick="deleterow('tblSample')" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>                                                        

                                            </tr>
                                            <tr>
                                                <td><input type="text" name="name" value="" style="width: 100% ;text-align: center"></td>
                                                <td><input type="text" name="date" value="" ></td>
                                                <td style="text-align: center">
                                                    <input type="radio" checked="">Nam <br/>
                                                    <input type="radio" name="radio" /> Nữ
                                                </td>
                                                <td><input type="text" name="cmnd" value="" style=" text-align: center"></td>
                                                <td><input type="text" name="address" style="width: 100%; text-align: center"
                                                           value=""
                                                           disabled="disabled">
                                                </td>
                                                <td><input type="text" name="phone" value="" style="width: 100%; text-align: center"></td>
                                                <td style="display: flex;">
                                                <td><button onclick="deleterow('tblSample')" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>                                                   

                                            </tr>
                                        </tbody>

                                    </table>

                                    <div>
                                        <div style="float:right">
                                            <button onclick="addRow('tblSample')" type="button" class="btn btn-success pull-right add-row"><i class="fa fa-plus-circle"></i></button>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div role="tabpanel" class="tab-pane fade show " id="contract" >
                                <div class="card px-3 py-3">
                                    <div class="form-group row mt-2">

                                    </div>
                                    <div class="row mt-2">
                                        <div class="form-group row col-md-6 mt-2">
                                            <label  class="col-sm-4 col-form-label">Ngày Bắt Đầu</label>
                                            <div class="col col-sm-8">
                                                <input type="date" class="form-control" name="signed-date" value="${Contract.signed_date}">
                                            </div>
                                        </div>                                           
                                        <div class="form-group row col-md-6 mt-2">
                                            <label  class="col-sm-4 col-form-label">Ngày Hết Hạn</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" name="due-date" value="${Contract.signed_date}">
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-8 mt-2">
                                            <label  class="col-sm-4 col-form-label"></label>
                                            <div class="col col-sm-8">
                                                <input name="contract"type="file" accept=".jpg, .png" multiple/>
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


    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>    
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script type="text/javascript">

                                                function deleterow(tblId)
                                                {

                                                    var table = document.getElementById(tblId);
                                                    var row = table.getElementsByTagName('tr');
                                                    if (row.length > '1') {
                                                        row[row.length - 1].outerHTML = '';
                                                    } else {
                                                        window.alert('Cần ít nhất 1 thành viên hoặc chọn xóa phòng');
                                                    }
                                                }

                                                function addRow(myTable) {
                                                    var table = document.getElementById(myTable);
                                                    var row = table.getElementsByTagName('tr');
                                                    if (row.length < '4') {
                                                        var row = row[row.length - 1].outerHTML;
                                                        table.innerHTML = table.innerHTML + row;
                                                        for (i = 0; i < row.length; i++) {
                                                            row[i].innerHTML = '';
                                                        }

                                                    } else {
                                                        window.alert('Phòng tối đa 4 người');
                                                    }


                                                }
    </script>

</body>

</html>
