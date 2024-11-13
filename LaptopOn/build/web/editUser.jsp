<%-- 
    Document   : inforAdmin
    Created on : Oct 10, 2024, 11:02:18 AM
    Author     : CELESTIALS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/style_1.css" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body>
        <div id="mySidenav" style="height: max-content; position: fixed; height: 1000px" class="sidenav">
            <p class="logo"><img style="border-radius: 100px" src="img/logo.png" alt=""></p>
            <a style="height: 50px" href="admin" class="icon-a"><i class="fas fa-home icons"></i> Home</a>
            <a style="height: 50px" href="khachHang" class="icon-a"><i class="fas fa-users icons"></i> Khách hàng</a>
            <a style="height: 50px" href="sanPham" class="icon-a"><i class="fa fa-list icons"></i> Sản phẩm</a>
            <a style="height: 50px" href="donHangVaNhiemVu" class="icon-a"><i class="fa fa-shopping-bag icons"></i> Đơn hàng&nhiệm vụ</a>
            <a style="height: 50px" href="inforAdmin" class="icon-a"><i class="fa fa-user icons"></i> Accounts</a>

        </div>
        <div id="main">

            <div class="head" style="    display: flex;
                 justify-content: space-evenly;">
                <div class="col-div-6">
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav">☰ Home</span>
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav2">☰ Home</span>
                </div>

                <div class="col-div-6">
                    <div class="profile">
                        <a style="text-decoration: none" href="inforAdmin">
                            <img style="border-radius: 616px;" src="${sessionScope.admin.img}" class="pro-img" />
                            <p>${sessionScope.admin.fullname} <span>supreme admin</span></p>
                        </a>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
            <br />

            <div class="clearfix"></div>
            <br /><br />
            <div class="col-div-12">

                <div class="row" style="display: flex;justify-content: space-between;border-bottom: 0.0625rem solid #efefef;">
                    <div class="cR7PgM" style="
                         padding: 1.125rem 0;"><h1 class="gHDAFM" style="
                          margin: 0;
                          font-size: 1.125rem;
                          font-weight: 500;
                          line-height: 1.5rem;
                          text-transform: capitalize;
                          color: #333;
                          font-family: auto;
                          color: white
                          ">Hồ sơ của người dùng</h1>
                        <div class="_7YJbRU" style="
                             margin-top: 0.1875rem;
                             font-size: .875rem;
                             line-height: 1.0625rem;
                             color: #f15c5c;
                             ">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
                    </div>
                </div>
                <c:set value="${requestScope.user}" var="u" />
                <h1 style="color: red;font-family: auto">${requestScope.error}</h1>
                <form action="edipUser" method="post" enctype="multipart/form-data">
                    <div class="row" style="margin-top: 20px; border-bottom: solid 1px #ece4e4; ">
                        <div class="col-md-8" style=" padding-left: 160px; padding-top: 50px;" >
                            <table class="Zj7UK+" style="font-family: auto"; >
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">First name: </label>
                                    </td>
                                    <td class="Tmj5Z6">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px"><input style="    border: none;
                                                                                                 padding: 0;
                                                                                                 background-color: #1b203d;
                                                                                                 color: white;
                                                                                                 font-family: auto;
                                                                                                 font-size: 18px;" type="text" name="firstname" value="${u.first_name}" required=""></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">Last name: </label>
                                    </td>
                                    <td class="Tmj5Z6">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px"><input style="    border: none;
                                                                                                 padding: 0;
                                                                                                 background-color: #1b203d;
                                                                                                 color: white;
                                                                                                 font-family: auto;
                                                                                                 font-size: 18px;" type="text" name="lastname" value="${u.last_name}" required=""></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">Email(Account): </label>
                                    </td>
                                    <td class="Tmj5Z6">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px"><input style="    border: none;
                                                                                                 padding: 0;
                                                                                                 background-color: #1b203d;
                                                                                                 color: white;
                                                                                                 font-family: auto;
                                                                                                 font-size: 18px;" type="text" name="email" value="${u.email}" required="" readonly=""></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">Password: </label>
                                    </td>
                                    <td class="Tmj5Z6">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px"><input style="    border: none;
                                                                                                 padding: 0;
                                                                                                 background-color: #1b203d;
                                                                                                 color: white;
                                                                                                 font-family: auto;
                                                                                                 font-size: 18px;" type="text" name="pass" value="${u.pass}" required=""></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">Phone: </label>
                                    </td>
                                    <td class="Tmj5Z6" style="display: flex">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px"><input style="    border: none;
                                                                                                 padding: 0;
                                                                                                 background-color: #1b203d;
                                                                                                 color: white;
                                                                                                 font-family: auto;
                                                                                                 font-size: 18px;" type="text" name="phone" value="${u.phone}" required=""></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-4" >
                            <div style="text-align: center; margin-top: 30px">
                                <img src="${u.img}" alt="alt" style="width: 150px; border-radius: 100px; margin-bottom: 20px"/>
                                <h2 style="font-family: auto; font-size: 18px; color: white">Vui lòng file có kết thúc bằng .jpg hoặc .png</h2>
                                <input type="file" class="form-control" name="photo" placeholder="Enter photo" style="color: white" required="">
                            </div>
                        </div>
                        <div>
                            <input type="submit" value="Lưu" style="margin: 4% 46%;
                                   padding: 10px 40px;
                                   background-color: #979191;
                                   color: white;
                                   border-radius: 20px;">
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

        $(".nav").click(function () {
            $("#mySidenav").css('width', '70px');
            $("#main").css('margin-left', '70px');
            $(".logo").css('visibility', 'hidden');
            $(".logo span").css('visibility', 'visible');
            $(".icon-a").css('visibility', 'hidden');
            $(".icons").css('visibility', 'visible');
            $(".nav").css('display', 'none');
            $(".nav2").css('display', 'block');
        });

        $(".nav2").click(function () {
            $("#mySidenav").css('width', '300px');
            $("#main").css('margin-left', '300px');
            $(".logo").css('visibility', 'visible');
            $(".icon-a").css('visibility', 'visible');
            $(".icons").css('visibility', 'visible');
            $(".nav").css('display', 'block');
            $(".nav2").css('display', 'none');
        });

    </script>
</div>
</body>
</html>
