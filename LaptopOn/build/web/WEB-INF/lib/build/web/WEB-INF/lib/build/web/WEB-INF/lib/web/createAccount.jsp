<%-- 
    Document   : createAccount
    Created on : Feb 14, 2024, 9:09:30 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row py-5 mt-4 align-items-center">
                <!-- For Demo Purpose -->
                <div class="col-md-5 pr-lg-5 mb-5 mb-md-0 c text-center">
                    <div class="logo">
                        <img src="img/logo.png" alt=""
                             class="img-fluid mb-3 d-none d-md-block">
                    </div>
                    <h1>Create an Account</h1>
                </div>

                <!-- Registeration Form -->
                <div class="col-md-7 col-lg-6 ml-auto">
                    <h2 style="text-align: center; color: red">${requestScope.error}</h2>
                    <form action="createAccount" method="post">
                        <div class="row">
                            <!-- First Name -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input style="margin: 0px" id="firstName" type="text" name="firstname" placeholder="First Name"
                                       class="form-control bg-white border-left-0 border-md" />
                            </div>

                            <!-- Last Name -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input style="margin: 0px" id="lastName" type="text" name="lastname" placeholder="Last Name"
                                       class="form-control bg-white border-left-0 border-md" />
                            </div>

                            <!-- Email Address -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted"></i>
                                    </span>
                                </div>
                                <input id="email" type="email" name="email" placeholder="Email Address (Account)"
                                       class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Phone Number -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-phone-square text-muted"></i>
                                    </span>
                                </div>

                                <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number"
                                       class="form-control bg-white border-md border-left-0 pl-3">
                            </div>.

                            <!-- Password -->
                            <div class="row pass">
                                <div class="input-group col-lg-6 mb-4">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-white px-4 border-md border-right-0">
                                            <i class="fa fa-lock text-muted"></i>
                                        </span>
                                    </div>
                                    <input id="password" type="password" name="pass" placeholder="Password"
                                           class="form-control bg-white border-left-0 border-md">
                                </div>

                                <!-- Password Confirmation -->
                                <div class="input-group col-lg-6 mb-4">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-white px-4 border-md border-right-0">
                                            <i class="fa fa-lock text-muted"></i>
                                        </span>
                                    </div>
                                    <input style="margin: 0px" id="passwordConfirmation" type="password" name="passconfim"
                                           placeholder="Confirm Password"
                                           class="form-control bg-white border-left-0 border-md">
                                </div>
                            </div>


                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0" style="padding: 0px; margin-left: -8px !important;">
                                <input type="submit" class="btn btn-primary btn-block py-2" value="Create your account">
                                </input>
                            </div>



                        </div>
                    </form>
                    <!-- Divider Text -->
                    <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                        <div class="border-bottom w-100 ml-5"></div>
                        <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                        <div class="border-bottom w-100 mr-5"></div>
                    </div>


                    <!-- Already Registered -->
                    <div class="text-center w-100">
                        <p class="text-muted font-weight-bold">Already Registered? <a href="login" class="text-primary ml-2">Login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
