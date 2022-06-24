<%-- 
    Document   : addnewrom
    Created on : May 31, 2022, 7:17:06 AM
    Author     : Dell
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png" sizes="16x16">
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
                            <h1 class="text-info">Danh sách dịch vụ</h1>
                        </div>
                        <div class="card-body ml-auto">
                            <a href="${pageContext.request.contextPath}/MainController?action=AddService">
                                <button class="btn btn-success"><i class="fa fa-plus"></i> Thêm dịch vụ</button>
                            </a>
                        </div>

                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Tên dịch vụ</th>
                                        <th>Loại dịch vụ</th>
                                        <th>Ngày cập nhật</th> 
                                        <th>Địa điểm</th>
                                        <th>Giá</th>                                     
                                        <th>Đơn vị</th>
                                        <th>Đang dùng</th>
                                        <th>Chức Năng</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Tên dịch vụ</th>
                                        <th>Loại dịch vụ</th>
                                        <th>Ngày cập nhật</th> 
                                        <th>Địa điểm</th>
                                        <th>Giá</th>                                     
                                        <th>Đơn vị</th>
                                        <th style="width: 20%">Đang sử dụng</th>
                                        <th>Chức Năng</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <c:forEach items="${ServiceDetailList}" var="SD">   
                                        <tr>
                                            <td>${SD.detailname}</td>
                                            <c:forEach items="${ServiceTypeList}" var="ST">   
                                                <c:if test="${ST.serviceID == SD.serviceID}">
                                                    <td>${ST.service_name}</td>
                                                </c:if>                                                
                                            </c:forEach>

                                            <td>${SD.updated_date}</td>

                                            <c:forEach items="${HostelList}" var="H">   
                                                <c:if test="${H.hostelID == SD.hostelID}">
                                                    <td>${H.hostelname}</td>
                                                </c:if>                                                
                                            </c:forEach>

                                            <td><input type="text" name="" class="money form-control" value="${SD.unit_price}" disabled="disable" style="width: 100%"/></td>                                     
                                            <td>${SD.calUnit}</td>

                                            <c:choose>
                                                <c:when test="${SD.status == 'ACTIVE'}">
                                                    <td style="text-align: center"><input type="checkbox" checked disabled="disabled" /></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td style="text-align: center"><input type="checkbox" disabled="disabled" /></td>
                                                </c:otherwise>
                                            </c:choose>

                                            <td>
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateService&detailID=${SD.detailID}">
                                                    <button class="btn btn-primary"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteService&detailID=${SD.detailID}">
                                                    <button class="btn btn-danger"><i class="fa fa-remove"></i></button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
              
                                </tbody>
                            </table>
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
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/simple.money.format.js"></script>
        <script type="text/javascript">
            $('.money').simpleMoneyFormat();
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
