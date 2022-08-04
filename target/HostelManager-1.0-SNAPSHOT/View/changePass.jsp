<%-- 
    Document   : bill
    Created on : Jul 20, 2022, 5:36:25 PM
    Author     : ASUS
--%>

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/styletable.css" rel="stylesheet" />

    </head>
    <body>

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">

            <main class="container-fluid">

                <h1 class="mx-4 col-md-4 text-info mb-4">ĐỔI MẬT KHẨU</h1>
                <hr>
                <div >
                    <form action="${pageContext.request.contextPath}/MainController" method="POST" >
                        <c:if test="${ERROR!=null}"> <h3 style="text-align: center; color: red">${ERROR}</h3></c:if>
                            <div class="row mt-2">
                                <div class="form-group row col-md-3 mt-2"></div>

                                <div class="form-group row col-md-6 mt-2">
                                    <label class="col-sm-4 col-form-label">Mật Khẩu Hiện Tại</label>
                                    <div class="col col-sm-8">                                   
                                        <input onchange="onChange1()" id="OldPass" name="OldPass" type="password" placeholder="Mật khẩu hiện tại" class="form-control form-control-sm" required pattern="\S+"/>
                                    </div>

                                </div>

                            </div>
                            <div class="row mt-2">
                                <div class="form-group row col-md-3 mt-2"></div>

                                <div class="form-group row col-md-6 mt-2">
                                    <label class="col-sm-4 col-form-label">Mật Khẩu Mới</label>
                                    <div class="col col-sm-8">
                                        <input onChange="onChange()" type="password" placeholder="Mật khẩu Mới" class="form-control form-control-sm" name="NewPass" required pattern="\S+">
                                    </div>     
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="form-group row col-md-3 mt-2"></div>
                                <div class="form-group row col-md-6 mt-2">
                                    <label class="col-sm-4 col-form-label">Xác Nhận Mật Khẩu Mới</label>
                                    <div class="col col-sm-8">
                                        <input onChange="onChange()" type="password" placeholder="Mật khẩu Mới" class="form-control form-control-sm" name="ReNewPass" required pattern="\S+">
                                    </div>
                                </div>
                            </div>

                            <div class="mt-2" style="text-align: center">
                                <button class="btn btn-success" type="submit" name="action" id="sumbitButton" value="ChangePass"><i class="fa fa-check"></i> Lưu </button>
                            </div>

                        </form>
                    </div>
                </main>

                <footer class="py-4 bg-light mt-5">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted ">Copyright &copy; by MoonHostel</div>
                        </div>
                    </div>
                </footer>
            </div>

            <script>
                function onChange() {
                    const password = document.querySelector('input[name=NewPass]');
                    const confirm = document.querySelector('input[name=ReNewPass]');
                    if (confirm.value === password.value) {
                        confirm.setCustomValidity('');
                    } else {
                        confirm.setCustomValidity('Passwords do not match');
                    }
                }
                function onChange1() {
                    const password1 = document.querySelector('input[name=passSQL]');
                    const confirm1 = document.querySelector('input[name=OldPass]');
                    if (confirm1.value === password1.value) {
                        confirm1.setCustomValidity('');

                    } else {
                        confirm1.setCustomValidity('Old Pass do not match!! Please input again Old Password!!!');
                    }
                }
            </script>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </body>
</html>