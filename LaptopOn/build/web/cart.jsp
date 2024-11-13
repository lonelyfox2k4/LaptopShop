<%-- 
    Document   : cart
    Created on : Oct 13, 2024, 13:02:18 AM
    Author     : CELESTIALS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <c:set var="c" value="${requestScope.cart}"/>
        <div class="container">
            <div class="home-title-cate" style="display: flex;    align-items: center;
                 justify-content: space-between;">
                <c:if test="${requestScope.size != null}">
                    <h3 class="name" style="font-family: auto">Giỏ hàng của bạn (${requestScope.size} sản phẩm )</h3>
                </c:if>
                <c:if test="${requestScope.size == null}">
                    <h3 class="name" style="font-family: auto">Giỏ hàng của bạn (0 sản phẩm )</h3>
                </c:if>
                <a href="deleteCart?value=1" >Xoá giỏ hàng</a>
            </div>
            <c:if test="${c == null || c.items.size() == 0}" >
                <h1 style="    font-family: auto;
                margin: 10px 200px;
                color: gray;">Vui lòng chọn sản phẩm bán muốn mua</h1>
            </c:if>
            <c:if test="${c != null}" >
                <c:forEach items="${c.items}" var="ca">
                <div class="cart-item row flex-row" style="margin-top: 20px">
                    <div class="p-img col-md-2">
                        <label for=""><img style="width: 100%" src="${ca.product.img}" alt=""></label>
                    </div>
                    <div class="p-info col-md-7">
                        <a href="inforProducts?id=${ca.product.id}" class="p-name">${ca.product.name}</a>
                        <div class="p-config d-flex align-items-baseline" style="align-items: center !important;}">
                            <p style="font-weight: bold; margin: 0px; ">Mô tả:   </p>&nbsp;&nbsp;&nbsp;
                            <div class="color">
                                <label>
                                    <span class="filter-title py-1">${ca.product.describe}</span>
                                </label>
                            </div>
                        </div>
                        <div class="delete">
                            <form action="process" method="post">
                                <input type="hidden" name="id" value="${ca.product.id}">
                                <input type="submit" value="Return item">
                            </form>
                        </div>
                    </div>
                    <div class="p-price-sale col-md-3" style="display: flex;
                         flex-direction: column;
                         justify-content: center;">
                        <c:if test="${ca.product.sale != 0}">
                            <span class="after__sale">
                                Giá bán:
                                <span>
                                    <fmt:formatNumber value="${ca.product.sale}" pattern="#,###"/> VNĐ
                                </span>
                            </span>
                        </c:if>
                        <c:if test="${ca.product.sale == 0}">
                            <span class="after__sale">
                                Giá bán:
                                <span>
                                    <fmt:formatNumber value="${ca.product.prices}" pattern="#,###"/> VNĐ
                                </span>
                            </span>
                        </c:if>
                        <div>
                            <span>Số lượng</span> 
                            <button style="width: 30px"><a href="process?num=-1&id=${ca.product.id}" >-</a></button>
                            <input type="type" value="${ca.quantity}" style="width: 50px; text-align: center;" readonly>
                            <button style="width: 30px"><a href="process?num=1&id=${ca.product.id}" style="width: 30px">+</a></button>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </c:if>
            
            <div style="display :flex; justify-content: space-between;">
                <h1 style="font-family: auto">Total price: <fmt:formatNumber value="${c.totalMoney}" pattern="#,###"/>VNĐ</h1>
            <h2><a style="font-family: auto;
                   color: gray;" href="product">Click me continue shopping</a></h2>
            </div>
            <div>
                <h2 style="color: red;
    font-family: auto;
    margin-top: 70px;">Thông tin khách hàng</h2>
    <form action="buyProducts" method="post">
                    <div class="form-cart-item" style="display: flex;
                            /* justify-content: space-around; */
                            align-content: center;
                             text-align: center;
                            align-items: center;    margin-top: 20px;">
                        <span style="    margin-right: 306px  ;   margin-left: 50px;
                            font-size: 20px;">Họ và tên :</span>
                        <div style="flex-grow: 1;">
                            <input type="text" style="    border: 1px solid;
                            padding: 10px 101px;
                            text-align: center;" name="name" required="" placeholder="Nhập họ và tên" value="${sessionScope.user.fullname}">
                        </div>
                    </div>
                    <div class="form-cart-item" style="display: flex;
                            /* justify-content: space-around; */
                            align-content: center;
                             text-align: center;
                            align-items: center;    margin-top: 20px;">
                        <span style="    margin-right: 275px ;    margin-left: 50px;
                            font-size: 20px;">Số điện thoại :</span>
                        <div style="flex-grow: 1;">
                            <input type="text" style="    border: 1px solid;
                            padding: 10px 101px;
                            text-align: center;" name="phone" required=""  placeholder="Nhập số điện thoại" value="${sessionScope.user.phone}">
                        </div>
                    </div>
                            <c:if test="${sessionScope.user != null}">
                                
                    <div class="form-cart-item" style="display: flex;
                            /* justify-content: space-around; */
                            align-content: center;
                             text-align: center;
                            align-items: center;    margin-top: 20px;">
                        <span style="    margin-right: 347px ;    margin-left: 50px;
                            font-size: 20px;">Email :</span>
                        <div style="flex-grow: 1;">
                            <input type="text" style="    border: 1px solid;
                            padding: 10px 101px;
                            text-align: center;" name="email"  placeholder="Nhập Email" value="${sessionScope.user.email}">
                        </div>
                    </div>
                                                    </c:if>

                    <div class="form-cart-item" style="display: flex;
                            /* justify-content: space-around; */
                            align-content: center;
                             text-align: center;
                            align-items: center;    margin-top: 20px;">
                        <span style="    margin-right: 333px;     margin-left: 50px;
                            font-size: 20px;">Địa chỉ :</span>
                        <div style="flex-grow: 1;">
                            <input type="text" style="    border: 1px solid;
                            padding: 10px 101px;
                            text-align: center;" name="adress" required=""  placeholder="Nhập địa chỉ" value="">
                        </div>
                    </div>
                        <input style="    padding: 10px 20px;
    background-color: red;
    color: white;
    margin: 38px 479px;" type="submit" value="Mua hàng">
                </form>
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
