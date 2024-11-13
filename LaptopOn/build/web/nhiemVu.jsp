<%-- 
    Document   : khachHangf
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

            <div class="head" style="display: flex; justify-content: space-evenly">
                <div class="col-div-4">
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav">☰ Home</span>
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav2">☰ Home</span>
                </div>
                <div class="col-div-8">
                    <form action="nhiemVu" method="post">
                        <input id="search" name="key" placeholder="Search by id" style="padding: 10px 126px;
                               padding-left: 10px;
                               font-size: 15px;" value="" type="number" pattern=".*\S.*" required>
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
                            <th style="width: 15%;">User</th>
                            <th style="width: 10%;">Date</th>
                            <th style="width: 10%;">Trạng thái</th>
                            <th style="width: 20%;">Address</th>
                            <th style="width: 10%;">Phone</th>
                            <th style="width: 15%;">Tổng giá tiền</th>
                            <th style="width: 15%; text-align: center">chỉnh sửa</th>
                        </tr>
                        <c:forEach items="${requestScope.list}" var="sc">
                            <form action="edipCart">
                                <tr>
                                    <td><input type="text" style="width: 30px; text-align: center; background-color: #1b203d;
                                               color: white;
                                               border: none;
                                               font-size: 15px;" value="${sc.id}" name="id" readonly=""></td>
                                    <td>${sc.user.email}</td>
                                    <td>${sc.date}</td> 
                                    <td>
                                        <select style="    background-color: #1b203d;
                                                color: white;
                                                border: none;
                                                font-size: 15px;" name="trangthai" onchange="handleStatusChange()">
                                            <option ${sc.staus_order == "Đang liên hệ"?"selected":""} value="Đang liên hệ">Đang liên hệ</option>
                                            <option ${sc.staus_order == "Đang giao hàng"?"selected":""} value="Đang giao hàng">Đang giao hàng</option>
                                            <option ${sc.staus_order == "Hủy"?"selected":""} value="Hủy">Hủy</option>
                                            <option ${sc.staus_order == "Hoàn thành"?"selected":""} value="Hoàn thành">Hoàn thành</option>
                                        </select>
                                    </td>
                                    <td>${sc.adress}</td>
                                    <td>${sc.phone}</td>
                                    <td><fmt:formatNumber value="${sc.total_price}" pattern="#,###"/> VNĐ</td>
                                    <td style="text-align: center"><a href="viewCart?id=${sc.id}" style="color: white"><i class="fas fa-eye"></i></a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit"><i class="fas fa-check"></i></button></td>
                                </tr> 
                            </form>
                        </c:forEach>

                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function handleStatusChange() {
            var selectElement = document.getElementsByName("trangthai")[0];
            var selectedOption = selectElement.options[selectElement.selectedIndex];
            var newStatus = selectedOption.value;
            // Gửi yêu cầu AJAX đến máy chủ
            $.ajax({
                url: "/LaptopOn/nhiemVu", // Đường dẫn đến Servlet (thay đổi phù hợp)
                method: "POST", // Phương thức POST
                data: { status: newStatus }, // Dữ liệu gửi lên máy chủ
                success: function(response) {
                    // Xử lý kết quả trả về (nếu cần)
                    console.log("Kết quả từ máy chủ: " + response);
                },
                error: function(xhr, status, error) {
                    console.error("Lỗi khi gửi yêu cầu: " + error);
                }
            });
        }
    </script>
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
