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

                <h2>Login into Your Account</h2>
                <form action="${pageContext.request.contextPath}/MainController" method="POST">
                    <div class="form-row">
                        <label for="">Email ID</label>
                        <input type="text" placeholder="yourname@company.com" class="form-control form-control-sm" name="email">
                    </div>

                    <div class="form-row">
                        <label for="">Password</label>
                        <input type="password" placeholder="Password" class="form-control form-control-sm" name="password">
                    </div>

                    <div class="form-row row skjh">
                        <div class="col-7 left no-padding">
                            <input type="checkbox">Keep me Sign In
                        </div>
                        <div class="col-5">
                            <span> <a href="">Forget Password ?</a></span>
                        </div>
                    <p class="help-block alert-danger">${requestScope.ERROR}</p>

                    </div>
                    <div></div>

                    <div class="form-row dfr">
                        <input type="submit" class="btn btn"  name="action" value="Login">
                    </div>
                </form>

                <div class="ord-v">
                    <a href="or login with"></a>
                </div>

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
<<<<<<< HEAD
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
=======
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

>>>>>>> 1500ba7ce6cfbf43419f8729ff4e00e3c6f82d0f
    </body>




</html>