<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<script src="resources/script.js"></script>
<script src="resources/script.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/assignment.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Phân công đồ án & chấm điểm</title>

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
                <a href="javascript:void(0)" onclick="openLogin();" ${username!=""?'hidden':''}>Login</a>
                <a href="Home/logout.htm" ${username==""?'hidden':''} style="margin: 0px;  border: none; background: none;">Logout</a>
                <a href="javascript:void(0)" ${username==""?'hidden':''}>Hi ${username}</a>
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
       <div class="div-assignment">
       		<a href="subcommittee.html">Tạo kỳ bảo vệ mới</a>
           <ul class="ul-assignment">
            <li>
                <a href="javascript:void(0)" id="current-exam" onclick="expandAssignmentRoadmap();">&#10095; Kỳ bảo vệ năm 2021 <code>(Mỗi mục nhỏ trong này sau khi bấm ok sẽ chuyển hướng về lại trang này)</code></a>
                <div class="div-assignment-roadmap">
                    <a href="add-stu-project.html">1. Chọn SV làm đồ án</a>
                    <a href="add-project.html">2. GVHD ra đồ án</a>
                    <a href="mark1.html">3. GVHD chấm điểm</a>
                    <a href="add-gvpb.html">4. Phân công GVPB</a>
                    <a href="mark2.html">5. GVPB chấm điểm</a>
                    
                    <a href="prj-to-scmt.html">6. Phân công đồ án vào tiểu ban</a>
                    <a href="mark3.html">7. Tiểu ban chấm điểm</a>
                    <!-- <a href="subcommittee.html">9.Phân công đồ án vào tiểu ban</a>
                    <a href="subcommittee.html">10.Phân công đồ án vào tiểu ban</a> -->
                </div>
            </li>
            <li>
                <a href="javascript:void(0)">&#10095; Kỳ bảo vệ năm 2020</a>
            </li>
            <li>
                <a href="javascript:void(0)">&#10095; Kỳ bảo vệ năm 2019</a>
            </li>
            <li>
                <a href="javascript:void(0)">&#10095; Kỳ bảo vệ năm 2018</a>
            </li>
           </ul>
       </div>
        
    </body>
</html>