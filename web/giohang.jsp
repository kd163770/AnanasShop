<%-- 
    Document   : giohang
    Created on : Mar 1, 2023, 9:34:39 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.*" %>
<%@page import = "entity.*" %>
<%@page import = "java.util.*" %>
<%@page import = "java.text.*" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="stylesheet" href="css/mycart.css">
        <link rel="stylesheet" href="themify-icons/themify-icons.css">
        <script>
            function processcart(x,y,z){
                let iz=parseInt(z);
                if(iz<=0){
                    alert("Vui lòng chọn số lượng sản phẩm lớn hơn 0");
                }
                else{
                window.location="processcart?masp="+x+"&size="+y+"&quantity="+z;
                }
            }
        </script>
    </head>
    <%
                    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
                    response.setDateHeader("Expires", 0);
                    List<Item> lst = (List<Item>)request.getAttribute("lst");    
                    
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
                    <div class="col-md-8" style="margin-top: 20px;">
                        
                        <div
                            style="display: block; width: 100%; height: 42px; padding: 5px 20px 5px 20px; background-color: #f1f1f1;">
                            <p style="font-weight: 600; font-size: 20px; line-height: 2;">GIỎ HÀNG</p>
                        </div>
                        <h3 style="color:red">${requestScope.err}</h3>
                        <div class="itemm" style="margin-top: 10px;">
                            <div class="container-fluid">
                                <%
                                    if(lst!=null){
                                       int index = 0;
                                       for(Item i:lst){
                                %>
                                <div class="row" style="margin-top:20px;">

                                    <div class="img_item col-md-5" style=" display: inline-block;">
                                        <img src="image/productimage/<%=i.getShoe().getId()%>/1.jpg" alt="" style="width: 100%;">
                                    </div>
                                    <div class="info_item col-md-7" style="display: inline-block;">
                                        <p style="font-weight: 600; font-size: 20px;"><%=i.getShoe().getName()%></p>
                                        <p style="color: #808080;">Giá: <span><%
                                                    DecimalFormat df = new DecimalFormat("###,###,###");
                                                    String formatted = df.format(i.getShoe().getPrice()/100*(100-i.getShoe().getSale_price()));
                                                %>
                                                <%= formatted%>&nbspVND</span><% if(i.getShoe().getSale_price() != 0){  %>   
                                            <span style="text-decoration: line-through;">
                                                <%
                                                formatted = df.format(i.getShoe().getPrice());
                                                %>
                                                <%= formatted%>&nbspVND
                                            </span><%
                                        }%></p>
                                        <div class="gia-soluong">
                                            <div id="gia" style="display: inline-block;">
                                                <p>Size</p>
                                                <select name="" id="" style="width: 150px; height: 30px;">
                                                    <%for(int k = i.getShoe().getSmallest_size(); k<=i.getShoe().getLargest_size(); k++){
                                                    %>
                                                    <option value="<%=k%>"
                                                            <% if(i.getSize()==k){%> selected<%}
                                                            %>><%=k%></option>
                                                    <%
                                                    }%>
                                                </select>
                                            </div>
                                            <div id="soluong" style="display: inline-block;">
                                                <p>Số lượng</p>
                                                <input type="number" value="<%=i.getQuantity()%>" style="width: 150px; height: 30px;" onchange="processcart('<%=i.getShoe().getId()%>', '<%=i.getSize()%>', this.value)" min='0'>
                                            </div>

                                            <form action="deletecookies" method="get">
                                                <input type="hidden" name="masp" value="<%=i.getShoe().getId()%>">
                                                <input type="hidden" name="size" value="<%=i.getSize()%>">
                                                <button
                                                    style="width: 100px; height: 50px; margin-top: 20px; background-color: black; color: #fff; font-size: 20px;">
                                                    <i class="ti-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-12" style="background-image: url(image/bg_divider.png); background-repeat:  repeat-x; background-size:7px; height: 1px; margin: 20px 0"></div>
                                <%}}%>
                                <div style="height: 2px; width: 100%; background-color: black; margin-top: 20px;"></div>
                                <div class="button_2" style="margin-top: 20px;">
                                    <form action="deletecookies" method="post">
                                        <button style="height: 40px; width: 200px; background-color: #303030; color: white;">
                                            <p style="font-weight: 600; font-size: 15px;">XOÁ HẾT</p>
                                        </button>
                                    </form>

                                    <a href="listshoe">
                                        <button style="height: 40px; width: 200px; background-color:  #303030; color: white;">
                                            <p style="font-weight: 600; font-size: 15px;">QUAY LẠI MUA HÀNG</p>
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 dongia" style="padding-bottom: 50px;">
                        <h3 style="font-weight: 600;">ĐƠN HÀNG</h3>
                        <div style="height: 2px; width: 100%; background-color: black; margin-top: 20px;"></div>
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
                            <p style='color:#ff5f17'>
                                <fmt:formatNumber    value = "${requestScope.totalmoney}"/> &nbspVND</p>
                        </div>
                        <form method="post" action="giohang">
                        <button style="width: 100%; height: 50px; background-color: #ff5f17; border: 0; color: #fff; font-size: 16px; font-weight: 600;margin-top: 20px;">TIẾP TỤC THANH TOÁN</button>
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
