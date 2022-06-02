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
        <title> Free Stylish Login Page Website Template | Smarteyeapps.com</title>

        <link rel="shortcut icon" href="../assets/images/fav.jpg">
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/fontawsom-all.min.css">
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
                <img class="logo rounded-circle" style="width: 30%" src="../assets/img/logo.png" alt="">

                <h2>SIGN UP</h2>

                <div class="form-row">
                    <label for="username">User name</label>
                    <input type="text" placeholder="User name" name="username" class="form-control form-control-sm">
                </div>

                <div class="form-row">
                    <label for="password">Password</label>
                    <input onChange="onChange()" type="password" size="60" placeholder="Password" name="Pass" required pattern="\S+" class="form-control form-control-sm">
                </div>
                <div class="form-row">
                    <label for="repassword">Re-password</label>
                    <input onChange="onChange()" type="password" size="60" placeholder="Re-password" name="repassword" required pattern="\S+" class="form-control form-control-sm">
                </div>

                <p>Already have account?  <a href ="login" style="color: red">Login</a></p>

                <div class="form-row dfr">
                    <button type="submit" class="btn btn-sm btn-success">Sign up</button>
                </div>


                <div class="soc-det">
                    <ul>
                        <li class="facebook"><i class="fab fa-facebook-f"></i></li>
                        <li class="twitter"><i class="fab fa-twitter"></i></li>
                        <li class="link"><i class="fab fa-linkedin-in"></i></li>
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