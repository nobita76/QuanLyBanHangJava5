<%-- 
    Document   : cau1
    Created on : Jun 4, 2020, 10:11:32 AM
    Author     : HOME
--%>

<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                                    <link rel="icon" href="${pageContext.request.contextPath }/images/thanhdeptrai.webp" sizes="192x192"/>

        <link href="${pageContext.request.contextPath }/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/styles/bootstrap-4.1.3/bootstrap.css">
        <script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath }/styles/bootstrap-4.1.3/popper.js"></script>
        <script src="${pageContext.request.contextPath }/styles/bootstrap-4.1.3/bootstrap.min.js"></script>
                            <script src="${pageContext.request.contextPath }/js/toastr.min.js"></script>
            <script src="${pageContext.request.contextPath }/js/jquery.dataTables.min.js"></script>
<link rel='stylesheet' href='${pageContext.request.contextPath }/styles/bootstrap-4.1.3/jquery.dataTables.min.css' />
    </head>

    <body>
        <div class="container">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                        aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <a class="navbar-brand" href="#">${sessionScope.username}</a>
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/index.html">SHOP</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" tabindex="-1" aria-disabled="true" data-toggle="modal" data-target="#modalInsert">Thêm sản phẩm <i class="fa fa-plus-circle"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/index.html">QL Tài Khoản</a>
                        </li
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/donhang.html">QL Đơn Hàng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/danhmuc.html">QL Danh Mục</a>
                        </li>
                    </ul>
                    
                </div>
            </nav>


            <div class="row">
                <div class="col-3">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action">THÔNG TIN HỆ THỐNG</a>


                        <a href="#" class="list-group-item list-group-item-action list-group-item-primary">Đã có <span class="badge badge-light" id="totalUsers">Loading...</span> tài khoản</a>
                        <a href="#" class="list-group-item list-group-item-action list-group-item-secondary">Trong đó <span class="badge badge-danger" id="totalAdmins">Loading...</span> QTV</a></a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-success">Đã có <span class="badge badge-success" id="totalSP">Loading...</span> sản phẩm</a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-danger">Đã có <span class="badge badge-danger" id="totalDM">Loading...</span> danh mục</a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-warning">Đã có <span class="badge badge-warning" id="totalDH">Loading...</span> đơn hàng</a>

                        <a href="#" class="list-group-item list-group-item-action list-group-item-info">A simple info list
                            group item</a>
                        <a href="#" class="list-group-item list-group-item-action list-group-item-light">A simple light list
                            group item</a>
                        <a href="#" class="list-group-item list-group-item-action list-group-item-dark">A simple dark list
                            group item</a>
                    </div>

                </div>

                <div class="col-9">
                    <!-- <img src="images/vai-ao-dai-1.jpg" height="600px" width="800px" alt=""> -->

                    <center>
                        <h1>QUẢN LÝ SẢN PHẨM</h1>
                    <table border="1" id="bootstrap-data-table-Login" class="table table-striped table-bordered">
                        <thead class="thead-dark">
                                <tr>
                                    <th width="5%">Mã SP</th>
                                    <th widh="30%">Tên SP</th>
                                    <th width="5%">Đơn giá</th>
                                    <th width="5%">Số lượng</th>
                                    <th>Hình</th>
                                    <th>Type</th>
                                    <th>Mã DM</th>
                                    <th>Hành động</th>
                                    <th>Hành động</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${list}">
                                    <tr>

                                        <td class="hidden-xs" align="center">${u.maSP}</td>
                                        <td align="center">${u.tenSP}</td>
                                        <td align="center">${u.donGia}</td>
                                        <c:choose>
                                            <c:when test="${u.soLuong <= 0}">
                                                <td align="center"><font color="red">${u.soLuong}</font></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td align="center">${u.soLuong}</td>

                                                </c:otherwise>
                                        </c:choose>
                                        
                                        <td align="center"><image src="${pageContext.request.contextPath }/images/${u.hinh}" width="100px"></td>
                                        <td align="center">${u.type}</td>
                                        <c:forEach var="dm" items="${listDM}">
                                            <c:choose>
                                                <c:when test="${dm.maDM == u.maDM}">
                                                    <td align="center">${dm.tenDM}</td>
                                                </c:when>
                                                </c:choose>
                                        
                                        </c:forEach>
                                        <td><center><a class="btn btn-info" onclick="loadInfomation('${u.maSP}');"><em class="fa fa-wrench"></em></a>
                                </center></td>
                                <td><center><a class="btn btn-danger" href="deleteSP.html?maSP=${u.maSP}"><i class="fa fa-trash"></i></a></center></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </center>
                </div>
            </div>
        </div>


        <script>
            $(document).ready(function () {
                loadCount();
                $('#bootstrap-data-table-Login').DataTable();
            })


            function loadCount() {
                $.get('api/count.html').done(function (ps10511) {
                    ps10511 = JSON.parse(ps10511);
                    $("#totalUsers").html(ps10511.countUsers);
                    $("#totalAdmins").html(ps10511.countAdmins);
                    $("#totalSP").html(ps10511.countSP);
                    $("#totalDM").html(ps10511.countDM);
                    $("#totalDH").html(ps10511.countDH);
                })
            }


            /*
             * 
             * Load Username
             * 
             * 
             */

            function loadInfomation(username) {
                $.get('api/getInfoSP.html?maSP=' + username).done(function (ps10511) {
                    ps10511 = JSON.parse(ps10511);
                    console.log(ps10511);
                    $("#myModal").modal();
                    writeInfoToModal(ps10511);
                })
            }

            function writeInfoToModal(ps10511) {
                $("#tensp_update").html(ps10511.tenSp);
                $("#masp_form").val(ps10511.maSP);
                $("#tensp_form").val(ps10511.tenSp);
                $("#dongia_form").val(ps10511.donGia);
                $("#soluong_form").val(ps10511.soLuong);
                $("#type_form").val(ps10511.type);
                $("#dm_form").val(ps10511.maDM);
                $("#oldimg").val(ps10511.hinh);
            }
        </script>



        <!-- Modal update -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cập nhật cho sản phảm <span id="tensp_update"></span></h4>
                    </div>
                    <div class="modal-body">
                        <p><form class="control-panel" id="form-update" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/admin/updateSP.html">
                            Mã SP:
                            <input class="form-control" id="masp_form" name="masp_form" readonly="true"><br>
                            Tên SP:
                            <input class="form-control" id="tensp_form" name="tensp_form"><br>
                            Đơn giá:
                            <input class="form-control" type="number" name="dongia_form" id="dongia_form"><br>
                            Số lượng:
                            <input class="form-control" type="number" name="soluong_form" id="soluong_form"><br>
                            Hình ảnh:
                            <input type="checkbox" name="checkOldImage" id="checkOldImage" checked>
                              Giữ ảnh cũ
                            <input class="form-control" type="file" name="photo_form" id="photo_form"><br>
                              
                            <input hidden="true" id="oldimg" name="oldimg">
        
                            Type
                            <select class="form-control" id="type_form" name="type_form">
                                <option value="new">NEW</option>
                                <option value="hot">HOT</option>
                                <option value="sale">SALE</option>
                                <option value="normal">NORMAL</option>
                            </select><br>
                            Danh Mục
                            <select class="form-control" id="dm_form" name="dm_form">
                                <c:forEach var="dm" items="${listDM}">
                                    <option value="${dm.maDM}">${dm.tenDM}</option>
                                </c:forEach>
                            </select><br>
                            <input class="btn btn-primary" type="submit" value="Cập nhật" name="Action">
                        </form></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- end Modal update -->

        <!-- Modal insert danh muc -->
        <div class="modal fade" id="modalInsertDanhMuc" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">THÊM DANH MỤC MỚI - QUẢN TRỊ VIÊN</h4>
                    </div>
                    <div class="modal-body">
                        <p><form class="control-panel" id="form-insert" method="post" action="${pageContext.request.contextPath }/admin/insertDM.html">
                            Tên Danh Mục:
                            <input class="form-control" id="tenDM_insert" name="tenDM_insert"><br>
                           <input class="btn btn-primary" type="submit" value="Thêm" name="Action">

                            </p>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- end Modal insert danh muc -->
        <!-- Modal insert -->
        <div class="modal fade" id="modalInsert" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">THÊM SẢN PHẨM MỚI - QUẢN TRỊ VIÊN</h4>
                    </div>
                    <div class="modal-body">
                        <p><form class="control-panel" enctype="multipart/form-data" id="form-update" method="post" action="${pageContext.request.contextPath }/admin/insertSP.html">
                            Tên SP:
                            <input class="form-control" id="tensp_insert" name="tensp_insert"><br>
                            Đơn giá:
                            <input class="form-control" type="number" name="dongia_insert" id="dongia_insert"><br>
                            Số lượng:
                            <input class="form-control" type="number" name="soluong_insert" id="soluong_insert"><br>
                            Hình ảnh:
                            <input class="form-control" type="file" name="photo_insert" id="photo_insert"><br>
                            
        
                            Type
                            <select class="form-control" id="type_insert" name="type_insert">
                                <option value="new">NEW</option>
                                <option value="hot">HOT</option>
                                <option value="sale">SALE</option>
                                <option value="normal">NORMAL</option>
                            </select><br>
                            Danh Mục
                            <select class="form-control" id="dm_insert" name="dm_insert">
                                <c:forEach var="dm" items="${listDM}">
                                    <option value="${dm.maDM}">${dm.tenDM}</option>
                                </c:forEach>
                            </select><br>
                            <input class="btn btn-primary" type="submit" value="Đăng ký" name="Action">
                            
                            
                        </form></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- end Modal insert -->


        <script>
            $("#btnUpdateUser").click(function () {


            })
        </script>
       </body>

</html>