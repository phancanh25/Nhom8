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
                
                <a href="javascript:void(0)" onclick="openLogin();" style="visibility: ${user==null?'visible':'hidden'}">Login</a>
                <a href="Home/logout.htm" style="margin: 0px;  border: none; background: none; visibility: ${user!=null?'visible':'hidden'}">Logout</a>
                <a href="javascript:void(0)" style="margin-right: 10px; visibility: ${user!=null?'visible':'hidden'}">Hi ${user}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${user=='admin'?'':'hidden'}>Quản lý tài khoản</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
               	<a href="${role == 1?'./statistic/piechart.htm':'error.htm'}">Thống kê</a>
                <a href="${role == 1 || role == 2?'event.htm':'error.htm'}">DS kỳ bảo vệ</a>
                <a href="${role == 1 || role == 2?'assignment.htm':'error.htm'}">Phân công đồ án</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'student/student.htm':'error.htm'}">DSSV</a>
                <a href="${role == 1 || role == 2?'teacher/teacher.htm':'error.htm'}" >DSGV</a>
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
			                <a href="javascript:void(0)" id="current-exam" onclick="expandAssignmentRoadmap();">&#10095; Kỳ bảo vệ năm 2021 </a>
			                <div class="div-assignment-roadmap">
			                	<form action="subcommittee.htm" method="POST">
			                		<button class="btn btn-primary" ${role==1?'':'hidden'}>Bổ sung tiểu ban</button>
			                	</form>
			                	<form action="set-lock.htm" method="POST">
				                	<table class="table  table-striped table-bordered" style="height: 200px; background: #F1F6F9;">
				                    	<tr>
				                    		<th>Giai đoạn</th>
				                    		<th style="width: 100px">Trạng thái</th>
				                    	</tr>
				                    	<!-- value cua input bang 0: mo khoa, bang 1 la khoa -->
				                    	<tr style="padding: 0" ${role==1?'':'hidden'}>
				                    		<td><a href="addStudent/showStudent.htm" style="pointer-events: ${lock=='1'?'default':'none'};">Chọn SV làm đồ án</a></td>
				                    		<input type="number" value="1" name="action" id="input-action" hidden>
				                    		<td><button class="btn btn-lock ${lock=='1'?'btn-success':'btn-danger'}" style="font-size: 13px;" onClick="setLock(this, 1);" type="button" value="${lock=='1'?'0':'1'}" ${role==1?'':'disabled'}>${lock=='1'?'Mở 🔓':'Khóa 🔒'}</button></td>
				                    	</tr>
				                    	<tr>
				                    		<td><a href="addProject/showProject.htm" style="pointer-events: ${lock=='2'?'default':'none'};">GVHD ra đồ án</a></td>
				                    		<td><button class="btn btn-lock ${lock=='2'?'btn-success':'btn-danger'}" style="font-size: 13px;" onClick="setLock(this, 2);" type="button" value="${lock=='2'?'0':'1'}" ${role==1?'':'disabled'}>${lock=='2'?'Mở 🔓':'Khóa 🔒'}</button></td>
				                    	</tr>
				                    	<tr>
				                    		<td><a href="GVHD/index.htm" style="pointer-events: ${lock=='3'?'default':'none'};">GVHD chấm điểm</a></td>
				                    		<td><button class="btn btn-lock ${lock=='3'?'btn-success':'btn-danger'}" style="font-size: 13px;" onClick="setLock(this, 3);" type="button" value="${lock=='3'?'0':'1'}" ${role==1?'':'disabled'}>${lock=='3'?'Mở 🔓':'Khóa 🔒'}</button></td>
				                    	</tr>
				                    	<tr>
				                    		<td><a href="ChoseGVPB/index.htm" style="pointer-events: ${lock=='4'?'default':'none'};">Phân công GVPB</a></td>
				                    		<td><button class="btn btn-lock ${lock=='4'?'btn-success':'btn-danger'}" style="font-size: 13px;" onClick="setLock(this, 4);" type="button" value="${lock=='4'?'0':'1'}" ${role==1?'':'disabled'}>${lock=='4'?'Mở 🔓':'Khóa 🔒'}</button></td>
				                    	</tr>
				                    	<tr>
				                    		<td><a href="GVPB/index.htm" style="pointer-events: ${lock=='5'?'default':'none'};">GVPB chấm điểm</a></td>
				                    		<td><button class="btn btn-lock ${lock=='5'?'btn-success':'btn-danger'}" style="font-size: 13px;" onClick="setLock(this, 5);" type="button" value="${lock=='5'?'0':'1'}" ${role==1?'':'disabled'}>${lock=='5'?'Mở 🔓':'Khóa 🔒'}</button></td>
				                    	</tr>
				                    	<tr>
				                    		<td><a href="PTCMT/show-cmt.htm" style="pointer-events: ${lock=='6'?'default':'none'};">Phân công đồ án vào tiểu ban</a></td>
				                    		<td><button class="btn btn-lock ${lock=='6'?'btn-success':'btn-danger'}" style="font-size: 13px;" onClick="setLock(this, 6);" type="button" value="${lock=='6'?'0':'1'}" ${role==1?'':'disabled'}>${lock=='6'?'Mở 🔓':'Khóa 🔒'}</button></td>
				                    	</tr>
				                    	<tr>
				                    		<td><a href="CMT/index.htm" style="pointer-events: ${lock=='7'?'default':'none'};">Tiểu ban chấm điểm</a></td>
				                    		<td><button class="btn btn-lock ${lock=='7'?'btn-success':'btn-danger'}" style="font-size: 13px;" onClick="setLock(this, 7);" type="button" value="${lock=='7'?'0':'1'}" ${role==1?'':'disabled'}>${lock=='7'?'Mở 🔓':'Khóa 🔒'}</button></td>
				                    	</tr>
				                    </table>
			                    	<button type="submit" id="btn-confirm" class="btn btn-primary btn-confirm" disabled ${role==1?'':'hidden'}>Xác nhận</button>
			                    </form>
			                </div>
			            </li>
			           </ul>
       			</c:otherwise>
       		</c:choose>
       </div>
        
    </body>
</html>