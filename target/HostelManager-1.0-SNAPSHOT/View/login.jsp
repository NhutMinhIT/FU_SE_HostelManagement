<%-- 
    Document   : lgoin
    Created on : May 23, 2022, 3:49:54 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> Welcome to MoonHostel</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/fav.jpg">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style1.css" />

    </head>

    <body>
        <div class="container-fluid conya">
            <div class="side-left">
                <div class="sid-layy">
                    <div class="row slid-roo">
                        <div class="data-portion">
                            <h2>Manage Your Hostel</h2>
                            <p>We are always be with you...<3</p>
                            <ul>
                                <li>Phone :- +84 975654543</li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="side-right">
                <img class="logo rounded-circle" style="width: 30%" src="assets/img/logo.png" alt="">

                <h3>Login</h3>
                <form action="${pageContext.request.contextPath}/MainController" method="POST">
                    <div class="form-row">
                        <label for="">Emai</label>
                        <input type="text" placeholder="Email hoặc số điện thoại" class="form-control form-control-sm" name="email" required pattern="\S+" >
                    </div>

                    <div class="form-row">
                        <label for="">Mật Khẩu</label>
                        <input type="password" placeholder="Mật Khẩu" class="form-control form-control-sm" name="password" required pattern="\S+">
                    </div>

                    <div class="form-row row skjh">
<!--                        <div class="col-7 left no-padding">
                            <input type="checkbox">Nhớ Mật Khẩu
                        </div>
                        <div class="col-5">
                            <span> <a href="">Quên Mật Khẩu ?</a></span>
                        </div>-->
                        <p class="help-block alert-danger">${requestScope.ERROR}</p>

                    </div>
                    <div></div>

                    <div class="form-row dfr">
                        <input type="submit" class="btn btn"  name="action" value="Login">
                    </div>
                </form>



            </div>
            <div class="copyco">
                <p>Copyrigh 2022 @ MoonHostel</p> 
            </div>
        </div>  
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

    </body>




</html>