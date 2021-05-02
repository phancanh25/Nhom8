<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<script src="resources/script.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/student-css.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Thông tin sinh viên</title>

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
                <a href="index.html">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="event.html">DS kỳ bảo vệ</a>
                <a href="student.html">DSSV</a>
                <a href="teacher.html">DSGV</a>
                <a href="index.html">Trang chủ</a>
            </div>
        </div>
        <div class="div-student-info">
            <div class="div-project-info">
                <p>Thông tin đồ án</p>
                <p class="project-title p-first">Phần mềm nhận diện mệnh giá tiền giấy</p>
                <p class="project-user p-second">Sinh viên thực hiện: Lệnh Hồ Xung</p>
                <p class="project-teacher p-third">Giảng viên hướng dẫn: Trương Tam Phong</p>
                <p class="p-fourth">Điểm hướng dẫn: 10</p>
                <p class="p-fifth">Điểm phản biện: 9.5</p>
                <p class="p-sixth">Điểm tiểu ban: 9.5</p>
                <p class="p-seventh">Xếp loại tốt nghiệp: Giỏi</p>
            </div>
            <div class="div-project-info" style="margin-top: 20px;">
                <p>Sinh viên này chưa có đồ án</p>
                <img src="resources/img/no-project.png" style="width: 220px; height: 200px; margin-top: 100px;">
            </div>
        </div>
    </body>
</html>