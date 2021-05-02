<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<script src="resources/script.js"></script>
<meta charset="UTF-8"><link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/student-css.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Kỳ bảo vệ đồ án tốt nghiệp</title>

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
                <a href="assignment.html">Phân công đồ án</a>
                <a href="student.html">DSSV</a>
                <a href="teacher.html">DSGV</a>
                <a href="index.html">Trang chủ</a>
            </div>
        </div>
        <div class="div-event">
            <!-- <a href="event-add.html" style="margin-left: 103px; text-decoration: underline;">Tạo kỳ bảo vệ đồ án</a> -->
            <table style="width: 80%; margin: 20px auto" border="1">
                <tr>
                    <th style="background: #3f8eae; color: white;">Danh sách các kỳ bảo vệ đồ án</th>
                </tr>
                <tr>
                    <td><a href="event-info.html">Kỳ bảo vệ năm 2021</a></td>
                </tr>
                <tr>
                    <td><a href="event-info.html">Kỳ bảo vệ năm 2020</a></td>
                </tr>

                <tr>
                    <td><a href="event-info.html">Kỳ bảo vệ năm 2019</a></td>
                </tr>
                <tr>
                    <td><a href="event-info.html">Kỳ bảo vệ năm 2018</a></td>
                </tr>
            </table>
        </div>
</body>
</html>