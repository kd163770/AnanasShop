<%-- 
    Document   : product
    Created on : Feb 15, 2023, 2:32:50 PM
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
    Shoe shoe = (Shoe)request.getAttribute("shoe");
    String size = (String)request.getAttribute("size");
    int sizeInt = 0;
    Integer soluong = (Integer)request.getAttribute("soluong");
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
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="themify-icons/themify-icons.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <style>
            .main{
                margin-top: 50px;
            }


            .main img{
                width: 100%;

            }
            .imgitem{
                padding: 15px;
            }

            .size_soluong{
                display: inline-block;
                width: 49%;
            }

            .nutbam{
                margin-top: 20px;
                color: white;
                font-size: 20px;
                font-weight: 600;
            }

            .splq{
                text-align: center;
            }

            .product{
                color: #000;
                
            }

            .product:hover{
                color:#000;
                text-decoration: none;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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
                left: 20%;
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
            .gia1{
                color: #ff5f17;
                font-weight: 600;
            }
        </style>
        <script>
            function Images(x) {
                document.getElementById("mainimg").src = x;
            }

            function soluong(x) {
                var s = document.getElementById("sizegiay");
                var v = s.value;
                window.location = "soluong?masp=" + x + "&size=" + v;
            }
            function themvaogiohang(x,s) {
                var sizegiay = document.getElementById("sizegiay").value;
                var soluong = document.getElementById("soluong1");
                let a = parseInt(soluong.value);
                let b = parseInt(soluong.max);
                if (sizegiay == "" || soluong.value == "" || a<=0) {
                    alert("Vui lòng nhập số lượng và size giày");
                } else if (a > b)
                {
                    console.log(typeof soluong.max);
                    console.log(typeof soluong.value);
                    alert("Sản phẩm này chỉ còn " + soluong.max + " sản phẩm");
                } else {
                    window.location = "themvaogiohang?masp=" + x + "&size=" + sizegiay + "&soluong=" + soluong.value+"&type="+s;
                }
            }
        </script>
    </head>
    <%
                response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
                response.setHeader("Pragma", "no-cache"); //HTTP 1.0
                response.setDateHeader("Expires", 0);
    %>
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
                    <div class="col-md-7 item_photo">
                        <img id = "mainimg" src="image/productimage/<%=shoe.getId()%>/1.jpg" alt="">
                        <div class="contain-fluid">
                            <div class="row">
                                <div class="col-md-3 imgitem"><img src="image/productimage/<%=shoe.getId()%>/1.jpg" onclick="Images('image/productimage/<%=shoe.getId()%>/1.jpg')" alt=""></div>
                                <div class="col-md-3 imgitem"><img src="image/productimage/<%=shoe.getId()%>/2.jpg" onclick="Images('image/productimage/<%=shoe.getId()%>/2.jpg')" alt=""></div>
                                <div class="col-md-3 imgitem"><img src="image/productimage/<%=shoe.getId()%>/3.jpg" onclick="Images('image/productimage/<%=shoe.getId()%>/3.jpg')" alt=""></div>
                                <div class="col-md-3 imgitem"><img src="image/productimage/<%=shoe.getId()%>/4.jpg" onclick="Images('image/productimage/<%=shoe.getId()%>/4.jpg')" alt=""></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <h2><%=shoe.getName()%></h2>
                        <p>Mã sản phẩm: <%=shoe.getId()%></p>
                        <h3 class="gia1" style="display: inline-block"><%
                                                DecimalFormat df = new DecimalFormat("###,###,###");
                                                String formatted = df.format(shoe.getPrice()/100*(100-shoe.getSale_price()));
                            %>
                            <%= formatted%>&nbspVND</h3>
      
                        <% if(shoe.getSale_price() != 0){  %>   
                        <span style="text-decoration: line-through;">
                            <%
                            formatted = df.format(shoe.getPrice());
                            %>
                            <%= formatted%>&nbspVND
                        </span><%
                                        }%>
                        <!--                        <form name="f" action="" method="POST">-->
                        <div id="size_soluong">
                            <div class="size_soluong">
                                <h3>SIZE</h3>
                                <select name="" id="sizegiay" style="width: 200px; height: 30px;" onchange="soluong('<%=shoe.getId()%>')">
                                    <option></option>
                                    <%for(int i = shoe.getSmallest_size(); i<=shoe.getLargest_size(); i++){
                                    %>
                                    <option value="<%=i%>"
                                            <% if(String.valueOf(i).equals(size)){%> selected<%}
                                            %>><%=i%></option>
                                    <%
                                }%>
                                </select>
                            </div>
                            <div class="size_soluong" id="soluong">
                                <h3>SỐ LƯỢNG</h3>
                                <input type="number" id="soluong1" style="width: 200px; height: 30px;" min="1"
                                       <% if(soluong == null || size == null || size.equals("")){ %> disabled=""
                                       <%} else if(soluong == 0) {%> disabled="" placeholder="Hết hàng"<%}
                                    else {%>
                                       max = <%=soluong%>
                                       placeholder="Còn <%=soluong%> sản phẩm" 
                                       <%}
                                       %> >                                         
                            </div>

                            <button class="nutbam" style="height: 70px; width: 100%; background-color: #000;" onclick="themvaogiohang('<%=shoe.getId()%>', 'them')">THÊM VÀO GIỎ
                                HÀNG</button>
                            <button class="nutbam" onclick="themvaogiohang('<%=shoe.getId()%>', 'thanhtoan')"
                                    style="height: 70px; width: 100%; background-color: #ff5f17; border: 0;">THANH TOÁN</button>
                            <div class="divide" style="width: 100%; height: 2px; background-color: #000; margin-top: 50px;">
                            </div>
                            <div class="product_info">
                                <h3 style="color:#ff5f17; font-weight: 600; ">THÔNG TIN SẢN PHẨM</h3>
                                <p>Gender: <%=shoe.getGioi_tinh()%></p>
                                <p>Color: <%=shoe.getMau_sac()%></p>
                                <p>Size run: <%=shoe.getSmallest_size()%> - <%=shoe.getLargest_size()%></p>
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
                        <%
                                   for(Shoe x: lst) {
                        %>
                        <a href="product?masp=<%=x.getId()%>" class="col-md-3 product">
                            <img src="image/productimage/<%=x.getId()%>/1.jpg" alt="">
                            <div class="info">
                                <p class="name" style="font-weight: 600"><%=x.getId()%></p>
                                <p class="color"><%=x.getName()%></p>
                                <span class="gia1">
                                    <%
                                    df = new DecimalFormat("###,###,###");
                                    formatted = df.format(x.getPrice()/100*(100-x.getSale_price()));
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
