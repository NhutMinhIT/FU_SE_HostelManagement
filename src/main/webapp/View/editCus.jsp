
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

            <form action="${pageContext.request.contextPath}/MainController" method="POST">
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="card-header">
                            <h2 class="text-info"><i class="fa fa-edit fa-beat"></i> Chỉnh Sửa Thông Tin Khách Thuê</h2>                              
                        </div>
                        <div class="card-header">
                            <h4 style="padding-left: 20px;"><i class="fa fa-home"></i> ${Hostel.hostelname}</h4>                              
                        </div>
                        <div class="card-header">
                            <h4 style="padding-left: 40px;"><i class="fa fa-person-shelter"></i> Phòng ${Room.roomnumber}</h4>     
                            <input type="hidden" class="form-control" value="${Room.roomnumber}" name="roomID">
                        </div>
                        <div class="mt-3 text-center" style="float:right; display: flex">                               
                            <a href="${pageContext.request.contextPath}/MainController?action=RoomPage">
                                <button class="btn btn-warning" type="button" id="cancelButton"><i class="fa fa-mail-reply"></i> Trở Lại</button>
                            </a>
                            <button class="btn btn-success" type="submit" name="action" id="sumbitButton" value="CustomerPage"><i class="fa fa-check"></i> Lưu</button>                      
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
                                <a class="nav-link" href="#service" role="tab" data-toggle="tab">Dịch Vụ</a>
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
                                            <input type="text" class="form-control" placeholder="Enter your name" value="${Customer.fullname}" name="fullname">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Giới tính</label>
                                        <div class="col-sm-10"> 
                                            <c:choose>
                                                <c:when test="${Customer.gender == 'Male'}" >
                                                    <input type="radio" name="gender" value="Male"checked/> Nam
                                                    <input type="radio" name="gender" value="Female" />Nữ
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="radio" name="gender" value="Male"/> Nam
                                                    <input type="radio" name="gender" value="Female" checked/>Nữ                                                   
                                                </c:otherwise>
                                            </c:choose>


                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Ngày Sinh</label>
                                        <div class="col-sm-10">

                                            <input type="date" class="form-control"placeholder="" value="${Customer.dob}" name="dob">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">CMND/CCCD</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your CMND/CCCD" value="${Customer.customerID}" disabled="disabled">
                                            <input type="hidden" class="form-control" placeholder="Enter your CMND/CCCD" value="${Customer.customerID}" name="customerID">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Số Điện Thoại</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your phone"value="${Customer.phone}" name="phone" >
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your email" name="email" value="${Customer.email}">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Địa chỉ</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your address" 
                                                   value="${Customer.address}${ward}" disabled="disabled">
                                            <input type="hidden" class="form-control"
                                                   value="${Customer.address}" name="address">
                                            <input type="hidden" class="form-control"
                                                   value="${wardID}" name="wardID">
                                        </div>
                                    </div>


                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade show " id="service" >
                                <div class="card px-3 py-3">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>Chọn</th>
                                                <th>Tên dịch vụ</th>
                                                <th>Loại dịch vụ</th>
                                                <th>Ngày cập nhật</th> 
                                                <th>Giá</th>                                     

                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Chọn</th>
                                                <th>Tên dịch vụ</th>
                                                <th>Loại dịch vụ</th>
                                                <th>Ngày cập nhật</th> 

                                                <th>Giá</th>                                     

                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach items="${ServiceDetailList}" var="SD">   
                                                <c:if test="${SD.hostelID == Hostel.hostelID}">
                                                    <tr>
                                                        <c:set var="Req" value="0" scope="page"/>
                                                        <c:forEach items="${Bill.details}" var="B">
                                                            <c:if test="${B.service.detailID == SD.detailID}">
                                                                <c:set var="Req" value="1" scope="page"/>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:choose>
                                                            <c:when test="${Req == '1'}">
                                                                <td style="text-align: center"><input type="checkbox" name="chooseDetail" value="${SD.detailID}" checked/></td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <td style="text-align: center"><input type="checkbox" name="chooseDetail" value="${SD.detailID}"/></td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        <td>${SD.detailname}</td>
                                                        <c:forEach items="${ServiceTypeList}" var="ST">   
                                                            <c:if test="${ST.serviceID == SD.serviceID}">
                                                                <td>${ST.service_name}</td>
                                                            </c:if>                                                
                                                        </c:forEach>

                                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${SD.updated_date}"/></td>


                                                        <td><input type="text" name="" class="money form-control" value="<fmt:formatNumber type="number" maxFractionDigits="0" value="${SD.unit_price}"/>" disabled="disable" style="width: 100%"/></td>                                     

                                                    </tr>

                                                </c:if>
                                            </c:forEach>

                                        </tbody>
                                    </table>
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
                                        <tbody id="tblSample">
                                            <c:forEach items="${RoomMate}" var="RM"> 
                                                <c:if test="${RM.customerID != Customer.customerID}">
                                                    <tr>
                                                        <td><input type="text" name="fullname1" style="width: 100% ;text-align: center" value="${RM.fullname}"></td>
                                                        <td><input type="date" name="dob1" value="${RM.dob}"></td>
                                                        <td style="text-align: center">
                                                            <c:choose>
                                                                <c:when test="${RM.gender == 'Male'}" >
                                                                    <input type="radio" name="gender${RM.customerID}" value="Male"checked/> Nam
                                                                    <input type="radio" name="gender${RM.customerID}" value="Female" />Nữ
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="radio" name="gender" value="Male"/> Nam
                                                                    <input type="radio" name="gender" value="Female" checked/>Nữ                                                   
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td><input type="text" name="customerID1" style=" text-align: center" value="${RM.customerID}"></td>
                                                        <td><input type="text" name="address1" style="width: 100%; text-align: center" value="${RM.address}"></td>
                                                        <td><input type="text" name="phone1" style="width: 100%; text-align: center" value="${RM.phone}"></td>
                                                        <td><button type="button" class="btn btn-primary table-elipse" data-toggle="collapse" data-target="#mate_2" title="Thêm thành viên"><i class="fa fa-plus fa-beat" ></i></button></td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var = "i" begin = "${length}" end = "4">
                                                <tr id="mate_${i}" class="collapse cell-1 row-child">
                                                    <td colspan="9">
                                                        <table class="table table-striped table-bordered "  >
                                                            <thead>
                                                                <tr>
                                                                    <th style="text-align: center">Tên</th>
                                                                    <th style="text-align: center">Ngày sinh</th>
                                                                    <th style="text-align: center">Giới tính</th>
                                                                    <th style="text-align: center">CMND/CCCD</th>   
                                                                    <th style="text-align: center">Địa chỉ</th> 
                                                                    <th style="text-align: center">Số điện thoại</th> 
                                                                    <th style=""></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="table_filter">
                                                                <tr>
                                                                    <td><input type="text" name="fullname${i}" style="width: 100% ;text-align: center"></td>
                                                                    <td><input type="date" name="dob${i}"></td>
                                                                    <td style="text-align: center">
                                                                        <input type="radio" name="gender${i}" value="Male" checked/>Nam
                                                                        <input type="radio" name="gender${i}" value="Female"/> Nữ
                                                                    </td>
                                                                    <td><input type="text" name="customerID${i}" style=" text-align: center"></td>
                                                                    <td><input type="text" name="address${i}" style="width: 100%; text-align: center"></td>
                                                                    <td><input type="text" name="phone${i}" style="width: 100%; text-align: center"></td>
                                                                    <td><button type="button" class="btn btn-primary table-elipse" data-toggle="collapse" data-target="#mate_${i+1}" title="Thêm thành viên"><i class="fa fa-plus fa-beat" ></i></button></td>
                                                                </tr>  
                                                            </tbody>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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
                                                <input type="date" class="form-control" name="signed_date" value="${Contract.signed_date}">
                                            </div>
                                        </div>                                           
                                        <div class="form-group row col-md-6 mt-2">
                                            <label  class="col-sm-4 col-form-label">Ngày Hết Hạn</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" name="due_date" value="${Contract.signed_date}">
                                            </div>
                                        </div>
                                        <div class="form-group" style="margin-top: 10px">
                                            <label for="inputAddress2">Mô Tả</label>
                                            <textarea rows="3" class="form-control" id="remarks" name="description" value="${Contract.description}"></textarea>
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
