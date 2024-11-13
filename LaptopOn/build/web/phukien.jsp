<%-- 
    Document   : phukien
    Created on : Oct 10, 2024, 11:02:18 AM
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
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item " style="display: flex">
                            <a class="nav-link" href="phukien?loaisp=0">All <span class="sr-only">(current)</span></a>
                            <c:forEach items="${requestScope.product_categorys2}" var="loaisp">
                                <a class="nav-link" href="phukien?loaisp=${loaisp.id}">${loaisp.name} <span class="sr-only">(current)</span></a>
                            </c:forEach>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="search">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search Laptop theo tên" aria-label="Search" name="key">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3" style="margin-top: 20px">
                    <form action="phukien" method="get">
                        <span class="big_title">TÊN HÃNG</span>
                        <div class="option__list ">
                            <div class="form-group">
                                <select id="inputState" class="form-control" name="loaisp">
                                    <option value="0" ${requestScope.loaisp == 0?"selected":""}>All</option>
                                    <c:forEach items="${requestScope.product_categorys2}" var="loaisp">
                                        <option value="${loaisp.id}" ${requestScope.loaisp == loaisp.id?"selected":""}> ${loaisp.name} </option>
                                    </c:forEach>
                                </select>
                            </div>  
                        </div>
                        <span class="big_title">GIÁ TIỀN</span>
                        <div class="option__list ">
                            <div class="form-group">
                                <select id="inputState" class="form-control" name="gia">
                                    <option value="0" ${requestScope.giatien == 0?"selected":""}>All</option>
                                    <c:set value="${0}" var="i3"/>
                                    <c:forEach items="${requestScope.gia}" var="gia">
                                        <c:set value="${i3+1}" var="i3"/>
                                        <option value="${i3}" ${requestScope.giatien == i3?"selected":""}> ${gia} </option>
                                    </c:forEach>
                                </select>
                            </div>  
                        </div>
                        <input style="border-radius: 20px;
                               margin: 0px 48px;
                               width: 160px;
                               background-color: #00000024;" type="submit" value="SEARCH">
                    </form>
                </div>
                <div class="col-md-9">
                    <div id="wp-products">
                        <c:if test="${requestScope.products.size() == 0}">
                            <h1 style="margin-left: 150px;
                                margin-top: 140px;
                                font-family: auto;
                                font-size: -webkit-xxx-large;">Không tìm thấy sản phẩm</h1>
                        </c:if>
                        <div style="display: flex" class="row">
                            <c:forEach items="${requestScope.products}" var="it">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-6 m-0 p-0 box-4">
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
                                                <span style="color: red" class="price"><fmt:formatNumber value="${it.prices}" pattern="#,###"/> VNĐ</div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="list-page">
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <a href="phukien?page=${i}&${key}"><div class="item" style="color: white;">${i}</div></a>
                                </c:forEach>
                        </div>
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
