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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Giảng viên</title>
</head>
<body>
	<div class="div-login" id="div-login">
		<a href="javascript:void(0)" class="a-login-quit"
			onclick="closeLogin();">&times</a> <img
			src="resources/img/logo-lite.png">
		<form>
			<input type="text" placeholder="Tên đăng nhập"><br> <input
				type="password" placeholder="Mật khẩu"><br>
			<button>Đăng nhập</button>
		</form>
		<div class="div-login-bottom">
			<a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang
				web trên facebook</a>
		</div>
	</div>
	<div class="div-add-teacher ${check==false?'fadeInDown':''}" id="div-add-teacher"
		style="height: 100%; margin-top: 50px; visibility: ${check==false?'visible':'hidden' }">
		<a href="javascript:void(0)" class="a-login-quit"
			onclick="closeAddTeacher();" style="color: white; margin-top: -10px;">&times</a>
		<p>Thêm giảng viên</p>
		<form action="teacher/add-teacher.htm" method="POST">
			<input name="maGV" type="text" placeholder="Mã Giảng Viên" pattern="PTITGV\d{2}" title="Format MGV chưa đúng" size="8" required><br>
			<input name="ho" type="text" placeholder="Họ"  pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
			<input name="ten" type="text" placeholder="Tên" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br> 
			<label>Nam&nbsp&nbsp<input type="radio" value="1" name="phai" style="width: 15px; height: 15px; color: black;"></label>&nbsp&nbsp&nbsp
			<label>Nữ&nbsp&nbsp<input checked="checked" type="radio" value="0" name="phai" style="width: 15px; height: 15px; color: black;"></label>&nbsp&nbsp&nbsp 
			<input name="sDT" type="text" placeholder="Số điện thoại" size="10" pattern="^0\d{9}" title="Format SDT chưa đúng !!!"><br>
			<input name="diaChi" type="text" placeholder="Địa chỉ" size="200"><br>
			<button type="submit">Thêm</button>
		</form>
		<div class="div-login-bottom">
			<a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang
				web trên facebook</a>
		</div>
	</div>
	<div class="div-edit-teacher ${check==false?'fadeInDown':''}" id="div-edit-teacher"
		style="height: 650px; margin-top: 50px; visibility: ${check==false?'visible':'hidden' }">
		<a href="javascript:void(0)" class="a-login-quit"
			onclick="closeEditTeacher();"
			style="color: white; margin-top: -10px;">&times</a>
		<p>Chỉnh sửa thông tin giảng viên</p>
				<form action="teacher/edit-teacher.htm" method="POST">
               	<br><input id="input-edit-maGV" name="maGV" type="text" placeholder="Mã Giảng Viên" readonly="readonly"><br>              
                <input id="input-edit-ho" name="ho" type="text" placeholder="Họ" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
                <input id="input-edit-ten" name="ten" type="text" placeholder="Tên" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br>
                <label>Nam&nbsp&nbsp<input type="radio" value="1" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <label>Nữ&nbsp&nbsp<input type="radio" value="0" name="phai" style="width: 15px; height: 15px; color: black;"checked></label> &nbsp&nbsp&nbsp
           		<input id="input-edit-sDT" name="sDT" type="text" placeholder="Số Điện Thoại" size="10" pattern="^0\d{9}" title="Format SDT chưa đúng !!!"><br>
           	    <input id="input-edit-diaChi" name="diaChi" type="text" placeholder="Địa chỉ" size="200"><br>
                <button type="submit">Sửa</button>
            </form>
		<div class="div-login-bottom">
			<a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang
				web trên facebook</a>
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
	<div class="div-teacher-content">

		<div class="div-teacher-left">
			<div class="div-department">
				<p>Danh sách giảng viên</p>
			</div>
			<hr style="border: 1px #3f8eae solid; margin-top: 0">
			<ul class="ul-teacher">
				${message}
				<c:forEach var="t" items="${giangViens}">
					<li>
						<div class="div-teacher-li">
	                            <a href="javascript:void()" onclick="openEditTeacher('${t.getMaGV()}','${t.getHo()}','${t.getTen()}',${t.isPhai()},'${t.getSDT()}','${t.getDiaChi()}');" name="${t.getMaGV()}">Sửa</a>
	                            <a role="button" onclick="yesNo();" href="teacher/teacher/${t.maGV}.htm?ldel">Xóa</a>
	                            <img src="resources/img/user1.png">
	                            <div class="div-teacher-info">
	                                <ul class="ul-teacher-info">
	                                    <li>
	                                        <div class="div-patern-info">Họ và tên:</div>
	                                        <div class="div-data">${t.getHo()} ${t.getTen()}</div>
	                                    </li>
	                                    <li>
	                                        <div class="div-patern-info">Mã GV</div>
	                                        <div class="div-data">${t.getMaGV()}</div>
	                                    </li>
	                                    <li>
	                                        <div class="div-patern-info">Giới tính</div>
	                                        <div class="div-data">${t.isPhai()?'Nam':'Nữ'}</div>
	                                    </li>
	                                    <li>
	                                        <div class="div-patern-info">SĐT</div>
	                                        <div class="div-data">${t.getSDT()}</div>
	                                    </li>
	                                    <li>
	                                        <div class="div-patern-info">Địa chỉ</div>
	                                        <div class="div-data">${t.getDiaChi()}</div>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
					</li>
				</c:forEach>
					<%-- <div style="height: 100%; margin-bottom: 15px;"
						class="div-teacher-li">
						<table class="table table-hower">
							<tr>
								<th>Mã giáo viên</th>
								<th>Họ</th>
								<th>Tên</th>
								<th>Phái</th>
								<th>Số điện thoại</th>
								<th>Địa chỉ</th>
								<th></th>
							</tr>
							<c:forEach var="t" items="${giangViens}">
								<tr>
									<td>${t.getMaGV()}</td>
									<td>${t.getHo()}</td>
									<td>${t.getTen()}</td>
									<td>${t.isPhai()?'Nam':'Nữ'}</td>
									<td>${t.getSDT()}</td>
									<td>${t.getDiaChi()}</td>
									<td><a href="javascript:void()" onclick="openEditTeacher('${t.getMaGV()}','${t.getHo()}','${t.getTen()}',${t.isPhai()},'${t.getSDT()}','${t.getDiaChi()}');" name="${t.getMaGV()}">Sửa</a></td>
									<th><a role="button" onclick="yesNo();" href="teacher/teacher/${t.maGV}.htm?ldel">Xóa</a></th>
								</tr>
							</c:forEach>
						</table>
					</div> --%>
		</div>

		<div class="div-teacher-right">
			<p class="p-teacher-title">CHUYÊN NGÀNH</p>
			<a href="javascript:void(0)">An toàn thông tin</a>
			<hr>
			<a href="javascript:void(0)">Công nghệ đa phương tiện</a>
			<hr>
			<a href="javascript:void(0)">Công nghệ thông tin</a>
			<hr>
			<a href="javascript:void(0)" onclick="openAddTeacher();"
				style="text-decoration: underline; text-align: center; margin: 0; margin-top: 50px">Thêm
				giảng viên</a>
		</div>
</body>
</html>