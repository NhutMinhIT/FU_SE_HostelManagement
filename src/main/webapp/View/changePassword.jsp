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
        <link rel="icon" type="image/png" href="../assets/img/logo.png" sizes="16x16">
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

                <h3>ĐỔI MẬT KHẨU</h3>

                <form action="" method="POST">
                    <div class="form-row">
                        <label for="">Emai</label>
                        <input type="text" placeholder="yourname@gmail.com" class="form-control form-control-sm" name="email" required pattern="\S+" >
                    </div>

                    <div class="form-row">
                        <label for="">Mật Khẩu Hiện Tại</label>
                        <input onchange="onChange1()" id="passSQL" name="passSQL" type="hidden" class="form-control form-control-sm" value=""/>
                        <input onchange="onChange1()" id="OldPass" name="OldPass" type="password" placeholder="Mật khẩu hiện tại" class="form-control form-control-sm" required pattern="\S+"/>
                    </div>
                    <div class="form-row">
                        <label for="">Mật Khẩu Mới</label>
                        <input onChange="onChange()" type="password" placeholder="Mật khẩu Mới" class="form-control form-control-sm" name="NewPass" required pattern="\S+">
                    </div>
                    <div class="form-row">
                        <label for="">Xác Nhận Mật Khẩu Mới</label>
                        <input onChange="onChange()" type="password" placeholder="Mật khẩu Mới" class="form-control form-control-sm" name="ReNewPass" required pattern="\S+">
                    </div>
                    <div></div>

                    <div class="form-row dfr">
                        <input type="submit" class="btn btn"  name="action" value="ĐỔI MẬT KHẨU">
                    </div>
                </form>

                <div class="ord-v">
                    <a href="or login with"></a>
                </div>

                <div class="soc-det">
                    <ul>
                        <li class="facebook"><a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                        <li class="twitter"><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                        <li class="link"><a href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>

                    </ul>
                </div>

            </div>
            <div class="copyco">
                <p>Copyrigh 2022 @ MoonHostel</p> 
            </div>
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
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

    </body>

</html>