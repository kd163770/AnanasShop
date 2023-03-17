<%-- 
    Document   : adminshoe
    Created on : Mar 12, 2023, 9:41:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
                height: 1200px;
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

            .pagging {
                display: inline-block;
                width: 30px;
                height: 30px;
                border: solid 1px black;
                border-radius: 5px;
                text-align: center;
            }

            .pagging-block {
                position: absolute;
                bottom: 10px;
                left: 20px;
            }

            .product_table {
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .pagging_product {
                margin-bottom: 10px;
            }

            .row_table {
                margin-bottom: 10px;
                display: inline-block;
            }


            #addnew {
                /*height: 200px;*/
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
            function addnew() {
                var edit = document.getElementById("addnew");
                edit.style.display = 'block';
            }
            function cancle(x) {
                document.getElementById(x).style.display = 'none';
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
                    <a class="nav actives">Sản phẩm</a>
                    <a class="nav" href="adminorder">Đơn hàng</a>
                    <a class="nav" href="adminaccount">Khách hàng</a>
                </div>

                <div class="main col-md-10">
                    <div class="container" style="width: 100%;">
                        <div class="row" >
                            <div class="col-md-12 product_table">
                                <h4 style="margin-left: 20px; color: #333; font-weight: 600;">Sản phẩm</h4>
                                <div style="margin-left: 20px; margin-bottom: 10px;">
                                    <form action="adminshoe" method="">
                                        Sắp xếp theo: <select style="margin-right: 10px;" name="orderby">
                                            <option value="masp"<c:if test="${orderby eq 'masp'}">selected</c:if>>MASP</option>
                                            <option value="name" <c:if test="${orderby eq 'name'}">selected</c:if>>Tên</option>
                                            <option value="gia_tien" <c:if test="${orderby eq 'gia_tien'}">selected</c:if>>Gía Tiền</option>
                                            <option value="ngay_ra_mat" <c:if test="${orderby eq 'ngay_ra_mat'}">selected</c:if>>Ngày ra mắt</option>
                                            </select>
                                            Theo thứ tự<select style="margin-right: 10px;" name="order" value="${requestScope.order}">
                                            <option value="asc" <c:if test="${order eq 'asc'}">selected</c:if>>Tăng dần</option>
                                            <option value="desc" <c:if test="${order eq 'desc'}">selected</c:if>>Giảm dần</option>
                                            </select>
                                            Loại giày<select style="margin-right: 10px;" name="loaigiay" value="${requestScope.loaigiay}">
                                            <option value="0" <c:if test="${loaigiay == 0}">selected</c:if>></option>
                                            <c:forEach items="${lglist}" var="o">
                                                <option value="${o.id}" <c:if test="${loaigiay == o.id}">selected</c:if>>${o.name}</option>
                                            </c:forEach>
                                        </select>
                                        Kiểu dáng <select style="margin-right: 10px;" name="kieudang" value="${requestScope.kieudang}">
                                            <option value="0" <c:if test="${kieudang == 0}">selected</c:if>></option>
                                            <c:forEach items="${kdlist}" var="o">
                                                <option value="${o.id}" <c:if test="${kieudang == o.id}">selected</c:if>>${o.name}</option>
                                            </c:forEach>
                                        </select>
                                        Giới tính <select name="gender" name="gender" value="${requestScope.gender}">
                                            <option value="null"></option>
                                            <option value="NAM" <c:if test="${gender eq 'NAM'}">selected</c:if>>Nam</option>
                                            <option value="NU"<c:if test="${gender eq 'NU'}">selected</c:if>>Nữ</option>
                                            <option value="UNISEX"<c:if test="${gender eq 'UNISEX'}">selected</c:if>>Unisex</option>
                                            </select>
                                            <button>Lọc</button>
                                        </form>
                                        <a style="margin-left: 250px; color: white; background-color: #333; border: 0; height: 40px; float: right" href="insertproduct"><i
                                                class="ti-plus"></i>Thêm giày mới</a>
                                    </div>
                                    <table class="table table-striped table-hover table-condensed" style="width: 100%">
                                        <thead>
                                            <tr style="height: 30px">
                                                <th> MASP </th>
                                                <td> Image </td>
                                                <th> Name </th>
                                                <th> Giá </th>
                                                <th> Giảm </th>
                                                <th> Loại Giày </th>
                                                <th> Kiểu dáng </th>
                                                <th> Giới tính </th>
                                                <th>Ngày ra mắt</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${lst}" var="o">
                                            <tr>
                                                <td class="" value="">${o.id}</td>
                                                <td style="width: 100px"><img src="image/productimage/${o.id}/1.jpg" style="width: 100px; height: 100px"></td>
                                                <td class="" value="BASAS BUMPER GUM EXT NE">${o.name}</td>
                                                <td class="" value="6500000">${o.price}</td>
                                                <td class="" value="0">${o.sale_price}</td>
                                                <td class="" value="track 6">${o.loai_giay}</td>
                                                <td class="" value="1">${o.kieu_dang}</td>
                                                <td class="" value="NAM">${o.gioi_tinh}</td>
                                                <td class="" value="2022-04-02">${o.ngay_ra_mat}</td>
                                                <td><a title="chỉnh sửa" href="productdetails?masp=${o.id}"><i
                                                            class="ti-pencil"></i></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="pagging_product">
                                    <c:forEach begin="1" end="${endpage}" var="i">
                                        <a href="adminshoe?index=${i}&orderby=${requestScope.orderby}&order=${requestScope.order}&kieudang=${requestScope.kieudang}&loaigiay=${requestScope.loaigiay}&gender=${requestScope.gender}" class="pagging" style="<c:if test="${index == i}">
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
    </div>
</body>

</html>
