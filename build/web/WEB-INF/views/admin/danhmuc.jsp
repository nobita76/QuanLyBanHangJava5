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
                            <a class="nav-link" href="#" tabindex="-1" aria-disabled="true" data-toggle="modal" data-target="#modalInsertDanhMuc">Th??m danh m???c <i class="fa plus-square"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/index.html">QL T??i Kho???n</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/sanpham.html">QL S???n Ph???m</a>
                        </li
                        
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/donhang.html">QL ????n H??ng</a>
                        </li>
                    </ul>
                    
                </div>
            </nav>


            <div class="row">
                <div class="col-3">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action">TH??NG TIN H??? TH???NG</a>


                        <a href="#" class="list-group-item list-group-item-action list-group-item-primary">???? c?? <span class="badge badge-light" id="totalUsers">Loading...</span> t??i kho???n</a>
                        <a href="#" class="list-group-item list-group-item-action list-group-item-secondary">Trong ???? <span class="badge badge-danger" id="totalAdmins">Loading...</span> QTV</a></a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-success">???? c?? <span class="badge badge-success" id="totalSP">Loading...</span> s???n ph???m</a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-danger">???? c?? <span class="badge badge-danger" id="totalDM">Loading...</span> danh m???c</a>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-warning">???? c?? <span class="badge badge-warning" id="totalDH">Loading...</span> ????n h??ng</a>

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
                        <h1>QU???N L?? DANH M???C</h1>
                    <table border="1" id="bootstrap-data-table-Login" class="table table-striped table-bordered">
                        <thead class="thead-dark">
                                <tr>
                                    <th width="5%">M?? Danh M???c</th>
                                    <th>T??n Danh M???c</th>
                                    
                                    <th>H??nh ?????ng</th>
                                    <th>H??nh ?????ng</th>
                                    
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
                        <h4 class="modal-title">C???p nh???t cho <span id="tendm_update"></span></h4>
                    </div>
                    <div class="modal-body">
                        <p><form class="control-panel" id="form-update" method="post" action="${pageContext.request.contextPath }/admin/updateDM.html">
                            M?? DM:
                            <input class="form-control" id="madm_form" name="madm_form" readonly="true"><br>
                            T??n DM:
                            <input class="form-control" id="tendm_form" name="tendm_form"><br>
                            
                            <input class="btn btn-primary" type="submit" value="C???p nh???t" name="Action">
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
                        <h4 class="modal-title">TH??M DANH M???C M???I - QU???N TR??? VI??N</h4>
                    </div>
                    <div class="modal-body">
                        <p><form class="control-panel" id="form-insert" method="post" action="${pageContext.request.contextPath }/admin/insertDM.html">
                            T??n Danh M???c:
                            <input class="form-control" id="tendm_insert" name="tendm_insert"><br>
                           <input class="btn btn-primary" type="submit" value="Th??m" name="Action">
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
                        <h4 class="modal-title">TH??M S???N PH???M M???I - QU???N TR??? VI??N</h4>
                    </div>
                    <div class="modal-body">
                        <p><form class="control-panel" enctype="multipart/form-data" id="form-update" method="post" action="${pageContext.request.contextPath }/admin/insertSP.html">
                            T??n SP:
                            <input class="form-control" id="tensp_insert" name="tensp_insert"><br>
                            ????n gi??:
                            <input class="form-control" type="number" name="dongia_insert" id="dongia_insert"><br>
                            S??? l?????ng:
                            <input class="form-control" type="number" name="soluong_insert" id="soluong_insert"><br>
                            H??nh ???nh:
                            <input class="form-control" type="file" name="photo_insert" id="photo_insert"><br>
                            
        
                            Type
                            <select class="form-control" id="type_insert" name="type_insert">
                                <option value="new">NEW</option>
                                <option value="hot">HOT</option>
                                <option value="sale">SALE</option>
                                <option value="normal">NORMAL</option>
                            </select><br>
                            Danh M???c
                            <select class="form-control" id="dm_insert" name="dm_insert">
                                <c:forEach var="dm" items="${listDM}">
                                    <option value="${dm.maDM}">${dm.tenDM}</option>
                                </c:forEach>
                            </select><br>
                            <input class="btn btn-primary" type="submit" value="????ng k??" name="Action">
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