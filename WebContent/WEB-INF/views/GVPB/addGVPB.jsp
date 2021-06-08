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
        <link rel="stylesheet" type="text/css" href="resources/add-gvpb.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Chọn giảng viên phản biện</title>

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
        <div class="div-add-gvpb">
            <p style="color: #6692e3; font-weight: bold; margin-left: 50px">Phân công giảng viên phản biện <code>(Table dùng sql chỉ lọc ra những sinh viên đủ điểm hướng dẫn)</code></p>
            <div class="div-add-gvpb-wrapper">
            	<form action="ChoseGVPB/add-gvpb.htm" method="POST">
                <table class="table table-striped table-bordered table-add-gvpb">
                    <tr>
                        <th>MSSV</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Lớp</th>
                        <th>Phái</th>
                        <th>Ngày sinh</th>
                        <th>Khóa</th>
                        <th>Tốt nghiệp</th>
                        <th>GVHD</th>
                        <th>Tên đồ án</th>
                        <th>Chi tiết</th>
                        <th>Điểm hướng dẫn</th>
                        <th>GVPB</th>
                    </tr>
                        <c:forEach items="${sinhViens}" var="sinhVien">
	                    <tr>
	                        <td>${sinhVien.getMaSV()}</td>
		                    <td>${sinhVien.getHo()}</td>
		                    <td>${sinhVien.getTen()}</td>
		                    <td>${sinhVien.getLop()}</td>
		                    <td>${sinhVien.isPhai()?'Nam':'Nữ'}</td>
		                    <td>${sinhVien.getNgaySinh()}</td>
		                    <td>${sinhVien.getKhoa()}</td>
		                    <td>Chưa tốt nghiệp</td>
	                        <td>
	                            <input type="text" value="${sinhVien.getDoAn().getGVHD().getHo()} ${sinhVien.getDoAn().getGVHD().getTen()}" disabled><!-- giaovien.ho.ten -->
	                        </td>
	                        <td><input value="${sinhVien.getDoAn().getTenDA()}" name="tenDA" type="text" placeholder="Tên đồ án" readonly></td>
	                        <td><textarea name="chiTietDA" cols="20" rows="3" placeholder="Chi tiết" readonly>${sinhVien.getDoAn().getChiTiet()}</textarea></td>
	                        <td><input name="diemHD" step="0.01" type="number" placeholder="Điểm hd" readonly value="${sinhVien.getDoAn().getDiemHD() }"></td>
	                        
	                        <td>
	                            <select name="gvpb-list" class="select-teacher">
	                            	 <c:forEach items="${giangViens}" var="giangVien">
		                                <option value="${giangVien.getMaGV()}">${giangVien.getHo()} ${giangVien.getTen()}</option>
		                            </c:forEach>
	                            </select>
                        	</td>
                        	<input name="maDA" type="text" value="${sinhVien.getDoAn().getMaDA()}" hidden>
	                    </tr>
						</c:forEach>
                </table>
            </div>
            <button type="submit" class="finish-btn btn btn-success" id="btn-success" style="position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        </div>
        
    </body>
</html>