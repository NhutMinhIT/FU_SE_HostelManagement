
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

            <form action="${pageContext.request.contextPath}/MainController" method="POST" >
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="card-header">
                            <h2 class="text-info"><i class="fa fa-plus fa-beat"></i> Thêm Khách</h2>       

                        </div>
                        <div class="card-header">
                            <h4 style="padding-left: 20px;"><i class="fa fa-home"></i> ${Hostel.hostelname}</h4>                              
                        </div>
                        <div class="card-header">
                            <h4 style="padding-left: 40px;"><i class="fa fa-person-shelter"></i> Phòng ${Room.roomnumber}</h4> 
                            <input type="hidden" name="roomID" value="${Room.roomID}">
                        </div>
                        <div>
                            <h3 style="margin-top: 20px;margin-left: 60px; color: red">${ERROR}</h3>
                        </div>
                        <div class="mt-3 text-center" style="float:right; display: flex">
                            <a href="${pageContext.request.contextPath}/MainController?action=RoomPage">
                                <button class="btn btn-warning" type="button" id="cancelButton"><i class="fa fa-mail-reply"></i> Trở Lại</button>
                            </a>
                            <button class="btn btn-success" type="submit" name="action" id="sumbitButton" value="AddCustomer"><i class="fa fa-check"></i> Lưu</button>
                        </div>                      
                    </div>
                </div>


                <main class="container-fluid">

                    <div class="room container-fluid px-4">                        

                        <ul class=" col-12 nav nav-tabs mb-4">
                            <li class="nav-item">
                                <a class="nav-link active" href="#cusInfor" role="tab" data-toggle="tab">Thông Tin Khách Thuê</a>
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
                            <li class="nav-item">
                                <a class="nav-link" href="#register" role="tab" data-toggle="tab">Tạo tài khoản</a>
                            </li>
                        </ul>

                        <div class="tab-content ">
                            <div role="tabpanel" class=" tab-pane fade show active" id="cusInfor" >
                                <div class="card px-5 py-5">
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Tên</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your name" name="fullname" value="${Customer.fullname}">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Giới Tính</label>
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
                                            <input type="date" class="form-control" placeholder="Enter your DOB" name="dob" value="${Customer.dob}">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">CMND/CCCD</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your CMND/CCCD" name="customerID" value="${Customer.customerID}">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Số Điện Thoại</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your phone" name="phone" >
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your email" name="email" >
                                        </div>
                                    </div>

                                    <!--Address-->

                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Tỉnh/Thành Phố</label>
                                        <div class="col-sm-8">
                                            <select id="province" style="padding:6px 0; border-radius: 3px; width: 50%" value="79">
                                            </select>  
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Quận/Huyện</label>
                                        <div class="col-sm-8">
                                            <select id="district" style="padding:6px 0; border-radius: 3px; width: 50%" value="760">
                                            </select>  
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Phường/Xã</label>
                                        <div class="col-sm-8">
                                            <select id="ward" style="padding:6px 0; border-radius: 3px; width: 50%" name="wardID" value="26734"> 
                                            </select>  
                                        </div>
                                    </div>


                                    <div class="form-group row mt-2">
                                        <label  class="col-sm-2 col-form-label">Địa Chỉ</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="Enter your address" name="address" value="${Customer.address}">
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
                                                        <c:choose>
                                                            <c:when test="${ST.serviceID == 1}">
                                                                <td style="text-align: center"><input type="checkbox" name="chooseDetail" value="${SD.detailID}" checked/></td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <td style="text-align: center"><input type="checkbox" name="chooseDetail" value="${SD.detailID}" /></td>
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
                                            <tr>
                                                <td><input type="text" name="fullname1" style="width: 100% ;text-align: center"></td>
                                                <td><input type="date" name="dob1"></td>
                                                <td style="text-align: center">
                                                    <input type="radio" name="gender1" value="Male"checked/>Nam
                                                    <input type="radio" name="gender1" value="Female"/> Nữ
                                                </td>
                                                <td><input type="text" name="customerID1" style=" text-align: center"></td>
                                                <td><input type="text" name="address1" style="width: 100%; text-align: center"></td>
                                                <td><input type="text" name="phone1" style="width: 100%; text-align: center"></td>
                                                <td><button type="button" class="btn btn-primary table-elipse" data-toggle="collapse" data-target="#mate_2" title="Thêm thành viên"><i class="fa fa-plus fa-beat" ></i></button></td>
                                            </tr>
                                            <c:forEach var = "i" begin = "2" end = "4">
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
                                                <input type="date" class="form-control" name="signed_date">
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-6 mt-2">
                                            <label  class="col-sm-4 col-form-label">Ngày Hết Hạn</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" name="due_date">
                                            </div>
                                        </div>
                                        <div class="form-group" style="margin-top: 10px">
                                            <label for="inputAddress2">Mô Tả</label>
                                            <textarea rows="3" class="form-control" id="remarks" name="description"></textarea>
                                        </div>
                                        <!--                                        <div class="form-group row col-md-8 mt-2">
                                                                                    <label  class="col-sm-4 col-form-label"></label>
                                                                                    <div class="col col-sm-8">
                                                                                        <input name="contract" type="file" size="100"/>
                                                                                    </div>
                                                                                </div>-->

                                    </div> 
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade show " id="register" >
                                <div class="card px-3 py-3">
                                    <div class="form-group row mt-2">

                                    </div>
                                    <div class="row mt-2">
                                        <div class="form-group row col-md-6 mt-2">
                                            <label  class="col-sm-4 col-form-label">Tên đăng nhập:</label>
                                            <div class="col col-sm-8">
                                                <input type="text" placeholder="Email hoặc số điện thoại của User" class="form-control" name="phone" disabled="disabled">
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-6 mt-2">
                                            <label  class="col-sm-2 col-form-label">Mật khẩu:</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" value="1" name="passCus" disabled="disabled">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js" integrity="sha512-bPh3uwgU5qEMipS/VOmRqynnMXGGSRv+72H/N260MQeXZIK4PG48401Bsby9Nq5P5fz7hy5UGNmC/W1Z51h2GQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
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
    <!--<script>
        const reader = new FileReader();

// Lắng nghe trạng thái đăng tải tệp
        fileUpload.addEventListener("change", (event) => {
            // Lấy thông tin tập tin được đăng tải
            const files = event.target.files;

            // Đọc thông tin tập tin đã được đăng tải
            reader.readAsDataURL(files[0])

            // Lắng nghe quá trình đọc tập tin hoàn thành
            reader.addEventListener("load", (event) => {
                // Lấy chuỗi Binary thông tin hình ảnh
                const img = event.target.result;

                // Thực hiện hành động gì đó, có thể append chuỗi giá trị này vào thẻ IMG
                console.log(img) // data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEASABIAA........
            })
        })
    </script>-->

</body>

</html>