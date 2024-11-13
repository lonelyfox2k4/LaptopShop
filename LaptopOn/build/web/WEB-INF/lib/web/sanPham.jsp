<%-- 
    Document   : sanPham
    Created on : Mar 7, 2024, 11:58:01 PM
    Author     : admin
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không!!!")) {
                    window.location = "delete?id=" + id;
                }
            }
        </script>
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
                <div class="col-div-8" style="    margin-left: 120px;">
                    <form action="sanPham" style="display: flex">
                        <div>
                            <input style="padding: 10px 20px;" value="${requestScope.name}" id="search" name="name" placeholder="Search by name" type="search" pattern=".*\S.*">
                        </div>
                        <div class="form-group">
                            <select style="padding: 10px 20px;" id="inputState" class="form-control" name="hang">
                                <option value="0" ${requestScope.hang == 0?"selected":""}>All</option>
                                <c:forEach items="${requestScope.listProduct_category}" var="hang">
                                    <option value="${hang.id}" ${requestScope.hang == hang.id?"selected":""}> ${hang.name} </option>
                                </c:forEach>
                            </select>
                        </div>
                        <input style="padding: 10px 20px;" type="submit" value="Search">
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
            <br />

            <div class="clearfix"></div>
            <br /><br />
            <div class="col-div-12">
                <div class="content-box">
                    <div class="col-div-8">
                        <div style="display: flex; align-items: center;justify-content: space-between"> <p>Thông tin sản phẩm</p> <a href="addProduct" style="    font-size: 30px;
                                                                                                                                     margin-right: 20px; color: white"><i class="fas fa-folder-plus"></i></a> </div>

                        <table style="    background-color: #50697f;
                               border-radius: 20px;">
                            <tr>
                                <th style="width: 5%;">ID</th>
                                <th style="width: 15%;">Tên</th>
                                <th style="width: 30%;">Mô tả</th>
                                <th style="width: 15%;">Giá</th>
                                <th style="width: 15%;">Sale</th>
                                <th style="width: 10%;">Năm sản xuất</th>
                                <th style="width: 15%; text-align: center">chỉnh sửa</th>
                            </tr>
                            <c:forEach items="${requestScope.listProduct}" var="p">
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${p.name}</td>
                                    <td>${p.describe}</td>
                                    <td><fmt:formatNumber value="${p.prices}" pattern="#,###"/> VNĐ</td>
                                    <td><fmt:formatNumber value="${p.sale}" pattern="#,###"/> VNĐ</td>
                                    <td>${p.nsx}</td>
                                    <td style="    /* text-align: center; */
                                        font-size: 25px;
                                        display: flex;
                                        /* align-items: flex-start; */
                                        flex-direction: column;
                                        text-align: center;"><a href="edipProduct?id=${p.id}" style="color: white"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;&nbsp;
                                        <a href="#" onclick="doDelete('${p.id}')" style="color: white"><i class="far fa-trash-alt"></i></a></td>
                                </tr> 
                            </c:forEach>
                        </table>
                        <div class="list-page" style="    margin-top: 50px;
                             margin-bottom: 20px;">
                            <c:forEach begin="${1}" end="${requestScope.num}"  var="i">
                                <a  style="text-decoration: none" href="sanPham?page=${i}&${key}"><div class="item" style="color: white;">${i}</div></a>
                                </c:forEach>
                        </div>
                    </div>
                    <div class="col-div-4">
                        <div style="display: flex; margin-left: 10px; align-items: center;justify-content: space-between; padding: 5px"> <p>Thông tin Product category</p></div>

                        <table style=" margin-left: 10px;   background-color: #50697f;
                               border-radius: 20px;">
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>chỉnh sửa</th>
                            </tr>
                            <c:forEach items="${requestScope.listProduct_category}" var="p">
                                <tr>
                                <form action="edipCategory">
                                    <td>${p.id}<input type="hidden" value="${p.id}"  style="font-size: 15px;  background-color: #50697f; color: white; border: none" readonly="" name="id"></td>
                                    <td><input type="text" value="${p.name}" style="font-size: 15px;  background-color: #50697f; color: white; border: none" name="name" required=""></td>
                                    <td style="text-align: center; font-size: 25px;padding-top: 25px;"><button type="submit"><i class="fas fa-edit"></i></button>&nbsp;&nbsp;&nbsp;
                                    </td>
                                </form>
                                </tr> 
                            </c:forEach>
                        </table>
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