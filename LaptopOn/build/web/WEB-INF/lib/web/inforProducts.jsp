<%-- 
    Document   : inforProducts
    Created on : Mar 2, 2024, 10:59:55 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/style_3.css">
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
                    <div class="item row"style="width: 210px; display: flex">
                        <img src="${sessionScope.user.img}" style="    width: 20%;
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
                      margin-left: 60px;
                      font-size: 1.125rem;
                      font-weight: 500;
                      line-height: 1.5rem;
                      text-transform: capitalize;
                      color: #333;
                      font-family: auto;
                      font-size: 35px;
                      text-align: center;
                      ">${requestScope.laptop.name}</h1>
                </div>
                <c:set value="${requestScope.laptop}" var="p" />
                <div class="row">
                    <div class="col-md-5">
                        <img style="width: 100%" src="${p.img}" alt="alt"/>
                    </div>
                    <div class="col-md-7" style="padding: 25px 0px 0px 40px;">
                        <table class="Zj7UK+" style="font-family: auto"; >
                            <tr>
                                <td class="espR83">
                                    <label style="margin: 0px">Giá tiền: </label>
                                </td>
                                <td class="Tmj5Z6">
                                    <c:if test="${p.sale != 0}">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px; font-size: 40px; color: red"><fmt:formatNumber value="${p.sale}" pattern="#,###"/> VNĐ</div>
                                            <div class="W50dp5" style="margin-left: 10px; text-decoration-line: line-through;font-size: 20px;color: #7e7373;"><fmt:formatNumber value="${p.prices}" pattern="#,###"/> VNĐ</div>
                                        </div>
                                    </c:if>
                                    <c:if test="${p.sale == 0}">
                                        <div>
                                            <div class="W50dp5" style="margin-left: 10px; ; font-size: 40px; color: red"><fmt:formatNumber value="${p.prices}" pattern="#,###"/> VNĐ</div>
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td class="espR83">
                                    <label style="margin: 0px">Loại SP:</label>
                                </td>
                                <td class="Tmj5Z6">
                                    <div>
                                        <div class="W50dp5" style="margin-left: 10px">${p.product_category.name}</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="espR83">
                                    <label style="margin: 0px">Mô tả: </label>
                                </td>
                                <td class="Tmj5Z6">
                                    <div>
                                        <div class="W50dp5" style="margin-left: 10px">${p.describe}</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="espR83">
                                    <label style="margin: 0px">Tình trạng máy: </label>
                                </td>
                                <td class="Tmj5Z6">
                                    <div>
                                        <div class="W50dp5" style="margin-left: 10px">Hàng Outlet, Nhập Khẩu, Hàng mới 100%</div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="buy-now">
                            <form action="buy" method="get">
                                <input type="hidden" name="id" value="${p.id}">
                                <input type="submit" class="btn btn-block" value="Thêm vào giỏ hàng" style="background: rgb(237, 193, 54); text-align: center;
                                       font-size: 20px;
                                       font-weight: 500;
                                       color: #fff;
                                       background: #e10000;
                                       height: 60px;
                                       text-transform: uppercase;
                                       margin-top: 90px;"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <h1 style="font-family: auto;margin-top: 20px">Các sản phẩm liên quan</h1>
            <div class="row" style="margin-top: 20px">
                <c:forEach items="${requestScope.products}" var="it">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-6 m-0 p-0 box-4">
                        <div class="accessories__border accessories__productpage">
                            <div class="product-item-2 accessories__item">
                                <div style="height: 270px; margin-bottom: 80px">
                                    <a href="inforProducts?id=${it.id}" class="wrap-img">
                                        <img style="width: 100%; " src="${it.img}" class="owl-lazy lazy">
                                    </a>
                                </div>
                                <div class="body">
                                    <a href="inforProducts?id=${it.id}">
                                        <h3 class="name" style="font-size: 20px; color: black">${it.name}</h3>
                                    </a>
                                    <span style="color: red" class="price"><fmt:formatNumber value="${it.prices}" pattern="#,###"/> VNĐ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
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
    </body>
</html>

