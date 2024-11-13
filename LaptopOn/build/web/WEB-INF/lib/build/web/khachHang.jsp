<%-- 
    Document   : khachHangf
    Created on : Mar 7, 2024, 2:30:09 PM
    Author     : admin
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
        <link rel="stylesheet" href="CSS/style_4.css" type="text/css" />
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

            <div class="head" style="display: flex; justify-content: space-evenly">
                <div class="col-div-4">
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav">☰ Home</span>
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav2">☰ Home</span>
                </div>
                <div class="col-div-8">
                    <form action="khachHang">
                        <label for="search">Search</label>
                        <input id="search" name="key" placeholder="Search by email" value="" type="search" pattern=".*\S.*" required>
                        <span class="caret"></span>
                    </form>
                </div>
                <div class="col-div-3">
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
            <br /><br />
            <div class="col-div-12">
                <div class="content-box">
                    <p>Thông tin tài khoản</p>
                    <br />
                    <table>
                        <tr>
                            <th style="width: 5%;">ID</th>
                            <th style="width: 15%;">Tên</th>
                            <th style="width: 25%;">Email(Account)</th>
                            <th style="width: 20%;">Password</th>
                            <th style="width: 15%;">Số điện thoại</th>
                            <th style="width: 10%;">Ảnh đại diện</th>
                            <th style="width: 15%; text-align: center">chỉnh sửa</th>
                        </tr>
                        <c:forEach items="${requestScope.listUser}" var="p">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.fullname}</td>
                                <td>${p.email}</td> 
                                <td>${p.pass}</td>
                                <td>${p.phone}</td>
                                <td><img style="width: 50%;
                                         border-radius: 100px;" src="${p.img}" alt="alt"/></td>
                                <td style="text-align: center"><a href="edipUser?id=${p.id}" style="color: white"><i class="fas fa-edit"></i></a></td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
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
