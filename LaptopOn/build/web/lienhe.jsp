<%-- 
    Document   : lienhe
    Created on : Oct 10, 2024, 11:02:18 AM
    Author     : CELESTIALS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <div class="container">
            <div class="lienhe">
                <h1 style="
                    font-family: auto;
                    text-align: center;
                    margin: 60px 0px;
                    color: red">Thông tin liên hệ
                </h1>
                <ul style="margin-left: 100px; list-style: none; color: black" class="lienhe_ul">
                    <li style="color: gray;"><i class="bi bi-shop"></i>  192 Xã Nghiêm Xuyên - Huyện Thường Tín - Thành Phố Hà Nội</li>
                    <li><i class="bi bi-telephone"></i> <a href="tel:0969792742" title="0969792742" style="color: gray;">   0969792742</a></li>
                    <li><i class="bi bi-envelope"></i> <a href="mailto:hezz281103@gmail.com" title="hezz281103@gmail.com" style="color: gray;">   hezz281103@gmail.com</a></li>
                </ul> 
            </div>
            <div class="col-md-12">
                <div class="contact-map">
                    <div class="page-login text-center">
                        <h1 class="title-head" style="
                            font-family: auto;
                            margin: 40px 0px;
                            color: red;
                            ">Bản đồ cửa hàng</h1>
                    </div>
                    <div class="box-maps margin-top-10 margin-bottom-10">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3729.683901089538!2d105.84648592600095!3d20.80407228014552!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135b46a7b71fb61%3A0xc3a3c369cf076b8c!2zTmdoacOqbSBYdXnDqm4sIEjDoCBO4buZaSwgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1708939799681!5m2!1sen!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
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
