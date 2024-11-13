<%-- 
    Document   : donHangVaNhiemVu
    Created on : Mar 9, 2024, 12:49:12 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="head" style="display: flex; justify-content: space-around">
                <div class="col-div-4">
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav">☰ Home</span>
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav2">☰ Home</span>
                </div>
                <div class="col-div-8">
                    <div class="profile">
                        <a style="text-decoration: none" href="inforAdmin">
                            <img style="border-radius: 616px;" src="${sessionScope.admin.img}" class="pro-img" />
                            <p>${sessionScope.admin.fullname} <span>supreme admin</span></p>
                        </a>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-div-3">
                <div class="box">
                    <p>${requestScope.khachhang}<br /><span>Khách hàng</span></p>
                    <i class="fa fa-users box-icon"></i>
                </div>
            </div>
            <div class="col-div-3">
                <div class="box">
                    <p>${requestScope.sanpham}<br /><span>Sản phẩm</span></p>
                    <i class="fa fa-list box-icon"></i>
                </div>
            </div>
            <div class="col-div-3">
                <div class="box">
                    <p>${requestScope.dondathang}<br /><span>Đơn đặt hàng</span></p>
                    <i class="fa fa-shopping-bag box-icon"></i>
                </div>
            </div>
            <div class="col-div-3">
                <div class="box">
                    <p>${requestScope.nhiemvu}<br /><span>Nhiệm vụ</span></p>
                    <i class="fa fa-tasks box-icon"></i>
                </div>
            </div>
            <div class="clearfix"></div>
            <br /><br />
            <div class="col-div-12">
                <div class="card-body">
                    <div class="row" style="display: flex; margin-top: 150px">
                        <div class="col-div-6" >
                            <div class="card">
                                <div class="card-body" style="text-align: center;
                                     background-color: white;
                                     width: 300px;
                                     margin-left: 135px;"> 
                                    <h1 style="background-color: #d3c7c7; margin: 0px; padding: 20px" class="card-title">Đơn đặt hàng</h1>
                                    <p class="card-text" style="font-size: 15px">Có thể xem và xóa đơn đặt hàng rõ thông tin của từng đơn hàng</p>
                                    <a href="donHang"><button style="    padding: 5px 135px;
                                                              border: none;
                                                              font-size: 30px;"> <i class="fas fa-search"></i></button></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-div-6" >
                            <div class="card">
                                <div class="card-body" style="text-align: center;
                                     background-color: white;
                                     width: 300px;
                                     ;margin-left: 135px;"> 
                                    <h1 style="background-color: #d3c7c7; margin: 0px; padding: 20px" class="card-title">Nhiệm vụ</h1>
                                    <p class="card-text" style="font-size: 15px">Liên hệ khách hàng giải quyết đơn hàng thanh toán nhanh gọn</p>
                                    <a href="nhiemVu"><button style="    padding: 5px 135px;
                                                              border: none;
                                                              font-size: 30px;"> <i class="fas fa-search"></i></button></a>
                                </div>
                            </div>
                        </div>
                    </div>
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