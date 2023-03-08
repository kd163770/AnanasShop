<%-- 
    Document   : login
    Created on : Feb 28, 2023, 2:19:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.*" %>
<%@page import = "entity.*" %>
<%@page import = "java.util.*" %>
<%@page import = "java.text.*" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="css/login.css">
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

            .login{
                height: 500px;
                width: 30%;
                border: solid #000 1px;
                text-align: center;
                margin-left: 35%;
                margin-top: 30px;
                margin-bottom: 20px;
            }

            .login p{
                font-size: 25px;
                font-weight: 600;
                margin-top: 10px;
            }

            .login .account{
                width: 70%;
                height: 40px;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .login a button{
                width: 320px;
                height: 36px;
                border: 0;
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
        <script>
            function viewpassword(){
                var view = document.getElementById('password');
                if(view.type=='text') view.type='password';
                else view.type='text';
            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
                <i class="ti-user"></i>
                <a href="">Đăng nhập</a>
                <i class="ti-bag"></i>
                <a href="giohang.jsp">Giỏ hàng</a>
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
            <div class="login">
                <h5 style="color: red">${requestScope.err}</h5>
                <p>ĐĂNG NHẬP</p>
                <form action="login" method="POST">
                    <input class="account" name="name" type="text" placeholder="Tài khoản" value="${cookie.name.value}"> <br>
                    <div style="position: relative;">
                        <input id="password" class="account" name="password" type="password" placeholder="Mật khẩu" value="${cookie.pass.value}"> <br>
                        <i class="ti-eye viewpass" style="position: absolute; bottom: 22px; right: 75px;" onclick="viewpassword()"></i>
                    </div>

                    <input type="checkbox" value="true" name="remember"
                           <c:if test="${cookie.name.value != null}"> checked</c:if>> Nhớ tài khoản
                    <a href="changepassword.jsp" style="margin-left: 70px">Quên mật khẩu</a>
                    <a href=""><button style="background-color: #ff5f17; color: #fff; margin-top: 20px;">Đăng nhập ngay</button></a> <br>
                </form>
                <a href="dangky.jsp"><button style="color: #2a2a2a; margin-top: 10px;">Tạo tài khoản mới</button></a>

            </div>
        </div>
    </body>

</html>
