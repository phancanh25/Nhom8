<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<script src="resources/script.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/student-css.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Thông tin kỳ bảo vệ đồ án tốt nghiệp</title>

</head>
<body>

        <div class="div-teacher-in-event" id="div-teacher-in-event">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeTeacherInEvent();" style="color: white; margin-top: -10px;">&times</a>
            <p>Danh sách giảng viên</p>
            <div class="wrapper-table-student-in-event">
                <table class="table-student-in-event table table-bordered table-striped">
                    <tr>
                        <th>Mã giáo viên</th>
						<th>Họ</th>
						<th>Tên</th>
						<th>Phái</th>
						<th>Địa chỉ</th>
                    </tr>
                    
                   <c:forEach var="t" items="${giangVien}">
						<tr>
							<td>${t.maGV}</td>
							<td>${t.ho}</td>
							<td>${t.ten}</td>
						 	<td>${t.isPhai()?'Nam':'Nữ'}</td>
							<td>${t.diaChi}</td>
							<td><a href="insert.htm">Insert</a></td>
						</tr>
					</c:forEach>>
                </table>
            </div>
        </div>
        <div class="div-student-in-event" id="div-student-in-event">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeStudentInEvent();" style="color: white; margin-top: -10px;">&times</a>
            <p>Danh sách sinh viên tham gia</p>
            <div class="wrapper-table-student-in-event">
                <table class="table-student-in-event table table-bordered table-striped">
                   <tr>
                       <th>MSSV</th>
                       <th>Họ</th>
                       <th>Tên</th>
                       <th>Lớp</th>
                       <th>Tên đồ án</th>
                       <th>GVHD</th>
                       <th>Điểm hướng dẫn</th>
                       <th>Điểm phản biện</th>
                       <th>Điểm tiểu ban</th>
                       <th>Điểm tổng</th>
                  </tr>
                  <c:forEach items="${sinhViens}" var="sinhVien">
	                  <tr style="text-align: center; font-weight: normal; font-size: 13px">
	                    <th>${sinhVien.getMaSV()}</th>
	                    <th>${sinhVien.getHo()}</th>
	                    <th>${sinhVien.getTen()}</th>
	                    <th>${sinhVien.getLop()}</th>
	                    <td>Ứng dụng giám sát người dùng facebook</td>
	                    <td>Obama</td>
	                    <td><input type="text" value="9" disabled></td>
	                    <td><input type="text" value="9.6" disabled></td>
	                    <td><input type="text" value="9" disabled></td>
	                    <td><input type="text" value="9.3" disabled></td>
	               	   </tr>
               		</c:forEach>
                </table>
            </div>
        </div>
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
        <c:forEach items="${tieuBans}" var="tieuBan">
        	<div class="div-event-info">
           		<br>
	            <div class="div-department" style="margin-top: 10px">
		                <p>${tieuBan.getTenTB()}</p>
		                <span>${tieuBan.getDiaDiem()}</span>
		                <span>Thời gian: ${tieuBan.getGio()} ${tieuBan.getNgay()}</span>
		            </div>
		            <table class="table-deparment">
		                <tr>
		                    <td><a id="btn-xacnhan1" target="__blank" href="cmt-teacher/${tieuBan.getMaTB()}.htm">Xem DSGV</a></td>
		                    <td><a id="btn-xacnhan2" target="__blank" href="cmt-student/${tieuBan.getMaTB()}.htm">Xem DSSV</a></td>
		                </tr>
		            </table>
	        </div>
	        <br>
        </c:forEach>
        
    </body>
</html>