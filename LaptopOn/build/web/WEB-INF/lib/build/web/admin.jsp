<%-- 
    Document   : admin
    Created on : Feb 14, 2024, 8:07:40 PM
    Author     : admin
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
        <link rel="stylesheet" href="CSS/style_5.css" type="text/css" />
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

            <div class="head">
                <div class="col-div-6">
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav">☰ Home</span>
                    <span style="font-size:30px;cursor:pointer; color: white;" class="nav2">☰ Home</span>
                </div>

                <div class="col-div-6">
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
            <div class="col-div-8">
                    <div class="chart">
                        <div style="display: flex; justify-content: space-between; align-items: center">
                            <h2>Thống kê số tiền 12 tháng</h2> 
                            <form action="nam">
                                <select onchange="this.form.submit()" style="    width: 80px; border: none;
                                        height: 30px; font-size: 20px" name="nam">
                                    <option value="1" ${requestScope.namx == 2022?"selected":""}>All</option>
                                    <option value="2022" ${requestScope.namx == 2022?"selected":""}>2022</option>
                                    <option value="2023" ${requestScope.namx == 2023?"selected":""}>2023</option>
                                    <option value="2024" ${requestScope.namx == 2024?"selected":""}>2024</option>
                                </select>
                            </form>
                        </div>

                        <canvas id="barChart"></canvas>

                    </div>
            </div>
            <div class="col-div-4">
                                    <div class="chart" id="doughtnut-chart">
                        <h2>Số sản phẩm bán được theo từng loại</h2>
                        <canvas id="lineChart"></canvas>
                    </div>
                                </div>
                                <div class="col-div-12" style="    margin-top: 42%; alig">
                                    
                                
                                <div class="col-div-6" style="background-color: #272c4a;
                 color: #fff; width: 65%;">
                                    <div class="content-box" style="border-radius: 10%">
                    <p>Top 10 sản phẩm bán chạy nhất</p>
                    <br />
                    <table>
                        <tr>
                            <th>ID</th>
                            <th style="">Tên sản phẩm</th>
                            <th style="">Giá tiền</th>
                            <th>Số lượng</th>
                        </tr>
                        <c:forEach items="${requestScope.list}" var="p">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <th><fmt:formatNumber value="${p.price * p.quantity}" pattern="#,###"/> VNĐ</th>
                                <td>${p.quantity}</td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
                                                </div>
<div class="card col-div-3" style="    background-color: #272c4a;
                 color: #fff;padding-left: 50px;     margin-left: 5%;     margin-left: 5%;
    margin-top: 5%;">
                <div class="card-header" style="    background-color: transparent;
                     border-bottom: 1px solid rgba(0, 0, 0, .125);
                     padding: 0.75rem 1.25rem;
                     position: relative;
                     border-top-left-radius: 0.25rem;
                     border-top-right-radius: 0.25rem; margin-left: -25px;
    color: red;   ">
                    <h3 class="card-title" style="    float: left;
                        font-size: 1.1rem;
                        font-weight: 400;
                        margin: 0;">Top những người mua sản phẩm nhiều nhất</h3>
                </div>

                <div class="card-body p-0" style="    flex: 1 1 auto;
                     min-height: 1px;">
                    <c:set value="0" var="i"/>
                    <ul class="users-list clearfix col-div-12" style="    padding-left: 0;list-style: none;}">
                        <c:forEach items="${requestScope.list2}" var="u">
                                                    <c:set value="${i+1}" var="i"/>
                            <li class="col-div-4" style="float: left;
    padding: 10px;
    text-align: center;
    width: 25%;
    display: flex;
    flex-direction: column;
    height: 170px;">
                            <img style="border-radius: 50%;height: auto;max-width: 67%;     margin: 0px auto;" src="${u.img}">
                            <a style="color: #ced4da;" class="users-list-name" href="edipUser?id=${u.id}">${u.name}</a>
                            <span style="    color: #adb5bd;    display: block;" class="users-list-date">Top${i}</span>
                        </li>
                                                </c:forEach>

                    </ul>

                </div>

            </div>
                                    
                                                                    </div>

        </div>
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
        <script>
                                    var ctx = document.getElementById('barChart').getContext('2d');
                                    var myChart = new Chart(ctx, {
                                        type: 'line',
                                        data: {
                                            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
                                            datasets: [{
                                                    label: 'Tắt thống kê',
                                                    data: [${requestScope.t1}, ${requestScope.t2}, ${requestScope.t3}, ${requestScope.t4}, ${requestScope.t5}, ${requestScope.t6}, ${requestScope.t7}
                                                        , ${requestScope.t8}, ${requestScope.t9}, ${requestScope.t10}, ${requestScope.t11}, ${requestScope.t12}],
                                                    backgroundColor: [
                                                        'rgba(255, 99, 132, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(255, 206, 86, 0.2)',
                                                        'rgba(75, 192, 192, 0.2)',
                                                        'rgba(153, 102, 255, 0.2)',
                                                        'rgba(255, 159, 64, 0.2)'
                                                    ],
                                                    borderColor: [
                                                        'rgba(255, 99, 132, 1)',
                                                        'rgba(54, 162, 235, 1)',
                                                        'rgba(255, 206, 86, 1)',
                                                        'rgba(75, 192, 192, 1)',
                                                        'rgba(153, 102, 255, 1)',
                                                        'rgba(255, 159, 64, 1)'
                                                    ],
                                                    borderWidth: 1
                                                }]
                                        },
                                        options: {
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });
        </script>
        <script>
            var ctx = document.getElementById('lineChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['Laptop Dell', 'Laptop HP', 'Laptop Acer', 'MacBook', 'Microsoft Sureface', 'Charger Laptop', 'Conversion', 'Keyboard and mouse'],
                    datasets: [{
                            label: '# of Votes',
                            data: [${requestScope.dell}, ${requestScope.hp}, ${requestScope.acer}, ${requestScope.mac},
            ${requestScope.mcrs}, ${requestScope.pin}, ${requestScope.cv}, ${requestScope.km}],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(100, 100, 100, 1)',
                                'rgba(200, 200, 200, 1)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(100, 100, 100, 1)',
                                'rgba(200, 200, 200, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
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
    </body>
</html>
