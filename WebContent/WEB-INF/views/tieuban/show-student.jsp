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
<title>DSSV-Tiểu ban</title>

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
        <div class="div-student-content">
        	<p style="color: green; font-weight: bold; font-size: 15px">${message}</p>
          <div class="div-search">
              <input type="text" placeholder="Tên sinh viên">
              <input type="text" placeholder="Lớp">
              <input type="text" placeholder="Khóa">
              <button>Tìm kiếm</button>
          </div>
            <table border="1" class="table table-striped table-bordered" style="font-size: 16px;">
	            <tr style="text-align: center; color: #0096ff">
	            			<th>MSSV</th>
		                    <th>Họ</th>
		                    <th>Tên</th>
		                    <th>Lớp</th>
		                    <th>Phái</th>
		                    <th>Ngày sinh</th>
		                    <th>Địa chỉ</th>
		                    <th>Khóa</th>
		                    <th>Điểm TBTL</th>
		                    <th>Đồ án</th>
		                    
	            </tr>
            	<c:forEach items="${sinhViens}" var="sinhVien">
            		<tr style="text-align: center; font-weight: normal; font-size: 13px">
            			<th>${sinhVien.getMaSV()}</th>
	                    <th>${sinhVien.getHo()}</th>
	                    <th>${sinhVien.getTen()}</th>
	                    <th>${sinhVien.getLop()}</th>
	                    <th>${sinhVien.isPhai()?'Nam':'Nữ'}</th>
	                    <th>${sinhVien.getNgaySinh()}</th>
	                    <th>${sinhVien.getDiaChi()}</th>
	                    <th>${sinhVien.getKhoa()}</th>
	                    <th>${sinhVien.getDiemTBTL()}</th>
	                    <td><a href="student-info.html">Click</a></td>
            		</tr>
            	</c:forEach>
            </table>
        </div>
    </body>
</html>