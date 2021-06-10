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
        <link rel="stylesheet" type="text/css" href="resources/prj-to-scmt.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Đưa đồ án vào tiểu ban</title>

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
                <a href="javascript:void(0)" onclick="openLogin();" style="visibility: ${user==null?'visible':'hidden'}">Đăng nhập</a>
                <a href="Home/logout.htm" style="margin: 0 -100px 0 10px; border: none; background: none; width: 120px; visibility: ${user!=null?'visible':'hidden'}">Đăng xuất</a>
                <a href="javascript:void(0)" style="margin-right: 10px; visibility: ${user!=null?'visible':'hidden'}">Xin chào ${user}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${role==1?'':'hidden'}>Quản lý tài khoản</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="${role == 1?'./statistic/piechart.htm':'error.htm'}">Thống kê</a>
                <a href="${role == 1?'event.htm':'error.htm'}">DS kỳ bảo vệ</a>
                <a href="${role == 1 || role == 2?'assignment.htm':'error.htm'}">Phân công đồ án</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'student/student.htm':'error.htm'}">DSSV</a>
                <a href="${role == 1 || role == 2?'teacher/teacher.htm':'error.htm'}" >DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-prj-to-scmt">
            <p style="color: #6692e3; font-weight: bold; margin-left: 50px">Phân công đồ án vào tiểu ban <code>(Table lọc những sinh viên đủ điểm)</code></p>
            <p style="color: #0058C4; font-weight: bold; margin-left: 50px">${message}</p>
            <div class="div-prj-to-scmt-wrapper">
           		 <form action="PTCMT/add-cmt.htm" method="POST">
                <table class="table table-striped table-bordered table-prj-to-scmt" style="font-size: 13px;">
                    <tr>
                        <th>MSSV</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Lớp</th>
                        <th>Phái</th>
                        <th>Ngày sinh</th>
                        <th>Khóa</th>
                        <th>Điểm TBTL</th>
                        <th>GVHD</th>
                        <th>Tên đồ án</th>
                        <th>Chi tiết</th>
                        <th>Điểm hướng dẫn</th>
                        <th>GVPB</th>
                        <th>Điểm phản biện</th>
                        <th>Tiểu ban</th>
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
		                    <td>${sinhVien.getDiemTBTL()}</td>
	                        <td>
	                            <input type="text" value="${sinhVien.getDoAn().getGVHD().getHo()} ${sinhVien.getDoAn().getGVHD().getTen()}" readonly style="opacity: 0.8;"><!-- giaovien.ho.ten -->
	                        </td>
	                        <td><input value="${sinhVien.getDoAn().getTenDA()}" name="tenDA" type="text" placeholder="Tên đồ án" readonly style="opacity: 0.8;"></td>
	                        <td><textarea name="chiTietDA" cols="20" rows="3" placeholder="Chi tiết" readonly style="opacity: 0.8;">${sinhVien.getDoAn().getChiTiet()}</textarea></td>
	                        <td><input name="diemHD" step="0.01" type="number" placeholder="Điểm hd" readonly style="opacity: 0.8;" value="${sinhVien.getDoAn().getDiemHD() }"></td>

                        	<input name="maDA" type="text" value="${sinhVien.getDoAn().getMaDA()}" hidden>
                        	 <td>
	                            <input type="text" value="${sinhVien.getDoAn().getGVPB().getHo()} ${sinhVien.getDoAn().getGVPB().getTen()}" readonly style="opacity: 0.8;"><!-- giaovien.ho.ten -->
	                        </td>
	                        <td><input name="diemPB" step="0.01" type="number" placeholder="Điểm pb" readonly style="opacity: 0.8;" value="${sinhVien.getDoAn().getDiemPB() }"></td>
	                        <td>
                            <select style="color: blue" name="tieuban-list">
                            	<option value="0">Chưa có tiểu ban</option>
                            	<c:forEach items="${tieuBans}" var="tieuBan">
	                                <option value="${tieuBan.getMaTB()}">${tieuBan.getTenTB()}</option>
	                            </c:forEach>
                            </select>
                        
                    </tr>
					</c:forEach>
                </table>
            </div>
            <button class="finish-btn btn btn-success" id="btn-success" style="position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        </div>
        
    </body>
</html>