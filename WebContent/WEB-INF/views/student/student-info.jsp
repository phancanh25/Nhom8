<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <a href="javascript:void(0)" onclick="openLogin();" style="visibility: ${username==null?'visible':'hidden'}">Login</a>
                <a href="Home/logout.htm" style="margin: 0px;  border: none; background: none; visibility: ${username!=null?'visible':'hidden'}">Logout</a>
                <a href="javascript:void(0)" style="visibility: ${username!=null?'visible':'hidden'}">Hi ${username}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${username=='admin'?'':'hidden'}>Quản lý tài khoản</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="./statistic/piechart.htm">Thống kê</a>
                <a href="event.htm">DS kỳ bảo vệ</a>
                <a href="assignment.htm">Phân công đồ án</a>
                <a href="student/student.htm">DSSV</a>
                <a href="Home/teacher.htm">DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-student-info">
        	<c:choose>
        		<c:when test="${flag=='have'}">
	        		<div class="div-project-info">
	            		<tr style="text-align: center; font-weight: normal; font-size: 13px">
	            			<p>Thông tin đồ án</p>
			                <p class="project-title p-first">Tên đồ án: ${doAn.getTenDA()}</p>
			                <p class="project-user p-second">Sinh viên thực hiện: ${doAn.getSinhVien().getHo()}  ${doAn.getSinhVien().getTen()}</p>
			               <%--  <p class="project-teacher p-third">Giảng viên hướng dẫn: ${doAn.getGVHD().getTenGV()}</p> --%>
			                <p class="p-fourth">Điểm hướng dẫn: ${doAn.getDiemHD()}</p>
			                <p class="p-fifth">Điểm phản biện: ${doAn.getDiemPB()}</p>
			                <p class="p-sixth">Điểm tiểu ban: ${doAn.getDiemTB()}</p>
			                <p class="p-seventh">Xếp loại tốt nghiệp: Giỏi</p>
		                   <%--  <td><a target="__blank" href="student/student/${sinhVien.getMaSV()}.htm">Click</a></td> --%>
		                 
	            		</tr>
		                
		            </div>
        		</c:when>
        		<c:otherwise>
        			<div class="div-project-info" style="margin-top: 20px;">
		                <p>Sinh viên này chưa có đồ án</p>
		                <img src="resources/img/no-project.png" style="width: 220px; height: 200px; margin-top: 100px;">
		            </div>
        		</c:otherwise>
        	</c:choose>
            
            
        </div>
    </body>
</html>