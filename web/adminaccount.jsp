<%-- 
    Document   : adminaccount
    Created on : Mar 13, 2023, 7:00:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                    <a class="nav" href="adminorder">Đơn hàng</a>
                    <a class="nav actives">Khách hàng</a>
                </div>

                <div class="main col-md-10">
                    <div class="container" style="width: 100%;">
                        <div class="row">
                            <h1 style="color: #495057; font-weight: 500;">Tài Khoản</h1>

                            <div class="col-md-12 product_table">
                                <h4 style="margin-left: 20px; color: #333; font-weight: 600;">Tài khoản</h4>
                                <div style="margin-left: 20px; margin-bottom: 10px;">
                                    <form action="adminaccount">
                                        Sắp xếp theo: <select style="margin-right: 10px;" name="orderby">
                                            <option value="ID" <c:if test="${orderby eq 'id'}">selected</c:if>>ID</option>
                                            <option value="Ho_Ten" <c:if test="${orderby eq 'Ho_Ten'}">selected</c:if>>Tên</option>
                                            <option value="Ngay_Sinh" <c:if test="${orderby eq 'Ngay_Sinh'}">selected</c:if>>Ngày_Sinh</option>
                                        </select>
                                        Theo thứ tự<select style="margin-right: 10px;" name="order">
                                            <option value="asc" <c:if test="${order eq 'asc'}">selected</c:if>>Tăng dần</option>
                                            <option value="desc" <c:if test="${order eq 'desc'}">selected</c:if>>Giảm giần</option>
                                        </select>
                                        Giới tính<select style="margin-right: 10px;" name="gender">
                                            <option></option>
                                            <option value="NAM" <c:if test="${gender eq 'NAM'}">selected</c:if>>Nam</option>
                                            <option value="NU"<c:if test="${gender eq 'NU'}">selected</c:if>>Nữ</option>
                                            <option value="KHAC" <c:if test="${gender eq 'KHAC'}">selected</c:if>>Khác</option>
                                        </select>
                                        Trạng Thái <select name="status" id="">
                                            <option></option>
                                            <option value="0"  <c:if test="${status eq '0'}">selected</c:if>>Cấm</option>
                                            <option value="1"  <c:if test="${status eq '1'}">selected</c:if>>Không cấm</option>
                                        </select>
                                        <button>Lọc</button>
                                    </form>
                                </div>
                                <table class="table table-striped table-hover table-condensed" style="width: 100%">
                                    <thead>
                                        <tr style="height: 30px">
                                            <th> ID </th>
                                            <th> Họ Tên </th>
                                            <th> Ngày Sinh </th>
                                            <th> Giới Tính </th>
                                            <th> Số điện thoại </th>
                                            <th> Email </th>
                                            <th> Địa chỉ </th>
                                            <th> Tổng chi tiêu</th>
                                            <th> Trạng Thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${customerlist}" var="o">
                                            <tr>
                                                <td>${o.username}</td>                                   
                                                <td>${o.ho_ten}</td>
                                                <td>${o.ngay_sinh}</td>
                                                <td>${o.gioi_tinh}</td>
                                                <td>${o.sdt}</td>
                                                <td>${o.email}</td>
                                                <td>${o.dia_chi}</td>
                                                <td><fmt:formatNumber value = "${o.chitieu}"/></td>
                                                <td>
                                                    <c:if test="${o.status == true}">
                                                        <a href="updateaccountstatus?id=${o.username}&updatestatus=0&index=${index}&orderby=${requestScope.orderby}&order=${requestScope.order}&status=${requestScope.status}&gender=${requestScope.gender}"><button style="background-color: red; color: white">Cấm</button></a>
                                                    </c:if>
                                                    <c:if test="${o.status == false}">
                                                        <a href="updateaccountstatus?id=${o.username}&updatestatus=1&index=${index}&orderby=${requestScope.orderby}&order=${requestScope.order}&status=${requestScope.status}&gender=${requestScope.gender}"><button style="background-color: green; color: white">Bỏ Cấm</button></a>
                                                    </c:if>
                                                </td>   
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                <div class="pagging_product">
                                    <c:forEach begin="1" end="${endpage}" var="i">
                                        <a href="adminaccount?index=${i}&orderby=${requestScope.orderby}&order=${requestScope.order}&status=${requestScope.status}&gender=${requestScope.gender}" class="pagging" style="<c:if test="${index == i}">
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
