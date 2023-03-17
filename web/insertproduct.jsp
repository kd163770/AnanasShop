<%-- 
    Document   : productdetails
    Created on : Mar 12, 2023, 2:07:39 PM
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

            .sl_kg {
                display: inline-block;
                margin-top: 20px;
                height: 300px;
                width: 49%;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                position: relative;
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
            function edit(x) {
                var edit = document.getElementById("edit");
                var oldname = document.getElementById("oldname");
                oldname.value = x;
                edit.style.display = 'block';
            }

            function addnew(x) {
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
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 product_table">
                                <h1>${requestScope.err}</h1>
                                <form action="insertproduct" class="form_user" style="margin-top: 20px;" method="post">
                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>MASP</p>
                                        </div>
                                        <input name="masp" style="width: 40%; height: 35px;" type="text"  value="${requestScope.masp}"> <br/>
                                    </div>
                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Tên: </p>
                                        </div>
                                        <input name="name" style="width: 40%; height: 35px;" type="text" value="${requestScope.name}"><br />
                                    </div>
                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Size nhỏ nhất: </p>
                                        </div>
                                        <input name="smallest_size" style="width: 40%; height: 35px;" type="number" value="${requestScope.smallest_size}" max="46" min="35"><br />
                                    </div>
                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Size lớn nhất: </p>
                                        </div>
                                        <input name="biggest_size" style="width: 40%; height: 35px;" type="number" value="${requestScope.biggest_size}" max="46" min="35"><br />
                                    </div>
                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Loại giày: </p>
                                        </div>
                                        <Select style="width: 40%; height: 35px;" type="text" name="loaigiay">
                                            <c:forEach items="${lglist}" var="o">
                                                <option value="${o.id}" <c:if test="${loaigiay == o.id}">selected</c:if>>${o.name}</option>
                                            </c:forEach>
                                        </Select><br />
                                    </div>
                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Kiểu Dáng: </p>
                                        </div>
                                        <Select style="width: 40%; height: 35px;" type="text" name="kieudang">
                                            <c:forEach items="${kdlist}" var="o">
                                                <option value="${o.id}" <c:if test="${kieudang == o.id}">selected</c:if>>${o.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Màu Sắc: </p>
                                        </div>
                                        <input name="color" style="width: 40%; height: 35px;" type="text" value="${requestScope.color}"><br />
                                    </div>

                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Giá tiền: </p>
                                        </div>
                                        <input name="price" style="width: 40%; height: 35px;" type="number" value="${requestScope.price}" min="1"><br />
                                    </div>

                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Sale(%): </p>
                                        </div>
                                        <input name="sale" style="width: 40%; height: 35px;" type="number" value="${requestScope.sale}" min="0" max="100"><br />
                                    </div>
                                    <div class="row_table">
                                        <div style="display: inline-block; width: 20%; height: 20px;">
                                            <p>Giới tính: </p>
                                        </div>
                                        <input type="radio" style="width: 15px; height: 15px;" name="gender" checked value="NAM"> Nam
                                        <input type="radio" style="width: 15px; height: 15px;" name="gender" value="NU" <c:if test="${gender eq 'NU'}">checked</c:if>> Nữ
                                        <input type="radio" style="width: 15px; height: 15px;" name="gender" value="UNISEX" <c:if test="${gender eq 'UNISEX'}">checked</c:if>> Khác <br/>
                                    </div>
                                    <button
                                        style="width: 100px; height: 40px; background-color: #ff5f17; border: 0; color: white; font-size: 23px; margin-bottom: 20px;">Thêm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>