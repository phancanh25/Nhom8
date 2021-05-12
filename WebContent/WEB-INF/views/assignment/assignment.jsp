<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
            <form action="./login.htm" method="POST">
                <input type="text" name="username" placeholder="Tên đăng nhập"><br>
                <input type="password" name="password" placeholder="Mật khẩu"><br>
                <button type="submit">Đăng nhập</button>
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
                <a href="assignment.htm">Phân công đồ án</a>
                <a href="student.html">DSSV</a>
                <a href="teacher.html">DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
       <div class="div-assignment">
       	<code>Nếu năm hiện tại đã có tiểu ban thì sẽ hiển thị Kỳ bảo vệ, nếu chưa thì sẽ xuất hiện câu hỏi tạo mới</code>
       	<br>
       		<c:choose>
       			<c:when test="${flag=='none'}">
       				<a href="subcommittee.htm" style="margin-left: 100px">Năm ${year} chưa có kỳ bảo vệ đồ án tốt nghiệp, bạn có muốn tạo kỳ bảo vệ mới?</a>
       			</c:when>
       			<c:otherwise>
       				<ul class="ul-assignment">
			            <li>
			                <a href="javascript:void(0)" id="current-exam" onclick="expandAssignmentRoadmap();">&#10095; Kỳ bảo vệ năm 2021 <code>(Mỗi mục nhỏ trong này sau khi bấm ok sẽ chuyển hướng về lại trang này)</code></a>
			                <div class="div-assignment-roadmap">
			                    <a href="addStudent/showStudent.htm">1. Chọn SV làm đồ án</a>
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
			           </ul>
       			</c:otherwise>
       		</c:choose>
       			
       		
       		
           
       </div>
        
    </body>
</html>