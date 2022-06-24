
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MoonHostel</title>
        <link rel="icon" type="image/png" href="../assets/img/logo.png" sizes="16x16">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    </head>

    <body class="sb-nav-fixed jumbotron">

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">
            <h1 class="mt-4 col-md-4"><i class="fa fa-house"></i> Quản Lí Phòng</h1>
            <table>
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>Quản Lí Nhà Trọ                              
                        </div>
                        <div class="row " style="float:right; display: flex; margin-right: 9px">
                            <a href="View/addNewHostel.jsp">
                                <button type="button"  class="btn btn-success m-2"><i class="fa fa-bank"></i> Thêm Nhà Trọ</button>
                            </a>
                        </div>

                    </div>
                </div>
            </table>

            <main class="container-fluid">

                <div class="room container-fluid px-4">                        

                    <ul class=" col-12 nav nav-tabs mb-4">
                        <c:forEach items="${HostelList}" var="Ho">   
                            <li class="nav-item">
                                <c:choose>
                                    <c:when test="${Ho.hostelID == '1'}">
                                        <a class="nav-link active" href="#${Ho.hostelname}" role="tab" data-toggle="tab">${Ho.hostelname}</a>   
                                    </c:when>
                                    <c:otherwise>
                                        <a class="nav-link" href="#${Ho.hostelname}" role="tab" data-toggle="tab">${Ho.hostelname}</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                    </ul>


                    <div class="tab-content ">
                        <c:forEach items="${HostelList}" var="Hos">
                            <c:choose>
                                <c:when test="${Hos.hostelID == '1'}">
                                    <div role="tabpanel" class=" tab-pane fade show active" id="${Hos.hostelname}" >   
                                    </c:when>
                                    <c:otherwise>
                                        <div role="tabpanel" class=" tab-pane fade show" id="${Hos.hostelname}" >
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="breadcrumb mb-4 "style="margin-left: 82%;" >
                                        <div class="row" >

                                            <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                                <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                            </a>
                                        </div>
                                        <div class="row "style="margin-left: 10px">
                                            <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                                <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                            </a>
                                        </div>                             
                                        <!-- comment -->
                                    </div>
                                    <div class="card-body">
                                        <c:choose>
                                            <c:when test="${Hos.hostelID == '1'}">
                                                <table id="datatablesSimple">  
                                                </c:when>
                                                <c:otherwise>
                                                    <table id="datatablesSimple1">
                                                    </c:otherwise>
                                                </c:choose>

                                                <thead>
                                                    <tr>
                                                        <th>Phòng</th>
                                                        <th>Người Thuê</th>
                                                        <th>Số Điện Thoại</th> 
                                                        <th>Email</th>                                     
                                                        <th>Ngày Thuê</th>
                                                        <th>Giá (VND)</th>
                                                        <th>Trạng Thái</th>
                                                        <th>Chức Năng</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Phòng</th>
                                                        <th>Người Thuê</th>
                                                        <th>Số Điện Thoại</th> 
                                                        <th>Email</th>                                     
                                                        <th>Ngày Thuê</th>
                                                        <th>Giá (VND)</th>
                                                        <th>Trạng Thái</th>
                                                        <th>Chức Năng</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:forEach items="${RoomList}" var="R">
                                                        <c:if test="${R.hostelID == Hos.hostelID}"> 
                                                            <tr>                                                
                                                                <td>${R.roomnumber}</td>
                                                                <c:forEach items="${ContractList}" var="Contract">
                                                                    <c:choose>
                                                                        <c:when test="${Contract.roomID == R.roomID}">                                                            
                                                                            <c:forEach items="${CusList}" var="Cus">
                                                                                <c:if test="${Cus.customerID == Contract.customerID}">
                                                                                    <td>
                                                                                        <a href="${pageContext.request.contextPath}/MainController?action=CustomerInfo&CusID=${Cus.customerID}">
                                                                                            ${Cus.fullname}
                                                                                        </a>
                                                                                    </td>
                                                                                    <td>${Cus.phone}</td>
                                                                                    <td>${Cus.email}</td>
                                                                                    <td>${Contract.signed_date}</td>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td></td>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>

                                                                <td>${R.price}</td>
                                                                <c:choose>
                                                                    <c:when test="${R.status == 'RENTING'}">
                                                                        <td class="text-success">${R.status}</td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td class="text-warning">${R.status}</td>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${R.status == 'RENTING'}">
                                                                        <td>                                                    

                                                                            <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                                                <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                                            </a>
                                                                            <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                                                <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                                            </a>
                                                                        </td>
                                                                    </c:when>                                                                   
                                                                    <c:otherwise>
                                                                        <td>                                                    
                                                                            <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                                                <button class="btn btn-warning" title="Add"><i class="fa fa-add"></i> Thêm Khách</button>
                                                                            </a>  
                                                                            <a  href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                                                <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                                            </a>
                                                                        </td>
                                                                    </c:otherwise>    
                                                                </c:choose>                                      
                                                            </tr>
                                                        </c:if> 
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                    </div>

                                </div>
                            </c:forEach>
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
    <script>
        function ConfirmDelete()
        {
            var x = confirm("Are you sure you want to delete?");
            if (x)
                return true;
            else
                return false;
        }
    </script>    
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