<%-- 
    Document   : userchangepassword
    Created on : Mar 5, 2023, 9:34:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="bootstrap-3.4.1-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="themify-icons/themify-icons.css">
    <style>
        body {
            background-color: rgb(203, 203, 203);
        }

        header {
            background-color: white;
        }

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

        .header ul li {
            display: inline-block;
            color: black;
            font-size: 23px;
            font-weight: 600;
        }

        .header .line {
            border-right: #e3e2e2 2px solid;
            margin-top: 38px;
            height: 23px;
        }

        .header .dropdown {
            padding: 20px 20px 0 20px;
        }

        .header .dropdown a {
            color: black;
            text-decoration: none;
        }

        .header .dropdown a:hover {
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


        .small-banner {
            margin-top: 30px;
        }

        .main {
            background-color: white;
        }

        .menu {
            margin: 0;
            height: 120px;
            padding: 0;
        }

        .menu div {
            display: block;
            height: 40px;
            margin: 0;
            line-height: 30px;

            padding: 10px;
        }

        #changepassword {
            background-color: #4c4c4c;
        }

        #changepassword a {
            color: #f1f1f1;
        }

        .row_table {
            margin-top: 20px;
        }
        .row_table{
            position: relative;
        }
        .viewpass{
            position: absolute;
            right: 340px;
            top: 10px;
        }
        footer {
            height: 400px;
            background-color: #4c4c4c;
            margin-top: 80px;
        }

        footer .f-div {
            height: 150px;
            display: inline-block;
            margin-left: 20px;
            margin-right: 50px;
        }

        #social {
            display: block;
        }

        footer {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        footer a {
            display: block;
            font-size: 16px;
            color: #cccccc;
        }

        footer a:hover {
            text-decoration: none;
            color: #ff5f17;

        }

        .f-title {
            font-size: 23px;
            font-weight: 600;
            color: white;
        }

        .f-title:hover {
            color: #ff5f17;
        }

        #social_media img {
            width: 60%;
        }

        #social a {
            display: inline-block;
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        #social i {
            font-size: 50px;
        }
    </style>
    <script>
        function viewpassword(x){
            var v = document.getElementsByClassName("password");
            if(v[x].type == 'text') v[x].type='password';
            else v[x].type='text';
        }
    </script>
</head>

<body>
    <header>
        <nav>
            <c:if test="${sessionScope.status == 1}">
                <i class="ti-server"></i>
                <a href="login.jsp">Thống kê</a> 
                </c:if>
                <i class="ti-bag"></i>
                <a style="z-index: 1;" href="giohang">Giỏ hàng
                    <c:if test="${sessionScope.soluong != null}">
                        (<span>${sessionScope.soluong}</span>)
                    </c:if></a>
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

        <div class="header">
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


                <div class="search" style="z-index: 1">
                    <form action="search" method="GET">
                        <input type="text" placeholder="Tìm kiếm" name="search" value="">
                        <button  onclick="this.form.submit()">  
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

    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 menu" style="background-color: white;">
                    <div id="profile">
                        <a href="user">Thông tin tài khoản &nbsp;<i class="ti-user"></i></a> <br />
                    </div>
                    <div id="changepassword">
                        <a href="">Đổi mật khẩu &nbsp;<i class="ti-exchange-vertical"></i></a> <br />
                    </div>
                    <div>
                        <a href="usercart">Đơn hàng &nbsp;<i class="ti-shopping-cart-full"></i></a>
                    </div>
                </div>
                <div class="col-md-9 main">
                    <h1>Đổi mật khẩu</h1>
                    <p>Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu cho người khác</p>
                    <div style="display:block; width: 98%; height: 1px; background-color: rgb(155, 155, 155);"></div>
                    <form action="userchangepassword" method="post">
                        <h1 style="color:red;">${requestScope.err}</h1>
                        <div class="row_table">
                            <div style="display: inline-block; width: 20%; height: 20px;" >
                                <p>Nhập mật khẩu </p>
                            </div>
                            <input style="width: 40%; height: 35px;" type="password" name="oldpassword" value="${requestScope.oldpw}" class="password"> <br />
                            <i class="ti-eye viewpass" onclick="viewpassword(0)"></i>
                        </div>
                        <h6 style="color:red;">${requestScope.err1}</h6>
                        <div class="row_table">
                            <div style="display: inline-block; width: 20%; height: 20px;">
                                <p>Nhập mật khẩu mới </p>
                            </div>
                            <input style="width: 40%; height: 35px;" type="password" name="newpassword" value="${requestScope.newpw}" class="password"><br />
                            <i class="ti-eye viewpass" onclick="viewpassword(1)"></i>
                        </div>
                        <h6 style="color:red;">${requestScope.err2}</h6>
                        <div class="row_table" style="margin-bottom: 50px;">
                            <div style="display: inline-block; width: 20%; height: 20px;">
                                <p>Nhập lại mật khẩu</p>
                            </div>
                            <input style="width: 40%; height: 35px;" type="password" name="snewpassword" value="${requestScope.snewpw}" class="password"><br />
                            <i class="ti-eye viewpass"onclick="viewpassword(2)"></i>
                        </div>
                        <button style="width: 100px; height: 40px; background-color: #ff5f17; border: 0; color: white; font-size: 23px; margin-bottom: 20px;">Đổi</button>
                    </form>
                       
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
