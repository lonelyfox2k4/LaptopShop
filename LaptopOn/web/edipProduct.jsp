<%-- 
    Document   : edipProduct
    Created on : Oct 10, 2024, 11:02:18 AM
    Author     : CELESTIALS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        
        <link rel="stylesheet" href="CSS/style_1.css" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <!-- Option 1: Include in HTML -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    </head>
    <body style="background-color: #1b203d">
        <div id="mySidenav" style="height: max-content; position: fixed; height: 1000px" class="sidenav">
            <p class="logo"><img style="border-radius: 100px" src="img/logo.png" alt=""></p>
            <a style="height: 80px" href="admin" class="icon-a"><i class="fas fa-home icons"></i> Home</a>
            <a style="height: 80px" href="khachHang" class="icon-a"><i class="fas fa-users icons"></i> Khách hàng</a>
            <a style="height: 80px" href="sanPham" class="icon-a"><i class="fa fa-list icons"></i> Sản phẩm</a>
            <a style="height: 80px" href="donHangVaNhiemVu" class="icon-a"><i class="fa fa-shopping-bag icons"></i> Đơn hàng&nhiệm vụ</a>
            <a style="height: 80px" href="inforAdmin" class="icon-a"><i class="fa fa-user icons"></i> Accounts</a>

        </div>
        <div id="main" >

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

            <div class="clearfix"></div>
            <br />

            <div class="clearfix"></div>
            <br /><br />
            <c:set value="${requestScope.product}" var="p" />
            <div class="container">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12">
                            <h2 style="color: red" class="tm-block-title d-inline-block">Edit Product</h2>
                        </div>
                    </div>
                    <div class="row tm-edit-product-row" style="display: flex">
                        <h2 style="color: red">${requestScope.error}</h2>
                        <form action="edipProduct" method="post" class="col-md-12">
                            <div class="col-md-12 row">
                                <div class="col-md-6" style="color: white;">
                                    <div class="form-group mb-3">
                                        <label for="id">ID sản phẩm
                                        </label>
                                        <input value="${p.id}" style="color: black !important;" name="id" type="text" class="form-control validate" readonly="">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Tên sản phẩm
                                        </label>
                                        <input value="${p.name}" name="name" style="color: black !important;" type="text" class="form-control validate" required="">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="mota">Mô tả</label>
                                        <input value="${p.describe}" name="mota" style="color: black !important;" class="form-control validate" style="padding: 20px;" required=""></input>
                                    </div>

                                    <div class="row">
                                        <div class="form-group mb-3" style="    margin-left: 14px;">
                                            <label for="mota">Giá tiền</label>
                                            <input value="${p.prices}" name="price" style="color: black !important;" class="form-control validate" required=""></input>
                                        </div>
                                        <div class="form-group mb-3" style="    margin-left: 95px;">
                                            <label for="mota">Sale(Không bắt buộc)</label>
                                            <input value="${p.sale}" name="sale" style="color: black !important;" class="form-control validate"></input>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="mota">Năm sản xuất(Không bắt buộc)</label>
                                        <input value="${p.nsx}" name="nsx" style="color: black !important;" class="form-control validate" required=""></input>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-lg-6 col-md-6 mx-auto mb-4">
                                    <div class="custom-file mt-3 mb-3">
                                        <div style="text-align: center; margin-top: 30px">
                                            <div style="text-align: center; margin-top: 30px">
                                                <img src="${p.img}" alt="alt" style="width: 51%; margin-bottom: 20px"/>
                                                <h2 style="font-family: auto; font-size: 18px; color: white">Vui lòng file có kết thúc bằng .jpg hoặc .png</h2>
                                                <input type="file" class="form-control" style="color: black !important;" name="photo" placeholder="Enter photo" style="color: black" required="">
                                            </div>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="category">Loại sản phẩm</label>
                                            <select class="custom-select tm-select-accounts" name="category">
                                                <c:forEach items="${requestScope.listProduct_category}" var="p">
                                                    <option ${requestScope.category == p.id?"selected":""}  value="${p.id}">${p.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Edit Product Now</button>
                            </div>
                        </form>


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