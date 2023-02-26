<%-- 
    Document   : menu
    Created on : Feb 15, 2023, 2:27:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
  List<Shoe> lst = (List<Shoe>) request.getAttribute("lst");
  List<KieuDang> listkd = (List<KieuDang>) request.getAttribute("listkd");
  List<LoaiGiay> listlg = (List<LoaiGiay>) request.getAttribute("listlg");
  String kieudang = (String)request.getAttribute("kieudang");
  String kieudang1;
  String loaigiay = (String)request.getAttribute("loaigiay");
  String loaigiay1;
  String gia = (String)request.getAttribute("gia");
  String gia1;
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
        <link rel="stylesheet" href="css/menu.css">
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
                <a href="">Giỏ hàng</a>
            </nav>

            <div class="header typeofproduct">
                <img src="image/logoananas.png" alt="">
                <ul>
                    <li class="dropdown">
                        <a href="listshoe">SẢN PHẨM</a>

                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="listshoe?type=1">NAM</a>

                    </li>
                    <li class="line"></li>
                    <li class="dropdown">
                        <a href="listshoe?type=2">NỮ</a>

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
                <div class="row">
                    <div class="col-md-3">
                        <ul class="typeofproduct">
                            <li class="dropdown">
                                <a href="product.jsp">TẤT CẢ</a>
                            </li>
                            <li class="line"></li>
                            <li class="dropdown">
                                <a href="">NAM</a>

                            </li>
                            <li class="line"></li>
                            <li class="dropdown">
                                <a href="">NỮ</a>
                            </li>
                        </ul>
                        <div class="row-left-divide"></div>
                        <ul class="phan_loai">
                            <h3>KIỂU DÁNG</h3>
                            <% for(KieuDang x: listkd) {
                            String xID = String.valueOf(x.getId());
                            if(kieudang != null && kieudang.equals(xID) == true) {kieudang1 = null;
                            %>
                                <li style="background-color: #f1f1f1"><a href="phanloaigiay?kieudang=<%=kieudang1%>&loaigiay=<%=loaigiay%>&gia=<%=gia%>   
                            "><%=x.getName()%></a></li>
                                    <%   } 
                                        else{ kieudang1 = xID;  
                            %>  
                            <li ><a href="phanloaigiay?kieudang=<%=kieudang1%>&loaigiay=<%=loaigiay%>&gia=<%=gia%>   
                                  "><%=x.getName()%></a></li>
                             <%}
                                }
                            %>
                        </ul>
                        
                        <div class="row-left-divide"></div>
                        <ul class="phan_loai">
                        <h3>DÒNG SẢN PHẨM</h3>
                        <% for(LoaiGiay x: listlg) {
                            String xID = String.valueOf(x.getId());
                            if(loaigiay != null && loaigiay.equals(xID) == true) {loaigiay1 = null;
                            %>
                                <li style="background-color: #f1f1f1"><a href="phanloaigiay?kieudang=<%=kieudang%>&loaigiay=<%=loaigiay1%>&gia=<%=gia%> 
                            "><%=x.getName()%></a></li>
                                    <%   } 
                                        else{ loaigiay1 = xID;  
                            %>  
                            <li ><a href="phanloaigiay?kieudang=<%=kieudang%>&loaigiay=<%=loaigiay1%>&gia=<%=gia%>   
                                  "><%=x.getName()%></a></li>
                             <%}
                                }
                            %>             
                        </ul>
                        <div class="row-left-divide"></div>
                        
                        
                        
                        <ul class="phan_loai">
                            <h3>GIÁ</h3>
                            <%
                            if(gia != null && gia.equals("1") == true) {
                            gia1 = null;
                            %>
                            <li style="background-color: #f1f1f1"><a href="phanloaigiay?kieudang=<%=kieudang%>&loaigiay=<%=loaigiay%>&gia=<%=gia1%> 
                            ">>600k</a></li>
                            <%} 
                                else{ gia1 = "1";  
                            %>  
                            <li ><a href="phanloaigiay?kieudang=<%=kieudang%>&loaigiay=<%=loaigiay%>&gia=<%=gia1%> 
                                  ">>600k</a></li>
                             <%}
                            %>
                            <%
                            if(gia != null && gia.equals("2") == true) {
                            gia1 = null;
                            %>
                            <li style="background-color: #f1f1f1"><a href="phanloaigiay?kieudang=<%=kieudang%>&loaigiay=<%=loaigiay%>&gia=<%=gia1%> 
                            ">500k-599k</a></li>
                            <%} 
                                else{ gia1 = "2";  
                            %>  
                            <li ><a href="phanloaigiay?kieudang=<%=kieudang%>&loaigiay=<%=loaigiay%>&gia=<%=gia1%> 
                                  ">500k-599k</a></li>
                             <%}
                            %>
                            <%
                            if(gia != null && gia.equals("3") == true) {
                            gia1 = null;
                            %>
                            <li style="background-color: #f1f1f1"><a href="phanloaigiay?kieudang=<%=kieudang%>&loaigiay=<%=loaigiay%>&gia=<%=gia1%> 
                            ">400k-499k</a></li>
                            <%} 
                                else{ gia1 = "3";  
                            %>  
                            <li ><a href="phanloaigiay?kieudang=<%=kieudang%>&loaigiay=<%=loaigiay%>&gia=<%=gia1%> 
                                  ">400k-499k</a></li>
                             <%}
                            %>
                        </ul>


                    </div>
                    <div class="col-md-9">
                        <div class="banner">
                            <img src="image/productbanner.jpg" alt="">
                        </div>

                        <div class="container-fluid">
                            <div class="row">
                                <%
                                for(Shoe x: lst) {
                                %>
                                <a href="product.jsp" class="col-md-4 product">
                                    <img src="image/productimage/track6_ISEE.jpg" alt="">
                                    <div class="info">
                                        <p class="name"><%=x.getId()%></p>
                                        <p class="color"><%=x.getName()%></p>
                                        <p class="gia">
                                            <%
                                            DecimalFormat df = new DecimalFormat("###,###,###");
                                            String formatted = df.format(x.getPrice());
                                            %>
                                            <%= formatted%>&nbspVND

                                        </p>
                                    </div>
                                    <div class="button">
                                        <div class="mua_ngay">
                                            <h4>MUA NGAY</h4>
                                        </div>
                                        <i class="fa fa-solid fa-heart yeu_thich"></i>
                                    </div>
                                </a>
                                <% } %>
                            </div>
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
