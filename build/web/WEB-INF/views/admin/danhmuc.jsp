<%-- 
    Document   : cau1
    Created on : Jun 4, 2020, 10:11:32 AM
    Author     : HOME
--%>

<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

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
                            <a class="nav-link" href="#" tabindex="-1" aria-disabled="true" data-toggle="modal" data-target="#modalInsertDanhMuc">Thêm danh mục <i class="fa plus-square"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/index.html">QL Tài Khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/sanpham.html">QL Sản Phẩm</a>
                        </li
                        
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/donhang.html">QL Đơn Hàng</a>
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
                        <h1>QUẢN LÝ DANH MỤC</h1>
                    <table border="1" id="bootstrap-data-table-Login" class="table table-striped table-bordered">
                        <thead class="thead-dark">
                                <tr>
                                    <th width="5%">Mã Danh Mục</th>
                                    <th>Tên Danh Mục</th>
                                    
                                    <th>Hành động</th>
                                    <th>Hành động</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${listDM}">
                                    <tr>

                                        <td class="hidden-xs" align="center">${u.maDM}</td>
                                        <td align="center">${u.tenDM}</td>
                                       
                                        
                                        
                                        <td><center><a class="btn btn-info" onclick="loadInfomation('${u.maDM}');"><em class="fa fa-wrench"></em></a>
                                </center></td>
                                <td><center><a class="btn btn-danger" href="deleteDM.html?maDM=${u.maDM}"><i class="fa fa-trash"></i></a></center></td>
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
                $.get('api/getInfoDM.html?maDM=' + username).done(function (ps10511) {
                    ps10511 = JSON.parse(ps10511);
                    console.log(ps10511);
                    $("#myModal").modal();
                    writeInfoToModal(ps10511);
                })
            }

            function writeInfoToModal(ps10511) {
                $("#tendm_update").html(ps10511.tenDM);
                $("#madm_form").val(ps10511.maDM);
                $("#tendm_form").val(ps10511.tenDM);
                
            }
        </script>



        <!-- Modal update -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cập nhật cho <span id="tendm_update"></span></h4>
                    </div>
                    <div class="modal-body">
                        <p><form class="control-panel" id="form-update" method="post" action="${pageContext.request.contextPath }/admin/updateDM.html">
                            Mã DM:
                            <input class="form-control" id="madm_form" name="madm_form" readonly="true"><br>
                            Tên DM:
                            <input class="form-control" id="tendm_form" name="tendm_form"><br>
                            
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
                            <input class="form-control" id="tendm_insert" name="tendm_insert"><br>
                           <input class="btn btn-primary" type="submit" value="Thêm" name="Action">
                        </form>
                            </p>
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