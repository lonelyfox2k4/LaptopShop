<%-- 
    Document   : login
    Created on : Feb 14, 2024, 9:16:31 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="CSS/style.css">
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="fadeIn first">
                    <a href="home">
                        <img class="login_img" src="img/logo.png" alt="User Icon" />
                    </a>
                </div>

                <!-- Login Form -->
                <h3 style="color: red;font-size: 25px;">${requestScope.error}</h3>
                <form action="login" method="post">
                    <input type="text" style="background-color: #f6efefab;"  id="login" class="fadeIn second" name="user" placeholder="UserName">
                    <input type="password" style="padding: 16px 92px;
                           background-color: #f6efefab;
                           text-align: center; border: none;" id="password" class="fadeIn third" name="pass" placeholder="Password">
                    <input type="submit" class="fadeIn fourth" value="Log In">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="createAccount">Create Account</a> &nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="underlineHover" href="changePassword">Change Password</a>
                </div>
            </div>
        </div>
    </body>
</html>
