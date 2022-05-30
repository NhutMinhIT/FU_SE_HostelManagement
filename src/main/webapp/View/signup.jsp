<%-- 
    Document   : signin
    Created on : Feb 18, 2022, 9:14:44 PM
    Author     : Nhut Minh
--%>

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
        <link href="../css/signup.css" rel="stylesheet" />
        <link href="../css/stylesignin.css" rel="stylesheet" />
    </head>
    <body>



        <div>
            <div class="background">
                <div class="shape"></div>
                <div class="shape"></div>
            </div>
            <form action="./signup">
                <h3>Sign Up</h3>
                <p class="help-block alert-danger" style="color: red">${requestScope.MSG_SIGNUP}</p>
                <label for="username">Username</label>
                <input type="text" placeholder="Username" name="username" >

                <label for="password">Password</label>

                <input onChange="onChange()"  type="password" size="60" placeholder="Password"  value="" name="Pass" required pattern="\S+"/><br>

                <label for="repassword">Re-Password</label>

                <input onChange="onChange()" type="password" size="60" value="" name="repassword" placeholder="Re-Password"  required pattern="\S+"/><br>

                <p class="help-block alert-danger">${requestScope.MSG_SIGNUP}</p>
                <p>Already have account?  <a href ="login" style="color: red">Login</a></p>
                <input type="submit" value="Sign Up" style="color: white; border-radius: 10px; background: orange; " id="btn">
            </form>
        </div>
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