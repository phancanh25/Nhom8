<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/student-css.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/event-add-css.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>">
        <base href= "${pageContext.servletContext.contextPath}/">
    </head>
    <body>
        <div class="div-login" id="div-login">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
            <img src="resources/img/logo-lite.png">
            <form>
                <input type="text" placeholder="Tên đăng nhập"><br>
                <input type="password" placeholder="Mật khẩu"><br>
                <button>Đăng nhập</button>
            </form>
            <div class="div-login-bottom">
                <a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang web trên facebook</a>
            </div>
        </div>
        <div class="div-top">
            <div class="div-top-wrapper">
                <a href="javascript:void(0)">&#9743 0987-654-321</a>
                <a href="javascript:void(0)">&#9993 ptithcm@edu.vn</a>
                <a href="javascript:void(0)" onclick="openLogin();">Login</a>
                <a href="javascript:void(0)"></a>
                <a href="javascript:void(0)">Register</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="index.htm">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="event.htm">DS kỳ bảo vệ</a>
                <a href="student.htm">DSSV</a>
                <a href="teacher.htm">DSGV</a>
                <a href="index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-event-add">
            <div class="div-event-add-wrapper" id="div-event-add-wrapper">
                <div class="div-event-add-step" id="div-event-table1">
                    <p class="event-add-title">Tiểu ban An toàn thông tin</p>
                    <table class="table table-striped table-event-add table-bordered" style="width: 98%; margin-top: 25px;">
                        <tr>
                            <th>Mã GV</th>
                            <th>Họ</th>
                            <th>Tên</th>
                            <th>SĐT</th>
                            <th>Địa chỉ</th>
                            <th>Chọn</th>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>   
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                    </table>
                </div>
                <div class="div-event-add-step" id="div-event-table2">
                    <p class="event-add-title">Tiểu ban Công nghệ đa phương tiện</p>
                    <table class="table table-striped table-event-add table-bordered" style="width: 98%; margin-top: 25px;">
                        <tr>
                            <th>Mã GV</th>
                            <th>Họ</th>
                            <th>Tên</th>
                            <th>SĐT</th>
                            <th>Địa chỉ</th>
                            <th>Chọn</th>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                    </table>
                </div>
                <div class="div-event-add-step" id="div-event-table3">
                    <p class="event-add-title">Tiểu ban Công nghệ thông tin</p>
                    <table class="table table-striped table-event-add table-bordered" style="width: 98%; margin-top: 25px;">
                        <tr>
                            <th>Mã GV</th>
                            <th>Họ</th>
                            <th>Tên</th>
                            <th>SĐT</th>
                            <th>Địa chỉ</th>
                            <th>Chọn</th>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td>GVAT001</td>
                            <td>Trương Tam</td>
                            <td>Phong</td>
                            <td>0987654321</td>
                            <td>P.Hiệp Phú, TP Thủ Đức, TP HCM</td>
                            <td><input type="checkbox"></td>
                        </tr>
                    </table>
                </div>
                <div class="div-event-add-step" id="div-event-table3">
                    <p class="event-add-title">Thêm sinh viên</p>
                    <table class="table table-striped table-event-add table-bordered" style="width: 98%; margin-top: 25px;">
                        <tr>
                            <th>MSSV</th>
                            <th>Họ</th>
                            <th>Tên</th>
                            <th>Lớp</th>
                            <th>Phái</th>
                            <th>Ngày sinh</th>
                            <th>Khóa</th>
                            <th>Tốt nghiệp</th>
                            <th>Chọn</th>
                            <th>GVHD</th>
                            <th>Tên đồ án</th>
                            <th>Chi tiết</th>
                        </tr>
                        <tr>
                            <td>N18DCAT001</td>
                            <td>Trương Vô</td>
                            <td>Kỵ</td>
                            <td>D18CQAT01-N</td>
                            <td>Nam</td>
                            <td>01/01/2000</td>
                            <td>2018</td>
                            <td>Chưa TN</td>
                            <td><input type="checkbox" class="student-check" onchange="check();"></td>
                            <td>
                                <select disabled class="select-teacher">
                                    <option>Trương Tam Phong</option>
                                    <option>Tạ Tốn</option>
                                    <option>Optimus</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" disabled class="project-name">
                            </td>
                            <td>
                                <input type="text" disabled class="project-detail">
                            </td>
                        </tr>
                        <tr>
                            <td>N18DCAT002</td>
                            <td>Lê Văn</td>
                            <td>Luyện</td>
                            <td>D18CQAT01-N</td>
                            <td>Nam</td>
                            <td>01/01/2000</td>
                            <td>2018</td>
                            <td>Chưa TN</td>
                            <td><input type="checkbox" class="student-check" onchange="check();"></td>
                            <td>
                                <select disabled class="select-teacher">
                                    <option>Trương Tam Phong</option>
                                    <option>Tạ Tốn</option>
                                    <option>Optimus</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" disabled class="project-name">
                            </td>
                            <td>
                                <input type="text" disabled class="project-detail">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="div-event-btn">
            <button class="prev-btn btn btn-primary" onclick="prevPageAddEvent();">Prev</button>
            <button class="next-btn btn btn-primary" onclick="nextPageAddEvent();">Next</button>
            <button class="finish-btn btn btn-success" onclick="" id="btn-success" disabled>Finish</button>
        </div>
        
    </body>
</html>
<!-- <script src="resources/script.js"></script> -->
<script src="<c:url value="/resources/script.js"/>"></script>