<%-- 
    Document   : adminproduct
    Created on : Mar 11, 2023, 2:26:34 PM
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
                height: 600px;
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
            
            .actives{
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

            .pagging_product {
                margin-bottom: 10px;
            }

            .row_table {
                margin-bottom: 10px;
            }

            .form-giay {
                background-color: #fff;
                padding: 20px;
                position: fixed;
                margin-left: 200px;
                /* display: none; */
            }
            #edit {
                height: 200px;
                width: 300px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                padding: 20px;
                position: fixed;
                left: 600px;
                top: 200px;
                display: none;
            }
            #cancel{
                height: 200px;
                width: 300px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                padding: 20px;
                position: fixed;
                left: 600px;
                top: 200px;
                display: none;
            }
            #addnew {
                height: 200px;
                width: 350px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                padding: 20px;
                position: fixed;
                left: 600px;
                top: 200px;
                display: none;
            }
            #edit2 {
                height: 200px;
                width: 300px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                padding: 20px;
                position: fixed;
                left: 600px;
                top: 200px;
                display: none;
            }
            #cancel2{
                height: 200px;
                width: 300px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                padding: 20px;
                position: fixed;
                left: 600px;
                top: 200px;
                display: none;
            }
            #addnew2 {
                height: 200px;
                width: 350px;
                background-color: #fff;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                padding: 20px;
                position: fixed;
                left: 600px;
                top: 200px;
                display: none;
            }
        </style>
        <script>
            function sortlg(x, y, z) {
                window.location = "adminproduct?sortlg=" + x + "&kieu_dang=" + y + "&sortkd=" + z;
            }
            function sortkd(x, y, z) {
                window.location = "adminproduct?sortkd=" + x + "&loai_giay=" + y + "&sortlg=" + z;
            }

            function edit(id, x) {
                var edit = document.getElementById("edit");
                var oldname = document.getElementById("oldname");
                oldname.value = x;
                document.getElementById("id_loaigiay").value = id;
                edit.style.display = 'block';
            }

            function addnew(x) {
                var edit = document.getElementById("addnew");
                edit.style.display = 'block';
            }
            function edit2(id, x) {
                var edit = document.getElementById("edit2");
                var oldname = document.getElementById("oldname2");
                oldname.value = x;
                document.getElementById("id_kieudang").value = id;
                edit.style.display = 'block';
            }

            function addnew2(x) {
                var edit = document.getElementById("addnew2");
                edit.style.display = 'block';
            }
            function cancel(x) {
                document.getElementById(x).style.display = 'none';
            }
            function deletes(x, y){
                var result = confirm("Bạn sẽ xoá " + y);
                if(result == true){
                    window.location = "deleteloaigiay?id=" +x;
                }
            }
            
            function deletes2(x, y){
                var result = confirm("Bạn sẽ xoá " + y);
                if(result == true){
                    window.location = "deletekieudang?id=" +x;
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
                    <a class="nav actives">Tổng quan</a>
                    <a class="nav" href="adminshoe">Sản phẩm</a>
                    <a class="nav" href="adminorder">Đơn hàng</a>
                    <a class="nav" href="adminaccount">Khách hàng</a>
                </div>

                <div class="main col-md-10">
                    <div class="container" style="width: 100%">
                        <div class="row">
                            <h1 style="color: #495057; font-weight: 500;">Kiểu Dáng và Loại Giày</h1>
                            <div class="col-md-12" id="so_lieu">
                                <div>
                                    <p style="color: #9a9ea2">Số lượng giày</p>
                                    <p class="so_luong">${requestScope.countshoe}</p>
                                </div>
                                <div>
                                    <p style="color: #9a9ea2">Số lượng kiểu dáng</p>
                                    <p class="so_luong" style="color:#d92550; ">${countkd}</p>
                                </div>
                                <div>
                                    <p style="color: #9a9ea2">Số lượng loại giày</p>
                                    <p class="so_luong" style="color:#3ac47d;">${countlg}</p>
                                </div>
                            </div>
                            <div class="col-md-12" style="padding: 0;">
                                <div class="sl_kg" id="sl" style="margin-right: 18px;">
                                    <h4 style="margin-left: 20px; color: #3ac47d; font-weight: 600;">Loại Giày</h4>
                                    <div style="margin-left: 20px; margin-bottom: 10px;">
                                        Sắp xếp theo: <select onchange="sortlg(this.value, '${requestScope.index_kd}', '${requestScope.sortlg}')">
                                            <option value="ID" <c:if test="${requestScope.sortlg eq 'ID'}">selected</c:if>>ID</option>
                                            <option value="NAME" <c:if test="${requestScope.sortlg eq 'NAME'}">selected</c:if>>TÊN</option>
                                            </select>
                                            <button
                                                style="margin-left: 250px; color: white; background-color: #3ac47d; border: 0; height: 40px;" onclick="addnew()"><i
                                                    class="ti-plus"></i> Thêm loại giày</button>
                                        </div>

                                        <table class="table table-striped table-hover table-condensed"
                                               style="width: 90%; margin-left: 25px;">
                                            <thead>
                                                <tr style="height: 30px">
                                                    <th> ID </th>
                                                    <th> TÊN </th>
                                                    <th> SỐ LƯỢNG </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${lst1}" var="o">
                                                <tr>
                                                    <td>${o.id}</td>
                                                    <td>${o.name}</td>
                                                    <td>${o.quantity}</td>
                                                    <td>
                                                        <a onclick="edit('${o.id}', '${o.name}')"><i class="ti-pencil" title="Chỉnh sửa"></i></a>
                                                        <c:if test="${o.quantity == 0}"><a><i class="ti-trash" title="Xoá" onclick="deletes(${o.id},'${o.name}')"></i></a></c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="pagging-block">
                                        <c:forEach begin="1" end="${endpage_lg}" var="i">
                                            <a href="adminproduct?loai_giay=${i}&sortlg=${requestScope.sortlg}&kieu_dang=${requestScope.index_kd}&sortkd=${requestScope.sortkd}" class="pagging" style="<c:if test="${index_lg == i}">
                                               background-color: #3ac47d; border: 0;
                                                </c:if>">${i}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="sl_kg">
                                    <h4 style="margin-left: 20px; color: #d92550; font-weight: 600;">Kiểu Dáng</h4>
                                    <div style="margin-left: 20px; margin-bottom: 10px;">
                                        Sắp xếp theo: <select onchange='sortkd(this.value, "${requestScope.index_lg}", "${requestScope.sortlg}")'>
                                            <option value="ID" <c:if test="${requestScope.sortkd eq 'ID'}">selected</c:if>>ID</option>
                                            <option value="NAME" <c:if test="${requestScope.sortkd eq 'NAME'}">selected</c:if>>TÊN</option>
                                            </select>
                                            <button
                                                style="margin-left: 250px; color: white; background-color: #d92550; border: 0; height: 40px;" onclick="addnew2()"><i
                                                    class="ti-plus"></i> Thêm kiểu dáng</button>
                                        </div>
                                        <table class="table table-striped table-hover table-condensed"
                                               style="width: 90%; margin-left: 25px;">
                                            <thead>
                                                <tr style="height: 30px">
                                                    <th> ID </th>
                                                    <th> TÊN </th>
                                                    <th> SỐ LƯỢNG </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${lst2}" var="o">
                                                <tr>
                                                    <td>${o.id}</td>
                                                    <td>${o.name}</td>
                                                    <td>${o.quantity}</td>
                                                    <td>
                                                        <a onclick="edit2('${o.id}', '${o.name}')"><i class="ti-pencil" title="Chỉnh sửa"></i></a>
                                                        <c:if test="${o.quantity == 0}"><a><i class="ti-trash" title="Xoá" onclick="deletes2(${o.id},'${o.name}')"></i></a></c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="pagging-block">
                                        <c:forEach begin="1" end="${endpage_kd}" var="i">
                                            <a href="adminproduct?kieu_dang=${i}&sortlg=${requestScope.sortlg}&loai_giay=${requestScope.index_lg}&sortkd=${requestScope.sortkd}" class="pagging" style="<c:if test="${index_kd == i}">
                                               background-color: #d92550; border: 0;
                                                </c:if>">${i}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" id="edit">     
                    <form action="editloaigiay" method="post">
                        <div class="row_table">
                            <div style="display: inline-block; width: 20%; height: 20px;">
                                <p>Tên cũ: </p>
                            </div>            
                            <input id="oldname" style="width: 60%; height: 35px;" type="text" disabled value=""> <br />
                        </div>
                        <input type="hidden" value="" name="id" id="id_loaigiay">
                        <div class="row_table">
                            <div style="display: inline-block; width: 20%; height: 20px;">
                                <p>Tên mới: </p>
                            </div>
                            <input style="width: 60%; height: 35px;" type="text" name="newname"><br />
                        </div>
                        <button style="margin-top: 20px; margin-right: 80px; margin-left: 20px;">Xác nhận</button>
                    </form>
                    <button style="position: absolute; right: 40px; bottom: 32px;" onclick="cancel('edit')">Huỷ</button>
                </div>

                <div class="col-md-4" id="addnew">
                    <form action="addloaigiay" name="add" method="post">
                        <div class="row_table">
                            <div style="display: inline-block; width: 20%; height: 20px;">
                                <p>Nhập tên: </p>
                            </div>
                            <input style="width: 60%; height: 35px; margin-top: 20px;" type="text" name="name"><br />
                        </div>
                        <button style="margin-top: 60px; margin-right: 80px; margin-left: 20px;"">Xác Nhận</button>
                    </form>
                    <button style="position: absolute; right: 40px; bottom: 32px;" onclick="cancel('addnew')">Huỷ</button>
                </div>
                <div class="col-md-4" id="cancel" <c:if test="${requestScope.err != null}"> style="display: block;"</c:if>>
                    <h3 style="color:red">${requestScope.err}</h3>
                    <button style="position: absolute; right: 40px; bottom: 32px;" onclick="cancel('cancel')">Cancel</button>
                </div>

                <div class="col-md-4" id="edit2">     
                    <form action="editkieudang" method="post">
                        <div class="row_table">
                            <div style="display: inline-block; width: 20%; height: 20px;">
                                <p>Tên cũ: </p>
                            </div>            
                            <input id="oldname2" style="width: 60%; height: 35px;" type="text" disabled value=""> <br />
                        </div>
                        <input type="hidden" value="" name="id" id="id_kieudang">
                        <div class="row_table">
                            <div style="display: inline-block; width: 20%; height: 20px;">
                                <p>Tên mới: </p>
                            </div>
                            <input style="width: 60%; height: 35px;" type="text" name="newname"><br />
                        </div>
                        <button style="margin-top: 20px; margin-right: 80px; margin-left: 20px;">Xác nhận</button>
                    </form>
                    <button style="position: absolute; right: 40px; bottom: 32px;" onclick="cancel('edit2')">Huỷ</button>
                </div>

                <div class="col-md-4" id="addnew2">
                    <form action="addkieudang" name="add" method="post">
                        <div class="row_table">
                            <div style="display: inline-block; width: 20%; height: 20px;">
                                <p>Nhập tên: </p>
                            </div>
                            <input style="width: 60%; height: 35px; margin-top: 20px;" type="text" name="name"><br />
                        </div>
                        <button style="margin-top: 60px; margin-right: 80px; margin-left: 20px;"">Xác Nhận</button>
                    </form>
                    <button style="position: absolute; right: 40px; bottom: 32px;" onclick="cancel('addnew2')">Huỷ</button>
                </div>
                <div class="col-md-4" id="cancel2" <c:if test="${requestScope.err != null}"> style="display: block;"</c:if>>
                    <h3 style="color:red">${requestScope.err}</h3>
                    <button style="position: absolute; right: 40px; bottom: 32px;" onclick="cancel('cancel2')">Cancel</button>
                </div>

            </div>
        </div>
    </body>

</html>
