<%-- 
    Document   : product
    Created on : Feb 15, 2023, 2:32:50 PM
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="themify-icons/themify-icons.css">
</head>

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
        <div class="container">
            <div class="row">
                <div class="col-md-7 item_photo">
                    <img src="image/productimage/1.jpg" alt="">
                    <div class="contain-fluid">
                        <div class="row">
                            <div class="col-md-3 imgitem"><img src="image/productimage/1.jpg" alt=""></div>
                            <div class="col-md-3 imgitem"><img src="image/productimage/2.jpg" alt=""></div>
                            <div class="col-md-3 imgitem"><img src="image/productimage/3.jpg" alt=""></div>
                            <div class="col-md-3 imgitem"><img src="image/productimage/4.jpg" alt=""></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <h2>TRACK 6 I.S.E.E - PURE WHITE/ICY BLUE</h2>
                    <p>Mã sản phẩm:</p>
                    <h3 class="gia1">1.490.000 VND</h3>
                    <div id="size_soluong">
                        <div class="size_soluong">
                            <h3>SIZE</h3>
                            <select name="" id="" style="width: 200px; height: 30px;">
                                <option value=""></option>
                                <option value="">35</option>
                                <option value="">36</option>
                                <option value="">37</option>
                                <option value="">38</option>
                                <option value="">39</option>
                                <option value="">40</option>
                                <option value="">41</option>
                                <option value="">42</option>
                                <option value="">43</option>
                            </select>
                        </div>
                        <div class="size_soluong">
                            <h3>SỐ LƯỢNG</h3>
                            <input type="text" style="width: 200px; height: 30px;">
                        </div>

                        <button class="nutbam" style="height: 70px; width: 100%; background-color: #000;">THÊM VÀO GIỎ
                            HÀNG</button>
                        <button class="nutbam"
                            style="height: 70px; width: 100%; background-color: #ff5f17; border: 0;">THANH TOÁN</button>
                        <div class="divide" style="width: 100%; height: 2px; background-color: #000; margin-top: 50px;">
                        </div>
                        <div class="product_info">
                            <h3 style="color:#ff5f17; font-weight: 600; ">THÔNG TIN SẢN PHẨM</h3>
                            <p>Gender:</p>
                            <p>Size run:</p>
                            <p>Upper</p>
                            <p>Outsole</p>
                            <img src="image/sizechan.jpg" alt="">
                        </div>
                        <div class="divide" style="width: 100%; height: 2px; background-color: #000; margin-top: 50px;">
                        </div>
                        <div class="product_info">
                            <h3 style="color:#ff5f17; font-weight: 600; ">QUY ĐỊNH ĐỔI SẢN PHẨM</h3>
                            <p>
                                Đối với những sản phẩm giày và thời trang thuộc phiên bản giới hạn. Vì nhiều lý do chúng
                                tôi sẽ không áp dụng chính sách đổi hàng. Vui lòng cân nhắc kỹ trước khi quyết định mua.
                            </p>
                        </div>
                        <div class="divide" style="width: 100%; height: 2px; background-color: #000; margin-top: 50px;">
                        </div>
                        <div class="product_info">
                            <h3 style="color:#ff5f17; font-weight: 600; ">BẢO HÀNH THẾ NÀO ?</h3>
                            <p>Mỗi đôi giày Ananas trước khi xuất xưởng đều trải qua nhiều khâu kiểm tra. Tuy vậy, trong
                                quá trình sử dụng, nếu nhận thấy các lỗi: gãy đế, hở đế, đứt chỉ may,...trong thời gian
                                6 tháng từ ngày mua hàng, mong bạn sớm gửi sản phẩm về Ananas nhằm giúp chúng tôi có cơ
                                hội phục vụ bạn tốt hơn. Vui lòng gửi sản phẩm về bất kỳ cửa hàng Ananas nào, hoặc gửi
                                đến trung tâm bảo hành Ananas ngay trong trung tâm TP.HCM trong giờ hành chính:</p>
                            <p>Địa chỉ: 170-172, Đinh Bộ Lĩnh, P.26 , Q.Bình Thạnh, TP.HCM</p>
                            <p>Hotline: 028 2211 0067</p>
                        </div>
                    </div>

                </div>
            </div>
            <div class="divide" style="width: 100%; height: 2px; background-color: #000; margin-top: 50px;"></div>
            <div class="container splq">
                <h3 style="font-weight: 600;">SẢN PHẨM LIÊN QUAN</h3>
                <div class="row" style="margin-top: 50px;">
                    <a href="product.html" class="col-md-3 product">
                        <img src="image/productimage/track6_ISEE.jpg" alt="">
                        <div class="info">
                            <p class="name" style="font-weight: 600; margin-top: 20px;">Track 6 I.S.E.E</p>
                            <p class="color">Pure White/Icy Blue</p>
                            <p class="gia" style="font-weight: 600;">1.490.000 VND</p>
                        </div>
                    </a>

                    <a href="product.html" class="col-md-3 product">
                        <img src="image/productimage/track6_ISEE.jpg" alt="">
                        <div class="info">
                            <p class="name" style="font-weight: 600; margin-top: 20px;">Track 6 I.S.E.E</p>
                            <p class="color">Pure White/Icy Blue</p>
                            <p class="gia" style="font-weight: 600;">1.490.000 VND</p>
                        </div>
                    </a>
                    <a href="product.html" class="col-md-3 product">
                        <img src="image/productimage/track6_ISEE.jpg" alt="">
                        <div class="info">
                            <p class="name" style="font-weight: 600; margin-top: 20px;">Track 6 I.S.E.E</p>
                            <p class="color">Pure White/Icy Blue</p>
                            <p class="gia" style="font-weight: 600;">1.490.000 VND</p>
                        </div>
                    </a>
                    <a href="product.html" class="col-md-3 product">
                        <img src="image/productimage/track6_ISEE.jpg" alt="">
                        <div class="info">
                            <p class="name" style="font-weight: 600; margin-top: 20px;">Track 6 I.S.E.E</p>
                            <p class="color">Pure White/Icy Blue</p>
                            <p class="gia" style="font-weight: 600;">1.490.000 VND</p>
                        </div>
                    </a>
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
            <img src="  image/logofooter.png" alt="">
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
