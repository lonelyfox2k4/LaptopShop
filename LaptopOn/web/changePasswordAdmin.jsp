<%-- 
    Document   : changePassword
    Created on : Oct 10, 2024, 11:02:18 AM
    Author     : CELESTIALS
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
                <h2 style="color: red">${requestScope.error}</h2>
                <h2 style="color: black">Change password Admin</h2>
                <form action="changex" method="post">
                    <input type="text" id="login" class="fadeIn second" name="user" placeholder="UserName">
                    <input type="password" id="password" class="fadeIn second" name="pass" placeholder="Password">
                    <input type="password" id="password" class="fadeIn second" name="passchange" placeholder="Change Password">
                    <input type="submit" class="fadeIn fourth" value="Change">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="loginAdmin">Login</a> &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </div>
    </body>
</html>
