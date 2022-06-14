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
                            <div class="row " style="float:right; display: flex">
                                <a href="addNewHostel.jsp">
                                    <button type="button"  class="btn btn-success m-2"><i class="fa fa-bank"></i> Thêm Nhà Trọ</button>
                                </a>
                            </div>
                            <div class="row " style="float:right; display: flex">
                                <a href="#">
                                    <button type="button"  class="btn btn-danger m-2"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                </a>
                            </div> 

                        </div>
                    </div>
                </table>

                <main class="container-fluid">

                    <div class="room container-fluid px-4">    
<<<<<<< HEAD
                        
                        <c:forEach items="${HostelList}" var="Hos">
                            <ul class=" col-12 nav nav-tabs mb-4">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#${Hos.hostelname}" role="tab" data-toggle="tab">${Hos.hostelname}</a>
                                </li>                               
                            </ul>
                        </c:forEach> 
                                
=======
                        <ul class=" col-12 nav nav-tabs mb-4">
                            <li class="nav-item">
                                <c:forEach items="${HostelList}" var="Hos">
                                    <a class="nav-link active" href="#${Hos.hostelname}" role="tab" data-toggle="tab">${Hos.hostelname}</a>
                                </c:forEach> 
                            </li>                               
                        </ul>        
>>>>>>> AvillXx
                        <div class="breadcrumb mb-4 " style="margin-left: 85%">
                            <div class="row">
                                <a href="addNewRoom.jsp">
                                    <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                </a>
                            </div>                             
                            <!-- comment -->
                        </div>
                                
                        <div class="tab-content ">
<<<<<<< HEAD
                            <c:forEach items="${HostelList}" var="Hos">
=======
>>>>>>> AvillXx
                                <div role="tabpanel" class=" tab-pane fade show active" id="${Hos.hostelname}" >
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>Phòng</th>
                                                <th>Người Thuê</th>
                                                <th>Số Điện Thoại</th> 
                                                <th>Email</th>                                     
                                                <th>Ngày Thuê</th>
                                                <th>Giá</th>
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
                                                <th>Giá</th>
                                                <th>Trạng Thái</th>
                                                <th>Chức Năng</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
<<<<<<< HEAD
                                            <c:forEach items="${RoomList}" var="R">
                                                <c:if test="${R.hostelID == Hos.hostelID}">
                                                    
=======
                                        <c:forEach items="${HostelList}" var="Hos">
                                            <c:forEach items="${RoomList}" var="R">
                                                <c:if test="${R.hostelID == Hos.hostelID}">                                                    
>>>>>>> AvillXx
                                                    <c:forEach items="${ContractList}" var="Contract">
                                                        <c:if test="${Contract.roomID == R.roomID}">                                                            
                                                            <c:forEach items="${CusList}" var="Cus">
                                                                <c:if test="${Cus.customerID == Contract.customerID}">
                                                                    <tr>                                                
                                                                        <td>${R.roomnumber}</td>
                                                                        <td>
<<<<<<< HEAD
                                                                                <a href="${pageContext.request.contextPath}/MainController?action=ViewCus&id=${Cus.customerID}">
                                                                                    ${Cus.fullname}
                                                                                </a>
=======
                                                                            <a href="${pageContext.request.contextPath}/MainController?action=ViewCus&id=${Cus.customerID}">
                                                                                ${Cus.fullname}
                                                                            </a>
>>>>>>> AvillXx
                                                                        </td>
                                                                        <td>${Cus.phone}</td>
                                                                        <td>${Cus.email}</td>
                                                                        <td>${Cus.dob}</td>
                                                                        <td>${R.price}</td>
                                                                        <td class="text-success">${R.status}</td>
                                                                        <c:choose>
                                                                            <c:when test="${R.status == 'RENTING'}">
                                                                               <td>                                                    
<<<<<<< HEAD
                                                                                    <a href="viewRoom.jsp">
                                                                                        <button class="btn btn-warning" title="View"><i class="fa fa-eye"></i></button>
                                                                                    </a>
                                                                                    <a href="editRoom.jsp">
                                                                                        <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                                                    </a>
                                                                                    <button class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                                                    
=======
                                                                                    
                                                                                    <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}&HostelID=${Hos.hostelID}}">
                                                                                        <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                                                    </a>
                                                                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}}">                                                                                        
                                                                                        <button class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                                                    </a>
>>>>>>> AvillXx
                                                                                </td>
                                                                            </c:when>                                                                   
                                                                            <c:otherwise>
                                                                                <td>                                                    
                                                                                    <a href="AddNewCustomer.jsp">
                                                                                        <button class="btn btn-warning" title="View"><i class="fa fa-add"></i> Thêm Khách</button>
                                                                                    </a>    
                                                                                </td>
                                                                            </c:otherwise>    
                                                                        </c:choose>                                                               
                                                                    </tr> 
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>    
                                                                
                                                            
                                                    
                                                </c:if>   
<<<<<<< HEAD
                                            </c:forEach> 
=======
                                            </c:forEach>
                                        </c:forEach> 
>>>>>>> AvillXx
                                        </tbody>
                                    </table>
                                </div>

                            </div>
<<<<<<< HEAD
                            </c:forEach> 
=======
                            
>>>>>>> AvillXx
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
        <script src="${pageContext.request.contextPath}../js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
        <script src="${pageContext.request.contextPath}/assets/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>    
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    </body>

</html>