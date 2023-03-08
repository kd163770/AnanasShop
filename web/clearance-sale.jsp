<%-- 
    Document   : menu
    Created on : Feb 15, 2023, 2:27:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.*" %>
<%@page import = "entity.*" %>
<%@page import = "java.util.*" %>
<%@page import = "java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
  List<Shoe> lst = (List<Shoe>) request.getAttribute("lst");
%> 
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

            .main {
                margin-top: 35px;
                padding: 0;
            }


            .banner {
                padding-left: 10px;
                padding-right: 10px;
            }

            .banner img {
                width: 100%;
            }


            .product {
                display: inline-block;
                color: #303030;
                padding-left: 10px;
                padding-right: 10px;
                margin-top: 20px;
            }

            .product:hover{
                text-decoration: none;
            }
            .product img {
                width: 100%;
            }

            .product .info {
                text-align: center;
                font-size: 16px;
                margin-top: 10px;
            }

            .product .info .name,
            .info .gia {
                font-weight: 600;
            }

            .product .info .name:hover {
                color: #ff5f17;
            }



            .mua_ngay {
                display: none;
                width: 150px;
                height: 50px;
                color: #fff;
                background-color: #ff5f17;
                text-align: center;
                padding: 10px 12px 6px 12px;
                border: 0.8px;
                box-sizing: border-box;
                position: absolute;
                left: 28%;
                top: 98px;
            }

            .mua_ngay h4{
                font-weight: 600;
            }

            .button{
                width: 100%;
                position: absolute;
                top: 212px;
            }

            .product:hover .mua_ngay
            {
                display: inline-block;
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
        </style>
    </head>
    <%
                response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
                response.setHeader("Pragma", "no-cache"); //HTTP 1.0
                response.setDateHeader("Expires", 0);
    %>
    <body>
        <header>
            <nav>
                <i class="ti-heart"></i>
                <a href="">Yêu thích</a>
                <i class="ti-bag"></i>
                <a style="z-index: 1;" href="giohang">Giỏ hàng(<span>${cookie.soluong.value}</span>)</a>
                <i class="ti-user"></i>
                <c:choose>
                    <c:when test="${sessionScope.name == null}">
                        <a href="login.jsp">Đăng nhập</a>
                    </c:when>
                    <c:when test="${sessionScope.name != null}">
                        <a href="">${sessionScope.name}</a>
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
                        <a href="">SALE OFF</a>

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
                <div class="banner">
                    <img src="image/Clearance-Sale-Desktop.jpg" alt="">
                </div>

                <div class="container-fluid">
                    <div class="row">
                        <%
                        for(Shoe x: lst) {
                        %>
                        <a href="product?masp=<%=x.getId()%>" class="col-md-4 product">
                            <img src="image/productimage/<%=x.getId()%>/1.jpg" alt="">
                            <div class="info">
                                <p class="name"><%=x.getId()%></p>
                                <p class="color"><%=x.getName()%></p>
                                <span class="gia">
                                    <%
                                    DecimalFormat df = new DecimalFormat("###,###,###");
                                    String formatted = df.format(x.getPrice()/100*(100-x.getSale_price()));
                                    %>
                                    <%= formatted%>&nbspVND
                                </span>
                                <% if(x.getSale_price() != 0){  %>   
                                <span style="text-decoration: line-through;">
                                    <%
                                    formatted = df.format(x.getPrice());
                                    %>
                                    <%= formatted%>&nbspVND
                                </span><%
                                        }%>
                            </div>
                            <div class="button">
                                <div class="mua_ngay">
                                    <h4>MUA NGAY</h4>
                                </div>
                            </div>
                        </a>
                        <% } %>
                    </div>
                </div>
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
            <a href="">Thời Trang & Phụ kiện</a>
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
