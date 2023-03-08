<%-- 
    Document   : userorder
    Created on : Mar 8, 2023, 1:12:37 PM
    Author     : Admin
--%>

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


            .menu {
                margin: 0;
                height: 120px;
                padding: 0;
                background-color: #fff;
            }

            .menu div {
                display: block;
                height: 40px;
                margin: 0;
                line-height: 30px;

                padding: 10px;
            }

            #cart {
                background-color: #4c4c4c;
            }

            #cart a {
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

            .navbar_cart{
                width: 100%;
                height: 50px;
                background-color: #fff;
                display: flex;
            }

            .navbar_cart div{
                width: 25%;
                height: 100%;
                text-align: center;
                font-size: 20px;
                line-height: 50px;
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

            .donhang{
                width: 100%;
                background-color: white;
            }
            .cart_info{
                height: 50px;
                display: flex;
                background-color: #fff;
                padding-left: 10px;
                padding-right: 10px;
                justify-content: space-between;
                line-height: 50px;
                margin-top: 20px;
            }

            .item_cart{
                display: inline-block;
            }
            .donhang .product_img{
                width: 150px;
                height: 150px;
                margin-left: 10px;
            }
            .donhang .product_img img{
                width: 100%;
            }

            .info_product{
                display: inline-block;
                width: 500px;
                height: 100%;
            }

            .gia{
                display: inline-block;
                text-align: right;
                line-height: 150px;
                width: 150px;
            }
            .huydon{
                text-align: right;
                margin-right: 20px;
            }
            .huydon p{
                font-size: 20px;
            }
            .huydon p span{
                color: #ff5f17;
            }

            .huydon button{
                width: 100px;
                height: 40px;
                margin-bottom: 20px;
                background-color: #ff5f17;
                border: 0;
                color: white;
            }
        </style>
        <script>
            function navbar(x) {
                var list = document.getElementsByClassName("nav_child");
                for (var i = 0; i < list.length; i++) {
                    if (i == x) {
                        list[i].style.borderBottom = '2px #ff5f17 solid';
                    } else
                        list[i].style.borderBottom = '0px';
                }
            }
        </script>

        <%
            List<Order> o = (List<Order>)request.getAttribute("order");
            List<OrderDetails2> od = (List<OrderDetails2>)request.getAttribute("order");
        %>
    </head>

    <body>
        <header>
            <nav>
                <i class="ti-heart"></i>
                <a href="">Yêu thích</a>
                <i class="ti-user"></i>
                <a href="">Đăng nhập</a>
                <i class="ti-bag"></i>
                <a href="">Giỏ hàng</a>
            </nav>

            <div class="header">
                <img src="image/logoananas.png" alt="">
                <ul>
                    <li class="dropdown">
                        <a href="menu.html">SẢN PHẨM</a>
                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="menu.html">NAM</a>

                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="menu.html">NỮ</a>

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

        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 menu" style="background-color: white;">
                        <div id="profile">
                            <a href="">Thông tin tài khoản &nbsp;<i class="ti-user"></i></a> <br />
                        </div>
                        <div id="changepassword">
                            <a href="">Đổi mật khẩu &nbsp;<i class="ti-exchange-vertical"></i></a> <br />
                        </div>
                        <div id="cart">
                            <a href="">Đơn hàng &nbsp;<i class="ti-shopping-cart-full"></i></a>
                        </div>
                    </div>
                    <div class="col-md-9 main">
                        <form action="">
                            <div class="navbar_cart">
                                <div class="nav_child" onclick="navbar(0)">Tất cả</div>
                                <div class="nav_child" onclick="navbar(1)">Đang giao</div>
                                <div class="nav_child" onclick="navbar(2)">Hoàn thành</div>
                                <div class="nav_child" onclick="navbar(3)">Đã huỷ</div>                    
                            </div>
                        </form>
                        <div class="donhang">
                            <%
                                for(int i=0; i<=o.size(); i++)
                                {
                            %>
                            <div class="cart_info">
                                <p><%=o.get(i).getId()%></p>
                                <%if(o.get(i).getStatus() == 1){%>
                                <h4>ĐANG XỬ LÝ</h4>
                                <%}else if(o.get(i).getStatus() == 2){%>
                                <h4>ĐANG GIAO HÀNG</h4>
                                <%}else{%>
                                <h4>HOÀN THÀNH</h4>
                                <%}%>
                            </div>
                            
                            <div style="display:block; width: 95%; height: 1px; background-color: rgb(51, 51, 51); margin-left: 20px; margin-bottom: 10px;"></div>
                            <%for(int j=0; j<=od.size(); j++){
                                if(od.get(i).getId() == o.get(i).getId())
                                {
                               %>
                            <div class="item_cart">
                                <div class="product_img">
                                    <img src="image/productimage/<%=od.get(i).getMasp()%>/1.jpg" alt="">
                                </div>
                            </div>
                            <div class="info_product">
                                <div>
                                    <p>Tên</p>
                                    <p>Size</p>
                                    <p>Số lượng</p>                                
                                </div>
                            </div>
                            <div class="gia">
                                <p>0000000</p>
                            </div>
                            <div class="item_cart">
                                <div class="product_img">
                                    <img src="image/productimage/1.jpg" alt="">
                                </div>
                            </div>
                            <div class="info_product">
                                <div>
                                    <p>Tên</p>
                                    <p>Size</p>
                                    <p>Số lượng</p>                                
                                </div>
                            </div>
                            <div class="gia">
                                <p>0000000</p>
                            </div>
                            <div class="item_cart">
                                <div class="product_img">
                                    <img src="image/productimage/1.jpg" alt="">
                                </div>
                            </div>
                            <div class="info_product">
                                <div>
                                    <p>Tên</p>
                                    <p>Size</p>
                                    <p>Số lượng</p>                                
                                </div>
                            </div>
                            <div class="gia">
                                <p>0000000</p>
                            </div>
                            <div style="display:block; width: 100%; height: 0.5px; background-color: rgb(96, 96, 96); margin-bottom: 10px;"></div>
                            <div class="huydon">
                                <p>Tổng tiền: <span>000000000</span></p>
                                <button>Huỷ Đơn</button>
                            </div>
                            <%}}%>
                            <%}%>
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
