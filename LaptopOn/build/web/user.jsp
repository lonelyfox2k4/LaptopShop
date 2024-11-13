<%-- 
    Document   : user
    Created on : Oct 10, 2024, 11:02:18 AM
    Author     : CELESTIALS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/style_2.css">
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
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <a href="home" class="logo" style="margin-right: 150px">
                    <img src="img/logo.png" alt="">
                </a>
                <div id="menu">
                    <div class="item">
                        <a href="home">Trang chủ</a>
                    </div>
                    <div class="item">
                        <div class="dropdown show">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Laptop
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="product?hang=${0}">Tất cả các laptop</a>
                                <c:forEach items="${requestScope.product_categorys1}" var="it">
                                    <a class="dropdown-item" href="product?hang=${it.id}">${it.name}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="dropdown show">
                            <a class="dropdown-toggle" href="phukien" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Phụ Kiện
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="phukien?product_category=${0}">Tất cả các phụ kiện</a>
                                <c:forEach items="${requestScope.product_categorys2}" var="it">
                                    <a class="dropdown-item" href="phukien?loaisp=${it.id}">${it.name}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <a href="lienhe">Liên hệ</a>
                    </div>
                </div>
                <div id="actions">
                    <c:if test="${sessionScope.user == null}">
                        <div class="item">
                            <a href="login" style="margin-left: 200px"><img src="img/user.png" alt=""></a>
                        </div> 
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <div class="item row"style="width: 210px; display: flex; align-items: center">
                            <img src="${sessionScope.user.img}" style="    width: 15%;
                                 border-radius: 100px;" alt="alt"/>
                            <a href="user" style="color: black">${sessionScope.user.fullname}</a>
                            <a href="history" style="color: black"><img style="    width: 30px;
                                                                        padding-left: 10px;" src="img/326655_history_icon.png" alt="alt"/></a>
                        </div> 
                    </c:if>
                    <c:if test="${requestScope.size != null}">
                        <div class="item" style="position: relative;">
                            <a href="cart"><img src="img/cart.png" alt=""></a>
                            <span style="position: absolute;
                                  color: #fff;
                                  font-size: 10px;
                                  background-color: #e83859;
                                  width: 15px;
                                  line-height: 15px;
                                  display: inline-block;
                                  text-align: center;
                                  border-radius: 50px;
                                  top: -3px;
                                  right: -4px;">${requestScope.size}
                            </span>
                        </div> 
                    </c:if>
                    <c:if test="${requestScope.size == null}">
                        <div class="item" style="position: relative;">
                            <a href="cart"><img src="img/cart.png" alt=""></a>
                            <span style="position: absolute;
                                  color: #fff;
                                  font-size: 10px;
                                  background-color: #e83859;
                                  width: 15px;
                                  line-height: 15px;
                                  display: inline-block;
                                  text-align: center;
                                  border-radius: 50px;
                                  top: -3px;
                                  right: -4px;">0
                            </span>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="container">
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
                          ">Hồ sơ của tôi</h1>
                        <div class="_7YJbRU" style="
                             margin-top: 0.1875rem;
                             font-size: .875rem;
                             line-height: 1.0625rem;
                             color: #555;
                             ">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
                    </div>

                    <div style="padding-top: 28px;">
                        <form action="checkout">
                            <input style="background-color: #dfd7d7;
                                   border-radius: 30px;
                                   padding: 10px;
                                   border: none;" type="submit" value="Đăng xuất">
                        </form>
                    </div>
                </div>
                <c:set value="${sessionScope.user}" var="user" />
                <h1 style="color: red;font-family: auto">${requestScope.error}</h1>
                <form action="user" method="post" enctype="multipart/form-data">
                    <div class="row" style="margin-top: 20px; border-bottom: solid 1px #ece4e4; ">
                        <div class="col-md-8" style="border-right: solid 1px #dfd4d4; padding-left: 160px; padding-top: 50px;" >
                            <table class="Zj7UK+" style="font-family: auto"; >
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">Tên đăng nhập:</label>
                                    </td>
                                    <td class="Tmj5Z6">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px"><input style="border: none" type="text" name="email" readonly="" value="${user.email}"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">Tên:</label>
                                    </td>
                                    <td class="Tmj5Z6">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px">${user.fullname}</div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">Số điện thoại: </label>
                                    </td>
                                    <td class="Tmj5Z6">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px">${user.phone}</div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espR83">
                                        <label style="margin: 0px">Password: </label>
                                    </td>
                                    <td class="Tmj5Z6" style="display: flex">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px">*********</div>
                                        </div> &nbsp;&nbsp;&nbsp;
                                        <a href="changePassword">Thay đổi</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-4">
                            <div style="text-align: center">
                                <img src="${user.img}" alt="alt" style="width: 40%; border-radius: 100px; margin-bottom: 20px"/>
                                <h2 style="font-family: auto; font-size: 18px">Vui lòng file có kết thúc bằng .jpg hoặc .png</h2>
                                <input type="file" class="form-control" name="photo" placeholder="Enter photo" value="${requestScope.link}" required="">
                            </div>
                        </div>
                        <input type="submit" value="Lưu" style="margin: 20px 0px;
                               padding: 10px 40px;
                               margin-left: 520px;
                               background-color: #979191;
                               color: white;
                               border-radius: 20px;">
                    </div>

                </form>
            </div>
            <div id="footer" style="height: 265px">
                <div class="box">
                    <div class="logo">
                        <a href="home"><img src="img/logo.png" alt=""></a>
                    </div>
                    <p>Cung cấp sản phẩm với chất lượng tuyệt vời nhất cho quý khách</p>
                </div>
                <div class="box">
                    <h3>NỘI DUNG</h3>
                    <ul class="quick-menu">
                        <div class="item">
                            <a href="home">Trang chủ</a>
                        </div>
                        <div class="item">
                            <a href="product">Laptop</a>
                        </div>
                        <div class="item">
                            <a href="phukien">Phụ kiện</a>
                        </div>
                        <div class="item">
                            <a href="lienhe">Liên hệ</a>
                        </div>
                    </ul>
                </div>
                <div class="box">
                    <h3>LIÊN HỆ</h3>
                    <a href="lienhe"><button style="    background-color: #776e6e;
                                             color: white;
                                             padding: 10px 20px;
                                             margin-top: 40px;">Nhận tin</button></a>
                </div>
            </div>              
        </div>
    </body>
</html>
