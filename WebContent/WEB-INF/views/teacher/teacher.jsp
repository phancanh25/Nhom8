<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- <link rel="stylesheet" type="text/css" href="css.css"> -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css.css"/>">
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
        <link rel="stylesheet" type="text/css" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>">
    </head>
    <body>
        <div class="div-login" id="div-login">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
            <!-- <img src="img/logo-lite.png"> -->
            <img src="<c:url value="/resources/img/logo-lite.png"/>">
            <form>
                <input type="text" placeholder="Tên đăng nhập"><br>
                <input type="password" placeholder="Mật khẩu"><br>
                <button>Đăng nhập</button>
            </form>
            <div class="div-login-bottom">
                <a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang web trên facebook</a>
            </div>
        </div>
        <div class="div-add-teacher" id="div-add-teacher">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeAddTeacher();" style="color: white; margin-top: -10px;">&times</a>
            <p>Thêm giảng viên</p>
            <form>
                <input type="text" placeholder="Họ"><br>
                <input type="text" placeholder="Tên"><br>
                <input type="text" placeholder="SĐT"><br>
                <input type="text" placeholder="Địa chỉ"><br>
                <button>Thêm</button>
            </form>
            <div class="div-login-bottom">
                <a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang web trên facebook</a>
            </div>
        </div>
        <div class="div-edit-teacher" id="div-edit-teacher">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeEditTeacher();" style="color: white; margin-top: -10px;">&times</a>
            <p>Chỉnh sửa thông tin giảng viên</p>
            <form>
                <input type="text" placeholder="Họ"><br>
                <input type="text" placeholder="Tên"><br>
                <input type="text" placeholder="SĐT"><br>
                <input type="text" placeholder="Địa chỉ"><br>
                <button>Cập nhật</button>
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
                <a href="index.html">
                    <!-- <img src="img/logo.png" class="img-logo"> -->
                    <img src="<c:url value="/resources/img/logo.png"/>" class="img-logo" >
                </a>
                <a href="event.htm">DS kỳ bảo vệ</a>
                <a href="student.htm">DSSV</a>
                <a href="teacher.htm">DSGV</a>
                <a href="index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-teacher-content">
            <div class="div-teacher-left">
                <div class="div-department">
                    <p>An toàn thông tin</p>
                </div>
                <hr style="border: 1px #3f8eae solid; margin-top: 0">
                <ul class="ul-teacher">
                    <li>
                        <div class="div-teacher-li">
                            <a href="javascript:void(0)" class="teacher-edit" onclick="openEditTeacher();">Sửa</a>
                            <!-- <img src="img/user1.png"> -->
            				<img src="<c:url value="/resources/img/user1.png"/>">
                            <div class="div-teacher-info">
                                <ul class="ul-teacher-info">
                                    <li>
                                        <div class="div-patern-info">Họ và tên:</div>
                                        <div class="div-data">Trương Tam Phong</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Mã GV</div>
                                        <div class="div-data">GV123</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">SĐT</div>
                                        <div class="div-data">0987654321</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Địa chỉ</div>
                                        <div class="div-data">97 Man Thiện, phường Hiệp Phú, TP Thủ Đức, TP HCM</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    
                   
            <div class="div-teacher-right">
                <p class="p-teacher-title">CHUYÊN NGÀNH</p>
                <a href="javascript:void(0)">An toàn thông tin</a>
                <hr>
                <a href="javascript:void(0)">Công nghệ đa phương tiện</a>
                <hr>
                <a href="javascript:void(0)">Công nghệ thông tin</a>
                <hr>
                <a href="javascript:void(0)" onclick="openAddTeacher();" style="text-decoration: underline; text-align: center; margin: 0; margin-top: 50px">Thêm giảng viên</a>
            </div>
        </div>
    </body>
</html>
<!-- <script src="script.js"></script> -->
<script src="<c:url value="/resources/script.js"/>"></script>