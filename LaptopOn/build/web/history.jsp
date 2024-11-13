<%-- 
    Document   : history.jsp
    Created on : Oct 10, 2024, 11:02:18 AM
    Author     : CELESTIALS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <!-- Option 1: Include in HTML -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
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
        <div id="banner" style="background-image: url('img/banner.jpg')">
            <div class="box-left">
                <h2>
                    <span>Laptop</span>
                    <br>
                    <span>Tốt Nhất</span>
                </h2>
                <p>Mang đến cho bạn những sản phẩm laptop tốt và đẳng cấp nhất</p>
                <a href="product"><button>Mua ngay</button></a>
            </div>
            <div class="box-right"  >
                <img src="img/img_1.jpg" alt="">
                <img src="img/img_2.jpg" alt="">
                <img src="img/img_3.jpg" alt="">
            </div>
            <div class="to-bottom">
                <a href="">
                    <img src="img/to_bottom.png" alt="">
                </a>
            </div>s
        </div>
        <div class="container">
            <c:if test="${requestScope.order == null}">
                <h1 style="text-align: center;
                    margin-top: 250px;
                    font-family: auto;
                    font-size: 69px;">Chưa có giao dịch</h1>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <c:set value="${requestScope.order}" var="c"/>
                <div class="row" style="    margin-top: 135px;     align-items: center;">
                    <div class="col-md-4">
                        <div style="margin-top: 110px;">
                            <div>Thời gian: ${c.date}</div>
                            <div>Tổng giá tiền:<fmt:formatNumber value="${c.total_price}" pattern="#,###"/> VNĐ</div>
                            <div>Trạng thái: ${c.staus_order}</div>
                        </div>
                    </div> 
                    <div class="col-md-8">
                        <table style="text-align: center">
                            <tr>
                                <th style="width: 200px">IMAGE</th>
                                <th style="width: 200px" >PRODUCT NAME</th>
                                <th style="width: 200px" >QUANTITY</th>
                                <th style="width: 200px" >PRICE</th>
                                <th style="width: 200px" >TOTAL</th>
                            </tr>
                            <c:forEach items="${requestScope.list}" var="p">
                                <tr>
                                    <td style="padding-top: 10px"><img style="width: 200px" src="${p.product.img}" alt="alt"/></td>
                                    <td style="padding-top: 10px" >${p.product.name}</td>
                                    <td style="padding-top: 10px">${p.quantity}</td>
                                    <td style="padding-top: 10px"><fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ</td>
                                    <td style="padding-top: 10px"><fmt:formatNumber value="${p.price * p.quantity}" pattern="#,###"/> VNĐ</td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div> 
                </div>


            </c:if>

            <c:if test="${sessionScope.user != null && !(requestScope.order.size()<=0 || requestScope.order == null)}">
                <table style="text-align: center; margin-top: 150px;
                       margin-left: 50px;">
                    <tr>
                        <th style="width: 200px">Thời gian</th>
                        <th style="width: 300px">Tổng giá tiền</th>
                        <th style="width: 200px">Trạng thái</th>
                        <th style="width: 300px">Chi tiết Đơn hàng</th>
                    </tr>
                    <c:forEach items="${requestScope.order}" var="c">
                        <tr>
                            <td style="padding-top: 20px">${c.date}</td>
                            <td style="padding-top: 20px">${c.total_price} VNĐ</td>
                            <td style="padding-top: 20px">${c.staus_order}</td>
                            <td style="padding-top: 20px"><a href="chitiet?id=${c.id}">Xem</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
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
