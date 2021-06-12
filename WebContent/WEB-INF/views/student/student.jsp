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
<title>Sinh viên</title>

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
        <div class="div-login" id="div-login">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
            <img src="resources/img/logo-lite.png">
            <form>
                <input type="text" placeholder="Tên đăng nhập"><br>
                <input type="password" placeholder="Mật khẩu"><br>
                <button>Đăng nhập</button>
            </form>
        </div>
        <div class="div-add-student" id="div-add-student" style="height: 650px; margin-top: 50px">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeAddStudent();" style="color: white; margin-top: -10px;">&times</a>
            <p>Thêm sinh viên</p>
            <form action="student/add-student.htm" method="POST">
                <input name="maSV" type="text" placeholder="Mã Sinh Viên" path="maSV" pattern="^N\d{2}DC[A-Z]{2}\d{3}" title="Format MSSV chưa đúng" size="10" required><br>
                <input name="khoa" type="number" placeholder="Khóa" path="khoa" min="1900" max="2900" required><br>
                <input name="ho" type="text" placeholder="Họ" path="ho" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
                <input name="ten" type="text" placeholder="Tên" path="ten" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br>
                <label>Nam&nbsp&nbsp<input type="radio" value="1" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <label>Nữ&nbsp&nbsp<input type="radio" value="0" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <input name="lop" type="text" placeholder="Lớp" path="lop" pattern="^D\d{2}CQ[A-Z]{2}\d{2}-N$" title="Format lớp chưa đúng" size="11" required><br>
                <text>Ngày sinh</text>
                <input name="ngaySinh" type="date" placeholder="Ngày sinh" style="width: 64%;" path="ngaySinh">
                <input name="diaChi" type="text" placeholder="Địa chỉ" path="diaChi"  size="200"><br>
                <input name="diemTBTL" step=0.01 type="number" placeholder="Điểm trung bình tích lũy" min="0" max="4" path="diemTBTL" required><br>
                <button type="submit" style="width: 200px; height: 40px; margin-top: 5px;">Thêm</button>
            </form>
        </div>
        
        
        <div class="div-edit-student" id="div-edit-student" style="height: 650px; margin-top: 50px">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeEditStudent();" style="color: white; margin-top: -10px;">&times</a>
          <!--  SỬA SINH VIÊN ------------------------------- -->
            <p>Sửa sinh viên</p>
            <form action="student/edit-student.htm" method="POST">
            	<input id="input-edit-maSV" type="text" name="maSV" hidden/>
                <label>Nam&nbsp&nbsp<input id="input-edit-female" type="radio" value="1" name="phai" style="width: 15px; height: 15px; color: black;"checked></label> &nbsp&nbsp&nbsp
                <label>Nữ&nbsp&nbsp<input id="input-edit-male" type="radio" value="0" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <select name="chuyenNganh">
                    <option>An toàn thông tin</option>
                    <option>Công nghệ đa phương tiện</option>
                    <option>Công nghệ thông tin</option>
                </select>
                <input id="input-edit-khoa" name="khoa" type="number" min="1900" max="2900" required ${role==1?'':'readonly style="background: #DEE0E1"'} required><br>
                <input id="input-edit-ho" name="ho" type="text" placeholder="Họ" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
                <input id="input-edit-ten" name="ten" type="text" placeholder="Tên" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br>
                <input id="input-edit-lop" name="lop" type="text" placeholder="Lớp" pattern="^d\d{2}cq[a-z]{2}\d{2}-n$" title="Format lớp chưa đúng" size="11" required ${role==1?'':'readonly style="background: #DEE0E1"'}><br>
                <text>Ngày sinh</text>
                <input id="input-edit-ngaySinh" name="ngaySinh" type="date" placeholder="Ngày sinh" style="width: 64%;">
                <input id="input-edit-diaChi" name="diaChi" type="text" placeholder="Địa chỉ" size="200"><br>
                <input id="input-edit-diemTBTL" value="2.5" name="diemTBTL" step=0.01 type="number" placeholder="Điểm trung bình tích lũy" min="0" max="4" path="diemTBTL" required ${role==1?'':'readonly style="background: #DEE0E1"'}><br>
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
                <a href="${role == 1?'./statistic/piechart.htm':'error.htm'}">Thống kê</a>
                <a href="${role == 1 || role == 2?'event.htm':'error.htm'}">DS kỳ bảo vệ</a>
                <a href="${role == 1 || role == 2?'assignment.htm':'error.htm'}">Phân công đồ án</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'student/student.htm':'error.htm'}">DSSV</a>
                <a href="${role == 1 || role == 2?'teacher/teacher.htm':'error.htm'}" >DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-student-content">
        	<p style="color: green; font-weight: bold; font-size: 15px">${message}</p>
          <div class="div-search">
               <input id="myInput" type="text" placeholder="Search..">
              <button class="btn-primary" onclick="openAddStudent();" style="margin-left: 40px; width: 150px; height: 30px;">Thêm sinh viên</button>
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
		                    <th> ${role==3?'hidden':''}Đồ án</th>
		                    <th ${role==1?'':'hidden'}>Action</th>
		                    <th ${role==1?'':'hidden'}>Action</th>
	            </tr>
	            <tbody id="myTable">
            	<c:forEach items="${sinhViens}" var="sinhVien">
            		<tr style="text-align: center; font-weight: normal; font-size: 13px">
            			<th>${sinhVien.getMaSV()}</th>
	                    <th>${sinhVien.getHo()}</th>
	                    <th>${sinhVien.getTen()}</th>
	                    <th>${sinhVien.getLop()}</th>
	                    <th>${sinhVien.isPhai()?'Nữ':'Nam'}</th>
	                    <th>${sinhVien.getNgaySinh()}</th>
	                    <th>${sinhVien.getDiaChi()}</th>
	                    <th>${sinhVien.getKhoa()}</th>
	                    <th>${sinhVien.getDiemTBTL()}</th>
	                    <td ${role == 3 ?'hidden':''}><a target="__blank" href="student/student/${sinhVien.getMaSV()}.htm" >Click</a></td>
	                    <td ${role == 1 ?'':'hidden'}><a href="javascript:void()" onclick="openEditStudent('${sinhVien.getMaSV()}','${sinhVien.getHo()}','${sinhVien.getTen()}','${sinhVien.getLop()}', '${sinhVien.getNgaySinh()}', '${sinhVien.isPhai()}','${sinhVien.getDiaChi()}','${sinhVien.getKhoa()}','${sinhVien.getDiemTBTL()}');" name="${sinhVien.getMaSV()}">Sửa</a></td>
	                    <th ${role == 1 ?'':'hidden'}><a role="button" href="student/student/${sinhVien.maSV}.htm?ldel" >Xóa</a></th>
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