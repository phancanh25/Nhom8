<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<link rel="shortcut icon" href="resources/img/logo-lite.png" />
<script src="resources/script.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Giảng viên</title>
</head>
<body>
	<div class="div-delete-teacher-confirm" id="div-delete-teacher-confirm">
		<form id="form-delete-teacher-confirm" action="" method="POST">
			<p style="text-align: center; color:teal; font-weight: bold;">Bạn có chắc chắn xóa giảng viên này?</p>
			<button type="submit" style="position: absolute; left:80px;" class="btn btn-success" >Đồng ý</button>
			<button type="button" style="position: absolute; right:80px;" class="btn btn-danger" onclick="closeDeleteTeacherConfirm();">Hủy</button>
		</form>
	</div>
	<div id="div-profile" class="div-profile ${changePassFlag != null || changeProfileFlag != null?'fadeInDown ':''}" style="visibility: ${changePassFlag != null || changeProfileFlag != null?'visible':'hidden'}">
			<a href="javascript:void(0)" class="a-login-quit" onclick="closeProfile();" style="margin-top: -12px;">&times</a>
			<div class="div-profile-info">
				<h5 style="color: #2F79FF; margin-top: 20px;">Thông tin tài khoản</h5>
				<div class="div-info-permanent">
					<img src="resources/img/user1.png" style="width: 120px; height: 120px; float: left; border: 1px #2F79FF solid; padding: 5px;">
					<div>
						<p>${role==3?'Sinh viên':''} ${role==2?'Giảng viên':''} ${role==1?'Quản trị':''}</p>
						<hr style="background: gray;">
						<p>${code}</p>
						<hr style="background: gray;">
						<p>${giangVienPro.getHo()} ${giangVienPro.getTen()} ${sinhVienPro.getHo()} ${sinhVienPro.getTen()}</p>
					</div>
				</div>	
				<div class="div-info-change">
					<form action="Home/edit-profile.htm" method="POST">
						<input type="number" value="${role}" name="edit-role" hidden/>
						<input type="text" value="${code}" name="edit-code" hidden>
						<hr>
						<p>Giới tính:
							<select name="edit-gender" value="${giangVienPro.isPhai()}${sinhVienPro.isPhai()}">
								<option value="${0}" ${giangVienPro.isPhai() == false || sinhVienPro.isPhai() == false?'selected':''}>Nam</option>
								<option value="${1}" ${giangVienPro.isPhai() == true || sinhVienPro.isPhai() == true?'selected':''}>Nữ</option>
							</select>
						<p id="p-phone" ${giangVienPro == null?'hidden':''} style="border-bottom: 1px gray solid">SĐT: ${giangVienPro.getSDT()} <a href="javascript:void()" onClick="editPhone('${giangVienPro.getSDT()}')">Sửa</a></p>
						<input value="${giangVienPro.getSDT()}" name="edit-phone" style="width: 100%; margin-bottom:10px; margin-top: 0px; " type="text" spellcheck="false" id="input-phone" spellcheck="false" hidden>
						<p id="p-address" style="border-bottom: 1px gray solid">Địa chỉ: ${giangVienPro.getDiaChi()}${sinhVienPro.getDiaChi()}<a href="javascript:void()" onClick="editAddress('${giangVienPro.getDiaChi()}${sinhVienPro.getDiaChi()}')">Sửa</a></p>
						<input value="${giangVienPro.getDiaChi()}${sinhVienPro.getDiaChi()}"name="edit-address" style="width: 100%; margin-top: 10px;" type="text" spellcheck="false" id="input-address" spellcheck="false" hidden>
					</div>
					<span ${changeProfileFlag == null?'hidden':''}" style="color: blue;">${changeProfileFlag}</span>
					<button class="btn-primary" type="submit" style="width: 200px; height: 40px; margin: 10px auto;">Sửa thông tin</button>
					</form>
			</div>
			<div class="div-change-pass">
				<img src="resources/img/change-pass.png" style="width:200px; height: 90px; margin:0 auto">
				<h5 style="color: #2F79FF; text-align: center">Thay đổi mật khẩu</h5>
				<span ${changePassMsg ==null?'hidden':''} style="color: ${changePassFlag=='wrong'?'red':'#00A213'}">${changePassMsg}</span>
			            <form action="change-pass.htm" method="POST">
			                <input type="password" name="oldpass" placeholder="Mật khẩu hiện tại"><br>
			                <input type="password"  pattern="^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,30}$" title="Mật khẩu phải có ít nhất 8 ký tự, tối khiểu 1 ký tự thường, 1 ký tự hoa, 1 ký tự số và 1 ký tự đặc biệt (!,@,#,$,&,*)" name="newpass1" placeholder="Mật khẩu mới"><br>
			                <input type="password" name="newpass2" placeholder="Nhập lại mật khẩu mới"><br>
			                <p class="error" ${error!=null?'':'hidden'}>Tài khoản hoặc mật khẩu không chính xác</p>
			                <button class="btn-primary" type="submit">Đổi mật khẩu</button>
			            </form>
			</div>
		</div>
	<div class="div-login ${error!=null || forgotFlag =='have' || forgotFlag =='done'?'fadeInDown':''}" style="visibility: ${error!=null || forgotFlag =='have' || forgotFlag =='done'?'visible':'hidden'}" id="div-login">
            <div id="div-login-form" class="${forgotFlag =='have' || forgotFlag =='done'?'leftIn':''}" style="width: 100%; height: 100%">
	            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
	            <img src="resources/img/logo-lite.png">
	            <form action="Home/login.htm" method="POST">
	                <input type="text" spellcheck="false" name="username" placeholder="Tên đăng nhập" required="required"><br>
	                <input type="password" name="password" placeholder="Mật khẩu" required="required"><br>
	                <p class="error" ${error!=null?'':'hidden'}>Tài khoản hoặc mật khẩu không chính xác</p>
	                <button type="submit">Đăng nhập</button>
	            </form>
	            <div class="div-login-bottom">
	                <a href="javascript:void(0)" onClick="openForgotPass();">Quên mật khẩu</a>
	            </div>
            </div>
            <div id="div-forgot-form" class="${forgotFlag =='have' || forgotFlag =='done'?'leftIn':''}" style="width: 100%; height: 100%">
            	<a href="javascript:void(0)" class="a-login-back" onclick="closeForgotPass();">&#8592</a>
	            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
	            <img src="resources/img/forgot-pass.jpg" style="width:150px; height: 130px;">
	            <p class="error" ${forgotFlag=='have'?'':'hidden'}>${forgotError}</p>
	            <p class="text-success" ${forgotFlag=='done'?'':'hidden'}>Vui lòng kiểm tra gmail để nhận mật khẩu</p>
	            <form action="forgotpass.htm" method="POST">
		            <input name="ma" id="Ma" type="text" spellcheck="false" placeholder="Nhập MSSV/MSGV"  pattern="^n\d{2}dc[a-z]{2}\d{3} |PTITGV\d{2}" title="Format nhập vào chưa đúng!!!" size="10" required>
		            <input type="email" name="email" id="email" placeholder="Nhập Email" pattern="\w+@\w+(\.\w+)+" title="Format email chưa đúng!!!" required>
	                <button type="submit">Lấy lại mật khẩu</button>
	            </form>
            </div>
        </div>
	<div class="div-add-teacher ${check==false?'fadeInDown':''}" id="div-add-teacher"
		style="height: 60%; margin-top: 50px; visibility: ${check==false?'visible':'hidden' }">
		<a href="javascript:void(0)" class="a-login-quit"
			onclick="closeAddTeacher();" style="color: white; margin-top: -10px;">&times</a>
		<p>Thêm giảng viên</p>
		<form action="teacher/add-teacher.htm" method="POST">
			<input name="ho" type="text" placeholder="Họ"  pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
			<input name="ten" type="text" placeholder="Tên" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br> 
			<label>Nam&nbsp&nbsp<input checked="checked" type="radio" value="0" name="phai" style="width: 15px; height: 15px; color: black;"></label>&nbsp&nbsp&nbsp
			<label>Nữ&nbsp&nbsp<input type="radio" value="1" name="phai" style="width: 15px; height: 15px; color: black;"></label>&nbsp&nbsp&nbsp 
			<input name="sDT" type="text" placeholder="Số điện thoại" size="10" pattern="^0\d{9}" title="Format SDT chưa đúng !!!" required="required"><br>
			<input name="diaChi" type="text" placeholder="Địa chỉ" size="200" required="required"><br>
			<button type="submit">Thêm</button>
		</form>
	</div>
	
	
	<div class="div-edit-teacher ${check==false?'fadeInDown':''}" id="div-edit-teacher"
		style="height: 590px; margin-top: 50px; visibility: ${check==false?'visible':'hidden' }">
		<a href="javascript:void(0)" class="a-login-quit"
			onclick="closeEditTeacher();"
			style="color: white; margin-top: -10px;">&times</a>
		<p>Chỉnh sửa thông tin giảng viên</p>
				<form action="teacher/edit-teacher.htm" method="POST">
               	<br><input id="input-edit-maGV" name="maGV" type="text" placeholder="Mã Giảng Viên" readonly="readonly"><br>              
                <input id="input-edit-ho" name="ho" type="text" placeholder="Họ" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
                <input id="input-edit-ten" name="ten" type="text" placeholder="Tên" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br>
                <label>Nam&nbsp&nbsp<input id="input-edit-male" type="radio" value="0" name="phai" style="width: 15px; height: 15px; color: black;" required="required"></label> &nbsp&nbsp&nbsp
                <label>Nữ&nbsp&nbsp<input id="input-edit-female" type="radio" value="1" name="phai" style="width: 15px; height: 15px; color: black;" required="required"></label> &nbsp&nbsp&nbsp
           		<input id="input-edit-sDT" name="sDT" type="text" placeholder="Số Điện Thoại" size="10" pattern="^0\d{9}" title="Format SDT chưa đúng !!!" required="required"><br>
           	    <input id="input-edit-diaChi" name="diaChi" type="text" placeholder="Địa chỉ" size="200" required="required"><br>
                <button type="submit">Sửa</button>
            </form>
	</div>
	<div class="div-top">
            <div class="div-top-wrapper">
            	<a href="javascript:void(0)">&#9743 0987-654-321</a>
                <a href="javascript:void(0)">&#9993 ptithcm@edu.vn</a>
                <a href="javascript:void(0)" onclick="openLogin();" style="visibility: ${user==null?'visible':'hidden'}">Đăng nhập</a>
                <a href="Home/logout.htm" style="margin: 0 -100px 0 10px; border: none; background: none; width: 120px; visibility: ${user!=null?'visible':'hidden'}">Đăng xuất</a>
                <a href="javascript:void(0)" onClick="openProfile();" style="margin-right: 10px; visibility: ${user!=null?'visible':'hidden'}">Xin chào ${user}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${role==1?'':'hidden'}>Quản lý tài khoản</a>
            </div>
        </div>
	<div class="div-menu">
		<div class="div-top-wrapper">
				<a href="">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
               	<a href="${role == 1 || role==2?'./statistic/piechart.htm':'error.htm'}">Thống kê</a>
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
				<a ${role==1?'':'hidden'} href="javascript:void(0)" onclick="openAddTeacher();"
				style="text-decoration: underline; color: white; text-align: center; position: absolute; top: 8px; right: 20px">Thêm giảng viên</a>
				<label>
          			Tìm kiếm &nbsp;
          		<input id="myInput" type="text" placeholder="Search..">
          		</label>
				<p>Danh sách giảng viên</p>
			</div>
			<hr style="border: 1px #3f8eae solid; margin-top: 0">
			<ul class="ul-teacher">
				<p style="color: green; font-weight: bold; font-size: 15px">${message}</p>
				<table id="table-teacher" style="width: 100%;">
					<tbody id="myTable">
					<c:forEach var="t" items="${giangViens}">
						<tr>
							<td>
								<li style="width: 100%">
									<div class="div-teacher-li">
											
				                            <a ${role==1?'':'hidden'} href="javascript:void()" onclick="openEditTeacher('${t.getMaGV()}','${t.getHo()}','${t.getTen()}',${t.isPhai()},'${t.getSDT()}','${t.getDiaChi()}');" name="${t.getMaGV()}">Sửa</a>
				                            <a ${role==1?'':'hidden'} href="javascript:void()" onClick="openDeleteTeacherConfirm('${t.getMaGV()}');">Xóa</a>
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
				                                        <div class="div-data">${t.isPhai()?'Nữ':'Nam'}</div>
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
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
		</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
	</script>
</html>