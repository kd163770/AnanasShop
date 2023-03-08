<%-- 
    Document   : indexc
    Created on : Feb 15, 2023, 1:49:17 PM
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
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="themify-icons/themify-icons.css">
        <style>
            .profile{
                position:relative;
            }
            .profile ul{
                position: absolute;
                list-style: none;
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
                <a href="login.jsp">Yêu thích</a> 
                <i class="ti-bag"></i>
                <a style="z-index: 1;" href="giohang">Giỏ hàng(<span>${cookie.soluong.value}</span>)</a>
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
                <a class="left carousel-control" href="#myCarousel" style = "background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 1000%);" data-slide="prev">
                    <span class="ti-angle-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" style = "background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 1000%);" data-slide="next">
                    <span class="ti-angle-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="banner">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                </ol>

                <div class="carousel-inner">
                    <div class="item active">
                        <img src="image/LowHigh_Desktop-1920x1050.jpg" alt="">
                    </div>

                    <div class="item">
                        <img src="image/Hi-im-Mule_1920x1050-Desktop.jpg" alt="">
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" style = "background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 1000%);"data-slide="prev">
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" style = "background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 1000%);" data-slide="next">
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="container small-banner">
            <div class="row">
                <a class="black col-md-6" href="allinblack" style="text-decoration: none; color: black">
                    <img src="image/banner-phụ_2m-600x320.jpg" alt="">
                    <p class="title">ALL IN BLACK</p>
                    <p class="content">Mặc dù được ứng dụng rất nhiều, nhưng sắc đen lúc nào cũng toát lên một vẻ huyền bí
                        không nhàm chán</p>
                </a>
                <a class="sale col-md-6" href="listshoesale" style="text-decoration: none; color: black">
                    <img src="image/Banner_Sale-off-1.jpg" alt="">
                    <p class="title">OUTLET SALE</p>
                    <p class="content">Danh mục những sản phẩm bán tại "giá tốt hơn" chỉ được bán kênh online - Online Only,
                        chúng đã từng làm mưa làm gió một thời gian và hiện đang rơi vào tình trạng bể size, bể số.</p>
                </a>
            </div>
        </div>

        <div class="container menu">
            <div class="row">
                <p class="title">DANH MỤC MUA HÀNG</p>
                <div class="col-md-4">
                    <div class="category">
                        <div class="black-bg"></div>
                        <img src="image/menu/catalogy-1.jpg" alt="">
                    </div>
                    <div class="link">
                        <a href="listshoe?type=NAM" class="title">GIÀY NAM</a>
                        <a href="newarrival?gioitinh=NAM">New Arrivals</a>
                        <a href="">Best Seller</a>
                        <a href="listshoesale?gioitinh=NAM">Sale-off</a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="category">
                        <div class="black-bg"></div>
                        <img src="image/menu/catalogy-2.jpg" alt="">
                    </div>
                    <div class="link">
                        <a href="listshoe?type=NU" class="title">GIÀY NỮ</a>
                        <a href="newarrival?gioitinh=NU">New Arrivals</a>
                        <a href="">Best Seller</a>
                        <a href="listshoesale?gioitinh=NU">Sale-off</a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="category">
                        <div class="black-bg"></div>
                        <img src="image/menu/catalogy-3.jpg" alt="">
                    </div>
                    <div class="link">
                        <a href="" class="title">DÒNG SẢN PHẨM</a>
                        <a href="listloaigiay?loaigiay=1">Basas</a>
                        <a href="listloaigiay?loaigiay=3">Vintas</a>
                        <a href="listloaigiay?loaigiay=2">Urbas</a>
                        <a href="listloaigiay?loaigiay=4">Pattas</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="banner-clothing">
            <img src="image/Banner_Clothing.jpg" alt="">
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

            <div id="social_media"  class="f-div">
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
