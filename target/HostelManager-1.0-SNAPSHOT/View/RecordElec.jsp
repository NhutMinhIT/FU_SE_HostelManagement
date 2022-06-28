<%-- 
    Document   : ReacordElectric
    Created on : Jun 28, 2022, 10:52:33 AM
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
                            <h1 class="text-info"><i class="fa fa-bolt"></i> Chỉ Số Điện</h1>
                        </div>                      

                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead style="font-size: 17px">
                                    <tr>
                                        <th>Nhà</th>
                                        <th>Phòng</th>
                                        <th>Khách Thuê</th> 
                                        <th>Chỉ Số Điện Cũ</th>                                        
                                        <th>Chỉ Số Điện Mới</th> 
                                        <th>Sử Dụng</th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tfoot style="font-size: 17px">
                                    <tr>
                                        <th>Nhà</th>
                                        <th>Phòng</th>
                                        <th>Khách Thuê</th> 
                                        <th>Chỉ Số Điện Cũ</th>
                                        <th>Chỉ Số Điện Mới</th>
                                        <th>Sử Dụng</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td>Moon</td>
                                        <td>2</td>
                                        <td>Phạm Minh Trí</td>
                                        <td>
                                            <input name="chisodien" value="0" style="width: 100%" />
                                        </td>
                                        <td>
                                            <input name="chisodien" value="0" style="width: 100%"/>
                                        </td>
                                        <td>
                                            <input name="sudung" value="0"disabled="" style="width: 100%"/>
                                        </td>
                                        <td>                                            
                                            <button type="button" class="rounded-3" ><i class="fa fa-save" ></i> Lưu</button> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Moon</td>
                                        <td>1</td>
                                        <td>Phạm Minh Trí</td>
                                        <td>
                                            <input name="chisodien" value="0"style="width: 100%" />
                                        </td>
                                        <td>
                                            <input name="chisodien" value="0"style="width: 100%" />
                                        </td>
                                        <td>
                                            <input name="sudung" value="0" disabled="" style="width: 100%"/>
                                        </td>
                                        <td>                                            
                                            <button type="button" class="rounded-3" ><i class="fa fa-save" ></i> Lưu</button> 
                                        </td>
                                    </tr>

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

