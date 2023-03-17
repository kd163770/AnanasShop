<%-- 
    Document   : thanhtoan
    Created on : Mar 3, 2023, 1:49:00 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.*" %>
<%@page import = "entity.*" %>
<%@page import = "java.util.*" %>
<%@page import = "java.text.*" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="bootstrap-3.4.1-dist/js/bootstrap.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <!--        <link rel="stylesheet" href="/css/thanhtoan.css">-->
        <link rel="stylesheet" href="themify-icons/themify-icons.css">
        <style>
            header nav {
                height: 30px;
                background-color: #303030;
                color: white;
                display: flex;
                align-items: center;
                justify-content: end;
            }

            header nav a {
                color: white;
                text-decoration: none;
                margin-right: 40px;
            }

            header nav i {
                margin-right: 10px;
            }

            .header {
                width: 100%;
                height: 150px;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            .header img {
                height: 60%;
                display: inline-block;
            }

            .typeofproduct {
                padding: 0;
            }

            .typeofproduct li {
                display: inline-block;
                color: black;
                font-size: 18px;
                font-weight: 600;
                margin-right: 2px;
                margin-left: 2px;
            }

            .header ul li {
                font-size: 23px;
            }

            .typeofproduct .line {
                border-right: #e3e2e2 2px solid;
                margin-top: 38px;
                height: 23px;
            }

            .dropdown {
                padding: 20px 10px 0 10px;
            }

            .dropdown a {
                color: black;
                text-decoration: none;
            }

            .dropdown a:hover {
                color: #ff5f17;
            }

            .header #discoveryou {
                height: 40px;
                position: relative;
                top: -18px;
            }

            .header .search input {
                width: 250px;
                height: 35px;
            }

            .header button {
                height: 35px;
                width: 40px;
                background-color: #ff5f17;
                border: 0;
            }

            .navbar {
                margin-bottom: 0;
            }

            .navbar #myCarousel {
                background-color: #f1f1f1;
                text-align: center;
                height: 50px;
                line-height: 2.5;
            }

            .slide .item a {
                text-decoration: none;
                color: black;
                font-size: 20px;
                font-style: italic;
            }

            .cus-info{
                width: 70%;
                height: 30px;
                margin-top: 20px;
                margin-bottom: 20px;
                margin-left: 10px;
            }

            footer{
                height: 400px;
                background-color: #4c4c4c;
                margin-top: 80px;
            }

            footer .f-div{
                height: 150px;
                display: inline-block;
                margin-left: 20px;
                margin-right: 50px;
            }

            #social{
                display: block;
            }

            footer{
                display: flex;
                justify-content: space-around;
                align-items: center;
            }
            footer a{
                display: block;
                font-size: 16px;
                color: #cccccc;
            }

            footer a:hover{
                text-decoration: none;
                color: #ff5f17;

            }

            .f-title{
                font-size: 23px;
                font-weight: 600;
                color: white;
            }

            .f-title:hover{
                color: #ff5f17;
            }

            #social_media img{
                width: 60%;
            }

            #social a{
                display: inline-block;
                width: 50px;
                height: 50px;
                margin-right: 10px;
            }

            #social i{
                font-size: 50px;
            }

            .button_2{
                display: flex;
                justify-content: space-between;
            }

            .dongia{
                background-color: #f1f1f1;
                margin-top: 20px;
            }

            .giasp{
                margin-top: 20px;
                display: flex;
                justify-content: space-between;
            }

            .giasp p{
                font-size: 16px;
                font-weight: 600;
                color: #808080;
            }

            .tong{
                margin-top: 20px;
                display: flex;
                justify-content: space-between;
            }

            .tong p{
                font-size: 24px;
                font-weight: 600;
                color: black;
            }
        </style>
    </head>
    <%
        List<Item> lst = (List<Item>)request.getAttribute("lst");    
    %>
    <body>
        <header>
            <nav>
                <c:if test="${sessionScope.vaitro == 1}">
                <i class="ti-server"></i>
                <a href="adminproduct">Thống kê</a> 
                </c:if>
                <i class="ti-bag"></i>
                <a style="z-index: 1;" href="giohang">Giỏ hàng</a>
                <i class="ti-user"></i>
                <c:choose>
                    <c:when test="${sessionScope.name == null}">
                        <a style="z-index: 1;" href="login.jsp">Đăng nhập</a>
                    </c:when>
                    <c:when test="${sessionScope.name != null}">
                        <a href="user" class="profile" style="z-index:10; margin-right: 20px" href="">${sessionScope.name}
                        </a>
                    </c:when>
                </c:choose>
            </nav>

            <div class="header typeofproduct">
                <img src="image/logoananas.png" alt="">
                <ul>
                    <li class="dropdown">
                        <a href="listshoe">SẢN PHẨM</a>       
                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="listshoe?gioitinh=nam">NAM</a>

                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="listshoe?gioitinh=nu">NỮ</a>
                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="listshoesale">SALE OFF</a>

                    </li>
                    <li class="line"></li>
                    <li>
                        <img src="image/news_discover.png" id="discoveryou" alt="">
                    </li>
                </ul>

                <div class="search" style="z-index: 10">
                    <form action="search" method="GET">
                        <input type="text" placeholder="Tìm kiếm" name="search" value="">
                        <button style="z-index: 1;" onclick="this.form.submit()">  
                            <i class="ti-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </header>

        <div class="navbar">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">

                <div class="carousel-inner">
                    <div class="item active">
                        <a href="">FREE SHIPPING VỚI HOÁ ĐƠN TỪ 800K!</a>
                    </div>

                    <div class="item">
                        <a href="">HÀNG 2 TUẦN NHẬN ĐỔI - GIÀY NỬA NĂM BẢO HÀNH</a>
                    </div>

                    <div class="item">
                        <a href="">BUY MORE PAY LESS - ÁP DỤNG KHI MUA PHỤ KIỆN</a>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel"
                   style="background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 1000%);"
                   data-slide="prev">
                    <span class="ti-angle-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel"
                   style="background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 1000%);"
                   data-slide="next">
                    <span class="ti-angle-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="main">
            <div class="container">
                <div class="row">
                    <form action="hoantatthanhtoan" method="post">
                        <div class="col-md-8" style="margin-top: 20px;">
                            <h3 style="color:red;">${requestScope.err}</h3>
                            <div style="display: block; width: 100%; height: 42px; padding: 5px 20px 5px 20px; background-color: #f1f1f1;">
                                <p style="font-weight: 600; font-size: 20px; line-height: 2;">THÔNG TIN GIAO HÀNG</p>
                            </div>

                            <input type="text" placeholder="HỌ TÊN" class="cus-info" value="${requestScope.cus.ho_ten}" name="name">
                            <input type="text" placeholder="Số điện thoại" class="cus-info" value="${requestScope.cus.sdt}" name="phonenumber">
                            <input type="text" placeholder="Email" class="cus-info" value="${requestScope.cus.email}" name="email">
                            <input type="text" placeholder="Địa chỉ" class="cus-info" value="${requestScope.cus.dia_chi}" name="address">

                            <div style="display: block; width: 100%; height: 42px; padding: 5px 20px 5px 20px; background-color: #f1f1f1;">
                                <p style="font-weight: 600; font-size: 20px; line-height: 2;">PHƯƠNG THỨC GIAO HÀNG</p>
                            </div>
                            <p style="font-size: 18px; margin-top: 20px; margin-left: 10px; margin-bottom: 20px;">Tốc độ tiêu chuẩn (từ 2 - 5 ngày làm việc) </p>

                            <div style="display: block; width: 100%; height: 42px; padding: 5px 20px 5px 20px; background-color: #f1f1f1;">
                                <p style="font-weight: 600; font-size: 20px; line-height: 2;">PHƯƠNG THỨC THANH TOÁN</p>
                            </div>


                            <input type="radio" style="height: 20px; width: 20px;" name="typeopurchase" checked value="1"> <p style="display: inline-block; font-size: 16px; margin-top: 20px;">Thanh toán trực tiếp khi giao hàng</p> <br>
                            <input type="radio" style="height: 20px; width: 20px;" name="typeopurchase" value="2"><p style="display: inline-block; font-size: 16px;" > Thanh toán bằng thẻ quốc tế và nội địa (ATM)</p> <br>
                            <input type="radio" style="height: 20px; width: 20px;" name="typeopurchase" value="3"> <p style="display: inline-block; font-size: 16px;"> Thanh toán bằng ví MoMo</p>

                        </div>
                        <div class="col-md-4 dongia" style="padding-bottom: 50px;">
                            <h3 style="font-weight: 600;">ĐƠN HÀNG</h3>
                            <div style="height: 2px; width: 100%; background-color: black; margin-top: 20px;"></div>
                            <%
                            if(lst!=null || lst.isEmpty() == false)
                            {
                            for(Item i:lst){%>
                            <div style="margin-top: 10px">
                                <div>
                                    <div>
                                        <div style="display: inline-block; width: 49%;">
                                            <p><%=i.getShoe().getName()%></p>
                                        </div>
                                        <div  style="display: inline-block; width: 49%; text-align: right;">
                                            <p><%=i.getShoe().getPrice()%></p>
                                        </div>
                                    </div>
                                    <div>
                                        <div  style="display: inline-block; width: 49%;">
                                            <p>Size: <%=i.getSize()%></p>
                                        </div>
                                        <div  style="display: inline-block; width: 49%; text-align: right;">
                                            <p>x<%=i.getQuantity()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div  style="background-image: url(image/bg_divider.png); background-repeat:  repeat-x; background-size:7px; height: 1px; margin: 20px 0"></div> 
                            <%}}%>
                            <div class="giasp">
                                <p>ĐƠN HÀNG</p>
                                <p><fmt:formatNumber    value = "${requestScope.realmoney}"/> &nbspVND</p>
                            </div>
                            <div class="giasp">
                                <p>Giảm</p>
                                <p><fmt:formatNumber    value = "${requestScope.salemoney}"/> &nbspVND</p>
                            </div>

                            <div class="tong">
                                <p>Tổng</p>
                                <p><fmt:formatNumber    value = "${requestScope.totalmoney}"/> &nbspVND</p>
                            </div>

                            <button style="width: 100%; height: 50px; background-color: #ff5f17; border: 0; color: #fff; font-size: 16px; font-weight: 600;margin-top: 20px;">HOÀN TẤT ĐẶT HÀNG</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer>
            <div id="img-footer">
                <img src="image/store.png" alt="">
            </div>
            <div id="sanpham" class="f-div">
                <p class="f-title">SẢN PHẨM</p>
                <a href="">Giày nam</a>
                <a href="">Giày nữ</a>
                <a href="">Sale-off</a>
            </div>

            <div id="contact" class="f-div">
                <p class="f-title">SẢN PHẨM</p>
                <a href="">Email góp ý</a>
                <a href="">Hotline</a>
                <a href="">0963 429 749</a>
            </div>

            <div id="social_media" class="f-div">
                <img src="image/logofooter.png" alt="">
                <div id="social">
                    <p class="f-title">ANANAS SOCIALS</p>
                    <a href="https://www.facebook.com/Ananas.vietnam"><i class="ti-facebook"></i></a>
                    <a href="https://www.youtube.com/discoveryou"><i class="ti-youtube"></i></a>
                    <a href="https://www.instagram.com/ananasvn/"><i class="ti-instagram"></i></a>
                </div>
            </div>
        </footer>

    </body>

</html>
