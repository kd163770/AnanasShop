<%-- 
    Document   : dangky
    Created on : Mar 4, 2023, 9:24:56 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                height: 780px;
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

            .login input{
                width: 70%;
                height: 40px;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .login button{
                width: 300px;
                height: 36px;
                border: 0;
            }
        </style>
        <script>
            function viewpassword(x) {
                var view = document.getElementById(x);
                if (view.type == 'text')
                    view.type = 'password';
                else
                    view.type = 'text';
            }
        </script>
        <link rel="stylesheet" href="themify-icons/themify-icons.css">
    </head>

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
                        <a href="">SẢN PHẨM</a>

                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="">NAM</a>

                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="">NỮ</a>

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

                <div class="search">
                    <input type="text" placeholder="Tìm kiếm">
                    <button>
                        <i class="ti-search"></i>
                    </button>

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
                <h3 style="color:red">${requestScope.err}</h3>
                <p>ĐĂNG NHẬP</p>
                <form action="dangky" method="post">
                    <h6 style="color:red">${requestScope.erruser}</h6>
                    <input type="text" placeholder="Tên truy cập" name="username" value="${requestScope.username}"> <br>
                    <h6 style="color:red">${requestScope.errname}</h6>
                    <input type="text" placeholder="Họ và Tên" name="name" value="${requestScope.name}"> <br>
                    <h6 style="color:red">${requestScope.errpw1}</h6>
                    <div style="position: relative;">
                        <input class="account"  id="fpassword" type="password" placeholder="Nhập mật khẩu" name="firstpassword" value="${requestScope.fpassword}"> <br>
                        <i class="ti-eye viewpass" style="position: absolute; bottom: 22px; right: 75px;" onclick="viewpassword('fpassword')"></i>
                    </div>
                    <h6 style="color:red">${requestScope.errpw2}</h6>
                    <div style="position: relative;">
                        <input class="account"  id="spassword" type="password" placeholder="Nhập lại mật khẩu" name="secondpassword" value="${requestScope.spassword}"> <br>
                        <i class="ti-eye viewpass" style="position: absolute; bottom: 22px; right: 75px;" onclick="viewpassword('spassword')"></i>
                    </div>
                    <h6 style="color:red">${requestScope.erremail}</h6>
                    <input type="text" placeholder="Email" name="email" value="${requestScope.email}"> <br>
                     <h6 style="color:red">${requestScope.errsdt}</h6>
                    <input type="text" placeholder="Số điện thoại" name="phonenumber" value="${requestScope.phonenumber}"> <br>
                    <input type="text" placeholder="Địa chỉ" name="address" value="${requestScope.address}"> <br>
                    <div style="display: inline-block; width: 35%; text-align: left;">
                        <span style="font-size: 14px; font-weight: 200;">Năm sinh</span>
                        <input type="date" placeholder="Năm sinh" style="width: 100%;" name="birthday" value="${requestScope.birthday}">
                    </div>
                    <div style="display: inline-block; width: 35%;  text-align: left;">
                        <p style="font-weight: 200; font-size: 14px;">Giới tính</p>
                        <select id="" style="width: 100%; height: 39px;" name="gender">
                            <option value="NAM" >Nam</option>
                            <option value="NU">Nữ</option>
                            <option value="KHAC">Khác</option>
                        </select>
                    </div>
                    <button style="background-color: #ff5f17; color: #fff; margin-top: 20px;">Đăng ký
                        ngay</button>
                </form>
            </div>
        </div>
</html>
