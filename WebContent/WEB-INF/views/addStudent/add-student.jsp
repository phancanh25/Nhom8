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
        <link rel="stylesheet" type="text/css" href="resources/add-stu-project.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Chọn sinh viên làm đồ án tốt nghiệp</title>

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
                <a href="${role == 1 || role == 2?'event.htm':'error.htm'}">DS kỳ bảo vệ</a>
                <a href="${role == 1 || role == 2?'assignment.htm':'error.htm'}">Phân công đồ án</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'student/student.htm':'error.htm'}">DSSV</a>
                <a href="${role == 1 || role == 2?'teacher/teacher.htm':'error.htm'}" >DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-add-stu-project">
            <p style="color: #6692e3; font-weight: bold; margin-left: 50px">Chọn sinh viên <code>(Table này dùng sql xuất những sinh viên đủ điều kiện làm đồ án)</code></p>
            <p style="color: #0058C4; font-weight: bold; margin-left: 50px">${message}</p>
            <div class="div-add-stu-project-wrapper">
           		<form action="addStudent/add-stu-to-event.htm" method="POST">
                <table class="table table-striped table-bordered table-add-stu-project" style="font-size: 13px;"> 
                    <tr>
                        <th>MSSV</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Lớp</th>
                        <th>Phái</th>
                        <th>Ngày sinh</th>
                        <th>Khóa</th>
                        <th>Điểm TBTL</th>
                        <th>Chọn</th>
                    </tr>
                    <c:forEach items="${sinhViens}" var="sinhVien">
                    	<tr style="text-align: center; font-weight: normal; font-size: 13px">
	            			<td>${sinhVien.getMaSV()}</td>
		                    <td>${sinhVien.getHo()}</td>
		                    <td>${sinhVien.getTen()}</td>
		                    <td>${sinhVien.getLop()}</td>
		                    <td>${sinhVien.isPhai()?'Nam':'Nữ'}</td>
		                    <td>${sinhVien.getNgaySinh()}</td>
		                    <td>${sinhVien.getKhoa()}</td>
		                    <td>${sinhVien.getDiemTBTL()}</td>
		                    <td><input value="${sinhVien.getMaSV()}" type="checkbox" class="student-check" onchange="check();" ${sinhVien.getDoAn() != null?'checked ':''}></td>
	                        <input class="student-list" value="${sinhVien.getMaSV()}" name="student-list" type="text" hidden/>
	                        <input class="student-choose" value="${sinhVien.getDoAn() == null?'':'choose'}" name="student-choose" type="text" hidden/>
            			</tr>
                    </c:forEach>
                </table>
                
            </div>
            <button type="submit" class="finish-btn btn btn-success" id="btn-success" style="position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        	</form>
        </div>
        
    </body>
</html>