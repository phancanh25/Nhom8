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
<title>Sinh viên</title>

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
        <div class="div-add-student" id="div-add-student" style="height: 650px; margin-top: 50px">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeAddStudent();" style="color: white; margin-top: -10px;">&times</a>
            <p>Thêm tiểu ban</p>
            <form action="tieuban/add-tieuban.htm" method="POST">
            	<input name="maTB" type="number" placeholder="Mã tiểu ban"><br>
                <input name="tenTB" type="text" placeholder="Tên Tiểu ban"><br>
                <select name="chuyenNganh">
                    <option>An toàn thông tin</option>
                    <option>Công nghệ đa phương tiện</option>
                    <option>Công nghệ thông tin</option>
                </select><br>
                <text>Ngày tổ chức</text>
                <input name="ngay" type="date" placeholder="Ngày tổ chức" style="width: 64%;"><br>
                <text>Thời gian tổ chức</text>
                <input id="appt-time" step="2" name="gio" type = "time" placeholder="Giờ tổ chức" style="width: 64%;">
                <input name="diaDiem" type="text" placeholder="Địa điểm tổ chức"><br>
                <input name="khoa"  type="number" placeholder="Khóa"><br>
                <button type="submit">Thêm</button>
            </form>
            <div class="div-login-bottom" style="height: 50px">
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
                <a href="Home/event-info.htm">DS kỳ bảo vệ</a>
                <a href="Home/assignment.htm">Phân công đồ án</a>
                <a href="student/student.htm">DSSV</a>
                <a href="Home/teacher.htm">DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-student-content">
        	<p style="color: green; font-weight: bold; font-size: 15px">${message}</p>
          <div class="div-search">
              <input type="text" placeholder="Tên sinh viên">
              <input type="text" placeholder="Lớp">
              <input type="text" placeholder="Khóa">
              <button>Tìm kiếm</button>
              <a href="javascript:void(0)" style="margin-left: 60px;" onclick="openAddStudent();">Thêm tiểu ban.</a>
          </div>
            <table border="1" class="table table-striped table-bordered" style="font-size: 16px;">
	            <tr style="text-align: center; color: #0096ff">
	            			<th>Mã TB</th>
		                    <th>Tên TB</th>
		                    <th>Chuyên Ngành</th>
		                    <th>Ngày tổ chức</th>
		                    <th>Giờ</th>
		                    <th>Địa điểm</th>
		                    <th>Khóa</th>
		                    
	            </tr>
            	<c:forEach items="${tieuBans}" var="tieuBan">
            		<tr style="text-align: center; font-weight: normal; font-size: 13px">
            			<th>${tieuBan.getMaTB()}</th>
	                    <th>${tieuBan.getTenTB()}</th>
	                    <th>${tieuBan.getChuyenNganh()}</th>
	                    <th>${tieuBan.getNgay()}</th>
	                    <th>${tieuBan.getGio()}</th>
	                    <th>${tieuBan.getDiaDiem()}</th>
	                    <th>${tieuBan.getKhoa()}</th>
	                    <td><a href="#">Click</a></td>
	                    
            		</tr>
            	</c:forEach>
              
            </table>
        </div>
    </body>
</html>