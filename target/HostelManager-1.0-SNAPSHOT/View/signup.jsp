
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>SignUp</title>

        <link rel="shortcut icon" href="../assets/images/fav.jpg">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/fontawsom-all.min.css">
        <link rel="stylesheet" type="text/css" href="../css/style1.css" />
    </head>

    <body>
        <div class="container-fluid conya">
            <div class="side-left">
                <div class="sid-layy">
                    <div class="row slid-roo">
                        <div class="data-portion">
                            <h2>Manage Your Hostel</h2>
                            <p>We are always with you...<3</p>
                            <ul>
                                <li>Phone :- +84 975654543</li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="side-right">
                <img class="logo rounded-circle" style="width: 30%; margin-bottom: 10px" src="../assets/img/logo.png" alt="">

                <h3>SIGN UP</h3>
                <form action="">
                    <div class="form-row">
                        <label for="username">Tên Đăng Nhập</label>
                        <input type="text" placeholder="yourname@gmail.com" name="email" class="form-control form-control-sm" required pattern="\S+">
                    </div>

                    <div class="form-row">
                        <label for="password">Mật Khẩu</label>
                        <input onChange="onChange()" type="password" size="60" placeholder="Mật Khẩu" name="Pass" required pattern="\S+" class="form-control form-control-sm">
                    </div>
                    <div class="form-row">
                        <label for="repassword">Nhập Lại Mật Khẩu</label>
                        <input onChange="onChange()" type="password" size="60" placeholder="Nhập Lại Mật Khẩu" name="repassword" required pattern="\S+" class="form-control form-control-sm">
                    </div>

                    <p>Bạn đã có tài khoản?  <a href ="login" style="color: red">Đăng Nhập</a></p>

                    <div class="dfr">
                        <a href="login.jsp">
                            <button type="submit" class="btn btn-sm btn-success">Đăng Kí</button>
                        </a>
                    </div>

                </form>
                <div class="soc-det">
                    <ul>
                        <li class="facebook"><a href="https://www.facebook.com"><i class="fa-brands fa-facebook-f"></i></a></li>
                        <li class="twitter"><a href="https://twitter.com/"><i class="fa-brands fa-twitter"></i></a></li>
                        <li class="link"><a href="https://www.linkedin.com/"><i class="fa-brands fa-linkedin"></i></a></li>
                    </ul>
                </div>


            </div>
            <div class="copyco">
                <p>Copyrigh 2022 @ MoonHostel</p> 
            </div>
        </div>  

        <script src="../assets/js/jquery-3.2.1.min.js"></script>
        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/script.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    </body>

    <script>
                            function onChange() {
                                const password = document.querySelector('input[name=Pass]');
                                const confirm = document.querySelector('input[name=repassword]');
                                if (confirm.value === password.value) {
                                    confirm.setCustomValidity('');
                                } else {
                                    confirm.setCustomValidity('Passwords do not match');
                                }
                            }
    </script>


</html>