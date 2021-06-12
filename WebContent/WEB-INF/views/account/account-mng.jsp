<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/account-mng.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="resources/script.js"></script>
<title>Quản lý tài khoản</title>
</head>
<body>
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
			                <input type="password"  pattern="^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$" title="Mật khẩu bạn nhập vào chưa đủ mạnh" name="newpass1" placeholder="Mật khẩu mới"><br>
			                <input type="password" name="newpass2" placeholder="Nhập lại mật khẩu mới"><br>
			                <p class="error" ${error!=null?'':'hidden'}>Tài khoản hoặc mật khẩu không chính xác</p>
			                <button class="btn-primary" type="submit">Đổi mật khẩu</button>
			            </form>
			</div>
		</div>
		<div class="div-account-add ${error!=''?'fadeInDown2':''}" id="div-account-add" style="display: ${error!=''?'block':'hidden'}">
        	<a href="javascript:void()" onclick="closeAccountAdd();" class="a-quit">
        		&times
        	</a>
        	<form action="account-add.htm" method="POST">
	        	<p class="p-title-add">Thêm tài khoản</p>
	        	<select name="type" style="width: 60%; margin: 0 auto 10px; text-align: center;">
	        		<option value="gv" ${type=='gv'?'selected':''}>Giảng viên</option>
	        		<option value="sv" ${type=='sv'?'selected':''}>Sinh viên</option>
	        	</select>
	        	<input name="username" type="text" placeholder="Tên tài khoản">
	        	<input name="password" type="password" placeholder="Mật khẩu">
	        	<input name="email" type="text" placeholder="Email">
	        	<input name="ma" type="text" placeholder="MSSV/MSGV">
	        	<p class="p-error-add" ${type==''?'hidden':''}>${error}</p>
	        	<button type="submit">Tạo tài khoản</button>
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
               	<a href="${role == 1?'./statistic/piechart.htm':'error.htm'}">Thống kê</a>
                <a href="${role == 1 || role == 2?'event.htm':'error.htm'}">DS kỳ bảo vệ</a>
                <a href="${role == 1 || role == 2?'assignment.htm':'error.htm'}">Phân công đồ án</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'student/student.htm':'error.htm'}">DSSV</a>
                <a href="${role == 1 || role == 2?'teacher/teacher.htm':'error.htm'}" >DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-account-content">
        	  <p style="color: green; font-weight: bold; font-size: 15px">${message}</p>
        	  <form action="account-seacrh.htm" method="POST">
		          <div class="div-search">
		              <input id="myInput" type="text" placeholder="Search.." style="border:solid 1px;">
		              <a href="javascript:void(0)" style="margin-left: 60px;" onclick="openAccountAdd();">Thêm tài khoản</a>
		          </div>
	          </form>
            <table ${type=='gv'?'':'hidden'} border="1" class="table table-striped table-bordered" style="font-size: 16px; border: 2px  #0095FF solid">
	            <tr style="text-align: center; color: #0096ff">
	            			<th>Tài khoản</th>
	            			<th>Mã giảng viên</th>
	            			<th>Họ và tên</th>
	            			<th>Quyền</th>
	            			<th>Email</th>
	            			<th></th>
	            </tr>
	            <tbody id="myTable">
	            <c:forEach items="${accountGVs}" var="accountGV">
	            
	            	<form action="account-delete.htm" method="POST">
	            		<input name="type" type="text" value="gv" hidden>
	            		<input name="username" type="text" value="${accountGV.getUsername()}" hidden>
		            	<tr style="text-align: center; font-weight: normal; font-size: 13px">
		            		<th>${accountGV.getUsername()}</th>
		            		<th>${accountGV.getGiangVien().getMaGV()}</th>
		            		<th>${accountGV.getGiangVien().getHo()} ${accountGV.getGiangVien().getTen()}</th>
		            		<th>${accountGV.getRole().getMaRole() == 1?'Người quản trị':'Giảng viên'}</th>
		            		<th>${accountGV.getEmail()} </th>
		            		<th>
		            			<button class="btn btn-primary" type="submit" ${accountGV.getUsername()=='admin'?'hidden':''}>Xóa</button>
		            		</th>
		            	</tr>
	            	</form>
	            </c:forEach>
	            </tbody>
            </table>	
            <table ${type=='sv'?'':'hidden'} border="1" class="table table-striped table-bordered" style="font-size: 16px; border: 2px  #0095FF solid">
	            <tr style="text-align: center; color: #0096ff">
	            			<th>Tài khoản</th>
	            			<th>Mã sinh viên</th>
	            			<th>Họ và tên</th>
	            			<th>Quyền</th>
	            			<th>Xóa</th>
	            </tr>
	            <c:forEach items="${accountSVs}" var="accountSV">
	            	<form action="account-delete.htm" method="POST">
	            		<input name="type" type="text" value="sv" hidden>
	            		<input name="username" type="text" value="${accountSV.getUsername()}" hidden>
		            	<tr style="text-align: center; font-weight: normal; font-size: 13px">
		            		<th>${accountSV.getUsername()}</th>
		            		<th>${accountSV.getSinhVien().getMaSV()}</th>
		            		<th>${accountSV.getSinhVien().getHo()} ${accountSV.getSinhVien().getTen()}</th>
		            		<th>Sinh viên</th>
		            		<th>
		            			<button class="btn btn-primary" type="submit">Xóa</button>
		            		</th>
		            	</tr>
	            	</form>
	            </c:forEach>
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