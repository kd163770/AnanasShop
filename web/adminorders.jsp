<%-- 
    Document   : adminorders
    Created on : Mar 13, 2023, 12:16:38 PM
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
                height: 700px;
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

            #so_lieu {
                width: 100%;
                height: 200px;
                background-color: #fff;
                display: flex;
                justify-content: space-around;
                align-items: center;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }

            .so_luong {
                font-size: 80px;
                font-weight: 600;
            }

            .pagging {
                display: inline-block;
                width: 30px;
                height: 30px;
                border: solid 1px black;
                border-radius: 5px;
                text-align: center;
                margin-bottom: 20px;
            }

            .pagging-block {
                /*                position: absolute;
                                bottom: 10px;
                                left: 20px;*/
            }

            .product_table {
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .row_table {
                margin-bottom: 10px;
            }

            #edit {
                height: 200px;
                width: 300px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                padding: 20px;
                position: fixed;
                left: 700px;
                display: none;
            }

            #addnew {
                height: 200px;
                width: 350px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                padding: 20px;
                position: fixed;
                left: 700px;
                display: none;
            }
            .actives{
                background-color: #e0f3ff;
                color: #3f6ad8;
                text-decoration: none;
                font-weight: 600;
            }
        </style>
        <script>
            function time(x) {
                var month = document.getElementById("month");
                var year = document.getElementById("year");
//                console.log(typeof(year.value));
                if (year.value != "") {
                    month.disabled = false;
                } else {
                    month.disabled = true;
                    month.value = "";
                }
            }
        </script>
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

                <div class="main col-md-10" >
                    <div class="container" style="width: 100%">
                        <div class="row">
                            <h1 style="color: #495057; font-weight: 500;">Đơn hàng</h1>
                            <div class="col-md-12" id="so_lieu">
                                <div>
                                    <p style="color: #9a9ea2; font-size: 20px;">Số đơn</p>
                                    <p class="so_luong">${requestScope.quantity}</p>
                                </div>
                                <div>
                                    <p style="color: #9a9ea2; font-size: 20px;">Doanh thu</p>
                                    <p class="so_luong" style="color:#3ac47d; "><fmt:formatNumber value = "${requestScope.dongia}"/></p>
                                </div>
                            </div>
                            <div class="col-md-12 product_table">
                                <h4 style="margin-left: 20px; color: #333; font-weight: 600;">Order</h4>
                                <div style="margin-left: 20px; margin-bottom: 10px;">
                                    <form action="adminorder">
                                        Sắp xếp theo: <select style="margin-right: 10px;" name="orderby">
                                            <option value="id" <c:if test="${orderby eq 'id'}">selected</c:if>>ID</option>
                                            <option value="don_gia" <c:if test="${orderby eq 'don_gia'}">selected</c:if>>Đơn giá</option>
                                            <option value="ngay_dat_hang" <c:if test="${orderby eq 'ngay_dat_hang'}">selected</c:if>>Ngày đặt hàng</option>
                                            </select>
                                            Theo thứ tự<select style="margin-right: 10px;" name="order">
                                                <option value="asc" <c:if test="${order eq 'asc'}">selected</c:if>>Tăng dần</option>
                                            <option value="desc" <c:if test="${order eq 'desc'}">selected</c:if>>Giảm giần</option>
                                            </select>
                                            Trạng thái<select style="margin-right: 10px;" name="status">
                                                <option></option>
                                                <option value="1" <c:if test="${status == 1}">selected</c:if>>Đang xử lý</option>
                                            <option value="2" <c:if test="${status == 2}">selected</c:if>>Đang giao hàng</option>
                                            <option value="3" <c:if test="${status == 3}">selected</c:if>>Hoàn thành</option>
                                            <option value="4"<c:if test="${status == 4}">selected</c:if>>Đã huỷ</option>
                                            </select>
                                            Năm <select id="year" name="year" onchange="time()">
                                                <option></option>
                                                <option value="2020" <c:if test="${requestScope.year == 2020}">selected</c:if>>2020</option>
                                            <option value="2021" <c:if test="${requestScope.year == 2021}">selected</c:if>>2021</option>
                                            <option value="2022" <c:if test="${requestScope.year == 2022}">selected</c:if>>2022</option>
                                            <option value="2023" <c:if test="${requestScope.year == 2023}">selected</c:if>>2023</option>
                                            </select>
                                            Tháng <select id="month" name="month" <c:if test="${year == 0 || year == null}"> disabled=""</c:if>>
                                                <option value=""></option>
                                                <option value="1" <c:if test="${month == 1}">selected</c:if>>1</option>
                                            <option value="2" <c:if test="${month == 2}">selected</c:if>>2</option>
                                            <option value="3" <c:if test="${month == 3}">selected</c:if>>3</option>
                                            <option value="4" <c:if test="${month == 4}">selected</c:if>>4</option>
                                            <option value="5" <c:if test="${month == 5}">selected</c:if>>5</option>
                                            <option value="6" <c:if test="${month == 6}">selected</c:if>>6</option>
                                            <option value="7" <c:if test="${month == 7}">selected</c:if>>7</option>
                                            <option value="8" <c:if test="${month == 8}">selected</c:if>>8</option>
                                            <option value="9" <c:if test="${month == 9}">selected</c:if>>9</option>
                                            <option value="10" <c:if test="${month == 10}">selected</c:if>>10</option>
                                            <option value="11" <c:if test="${month == 11}">selected</c:if>>11</option>
                                            <option value="12" <c:if test="${month == 12}">selected</c:if>>12</option>
                                            </select>
                                            <button>Lọc</button>
                                        </form>
                                    </div>
                                    <table class="table table-striped table-hover table-condensed" style="width: 100%">
                                        <thead>
                                            <tr style="height: 30px">
                                                <th> ID </th>
                                                <th> Người đặt </th>
                                                <th> Ngày đặt hàng </th>
                                                <th> Ngày giao hàng </th>
                                                <th> Ngày nhận hàng </th>
                                                <th> Phương thức thanh toán </th>
                                                <th> Đơn giá </th>
                                                <th> Trạng thái </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${orderlst}" var="o">
                                            <tr>
                                                <td>${o.id}</td>                                   
                                                <td>${o.userId}</td>
                                                <td>${o.orderDate}</td>
                                                <td>${o.shipDate}</td>
                                                <td>${o.receiveDate}</td>
                                                <td><c:if test="${o.purchase_method == 1}">
                                                        Thanh toán trực tiếp khi giao hàng
                                                    </c:if>
                                                    <c:if test="${o.purchase_method == 2}">
                                                        Thanh toán bằng thẻ quốc tế và nội địa (ATM)
                                                    </c:if>
                                                    <c:if test="${o.purchase_method == 3}">
                                                        Thanh toán bằng ví MoMo
                                                    </c:if>
                                                </td>
                                                <td><fmt:formatNumber value = "${o.price}"/></td>
                                                <td><c:if test="${o.status == 1}">
                                                        Đang xử lý
                                                    </c:if>
                                                    <c:if test="${o.status == 2}">
                                                        Đang giao
                                                    </c:if>   
                                                    <c:if test="${o.status == 3}">
                                                        Hoàn tất
                                                    </c:if>
                                                    <c:if test="${o.status == 4}">
                                                        Đã huỷ
                                                    </c:if>
                                                </td>

                                                <td>
                                                    <c:if test="${o.status == 1}">
                                                        <a href="updatestatus?id=${o.id}&update=2&index=${requestScope.index}&orderby=${requestScope.orderby}&order=${requestScope.order}&status=${requestScope.status}&year=${requestScope.year}&month=${requestScope.month}"><button>GIAO HÀNG</button></a>
                                                    </c:if>
                                                    <c:if test="${o.status == 2}">
                                                        <a href="updatestatus?id=${o.id}&update=3&index=${requestScope.index}&orderby=${requestScope.orderby}&order=${requestScope.order}&status=${requestScope.status}&year=${requestScope.year}&month=${requestScope.month}"><button>Hoàn Thành</button></a>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <a href="orderdetails?id=${o.id}&index=${requestScope.index}&orderby=${requestScope.orderby}&order=${requestScope.order}&status=${requestScope.status}&year=${requestScope.year}&month=${requestScope.month}"><i class="ti-pencil"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                <div>
                                    <c:forEach begin="1" end="${endpage}" var="i">
                                        <a href="adminorder?index=${i}&orderby=${requestScope.orderby}&order=${requestScope.order}&status=${requestScope.status}&year=${requestScope.year}&month=${requestScope.month}" class="pagging" style="<c:if test="${index == i}">
                                           background-color: #d92550; border: 0;
                                            </c:if>">${i}</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
