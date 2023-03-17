<%-- 
    Document   : orderdetails
    Created on : Mar 13, 2023, 4:59:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="themify-icons/themify-icons.css">
        <style>
            body {
                background-color: #f0f3f5;
            }

            #header {
                background-color: #fafbfc;
                width: 100%;
                height: 50px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }

            #header img {
                height: 80%;
                display: inline-block;
            }

            .main_nav {
                background-color: #fafbfc;
                height: 660px;
            }

            .main {
                height: 100%;

            }

            .nav {
                display: block;
                width: 80%;
                height: 40px;
                line-height: 40px;
                margin-left: 30px;
                padding-left: 10px;
                border-radius: 10px;
                text-decoration: none;
                color: #000;
            }

            .nav:hover {
                background-color: #e0f3ff;
                color: #3f6ad8;
                text-decoration: none;
                font-weight: 600;
            }
            .orderdetails{
                margin-top: 20px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            #head {

                display: flex;
                justify-content: space-between;
            }

            #head p {
                font-size: 25px;
                font-weight: 400;
            }
            
            .actives{
                background-color: #e0f3ff;
                color: #3f6ad8;
                text-decoration: none;
                font-weight: 600;
            }
        </style>
    </head>

    <body>
        <header>
            <div id="header">
                <img src="image/logoananas.png" alt="">
                <h3 style="display: inline-block; margin: 0; line-height: 49px;">Admin Page</h3>
                <a href="index.jsp" style="line-height: 50px; margin-left: 25px;">TRANG CHỦ</a>
                <a onclick='window.history.go(-1);' style="float: right; line-height: 50px; margin-right: 20px">QUAY LẠI</a>
            </div>
        </header>
        <div class="container-fluid">
            <div class="row">
                <div class="main_nav col-md-2">
                    <i class="ti-panel" style="font-size: 23px; margin-top: 30px; margin-left: 30px;"></i>&nbsp;<h6
                        style="display: inline-block; font-size: 20px; margin-top: 30px;">Dashboard</h6>
                    <a class="nav" href="adminproduct">Tổng quan</a>
                    <a class="nav" href="adminshoe">Sản phẩm</a>
                    <a class="nav actives">Đơn hàng</a>
                    <a class="nav" href="adminaccount">Khách hàng</a>
                </div>

                <div class="main col-md-10">
                    <div class="container" style="width: 100%">
                        <div class="row">
                            <div class="col-md-12 orderdetails">
                                <div id="head">
                                    <p>Mã đơn: ${orders.id}</p>
                                    <p><c:if test="${orders.status == 1}">Đang xử lý</c:if>
                                    <c:if test="${orders.status == 2}">Đang giao hàng</c:if>
                                    <c:if test="${orders.status == 3}">Hoàn thành</c:if>
                                    <c:if test="${orders.status == 4}">Đã huỷ</c:if></p>
                                </div>
                                <div style="display:block; width: 95%; height: 1px; background-color: rgb(51, 51, 51); margin-left: 20px; margin-bottom: 10px;"></div>
                                <table class="table table-striped table-hover table-condensed" style="width: 100%">
                                    <thead>
                                        <tr style="height: 30px">
                                            <td> MASP </td>
                                            <td> Hình ảnh </td>
                                            <td> Tên </td>
                                            <td> Số lượng </td>
                                            <td> Size </td>
                                            <td> Giá </td>
                                            <td> Giảm </td>                                   
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${odlist}" var="o">
                                            <tr>
                                                <td >${o.masp}</td>
                                                <td style="width: 100px"><img src="image/productimage/${o.shoe.id}/1.jpg" style="width: 100px; height: 100px"></td>
                                                <td>${o.shoe.name}</td>
                                                <td>${o.quantity}</td>
                                                <td>${o.size}</td>
                                                <td> <fmt:formatNumber value = "${o.price}"/></td>
                                                <td>${o.sale}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div style="display:block; width: 95%; height: 1px; background-color: rgb(51, 51, 51); margin-left: 20px; margin-bottom: 10px;"></div>
                                <div>
                                    <h1>Tổng: <fmt:formatNumber value = "${requestScope.orders.price}"/></h1>
                                </div>
                                <p>Họ tên người nhận: ${orders.customer}</p>
                                <p>Số điện thoại: ${orders.phonenumber}</p>
                                <p>Địa chỉ: ${orders.address}</p>
                                <p>Ngày đặt hàng: ${orders.orderDate}</p>
                                <p>Ngày giao hàng: ${orders.shipDate}</p>
                                <p>Ngày nhận hàng: ${orders.receiveDate}</p>
<!--                                <a href="adminorder?index=${requestScope.index}&orderby=${requestScope.orderby}&order=${requestScope.order}&status=${requestScope.status}&year=${requestScope.year}&month=${requestScope.month}"><button style="width: 150px; height: 30px; margin-bottom: 20px">QUAY LẠI</button></a>-->
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</body>

</html>
