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
            <p>Thêm sinh viên</p>
            <form action="student/add-student.htm" method="POST">
                <label>Nam&nbsp&nbsp<input type="radio" value="1" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <label>Nữ&nbsp&nbsp<input type="radio" value="0" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <select name="chuyenNganh">
                    <option>An toàn thông tin</option>
                    <option>Công nghệ đa phương tiện</option>
                    <option>Công nghệ thông tin</option>
                </select>
                <input name="maSV" type="text" placeholder="Mã Sinh Viên" path="maSV" pattern="^n\d{2}dc[a-z]{2}\d{3}" title="Format MSSV chưa đúng" size="10" required><br>
                <input name="khoa" type="number" placeholder="Khóa" path="khoa" min="1900" max="2900" required><br>
                <input name="ho" type="text" placeholder="Họ" path="ho" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
                <input name="ten" type="text" placeholder="Tên" path="ten" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br>
                <input name="lop" type="text" placeholder="Lớp" path="lop" pattern="^d\d{2}cq[a-z]{2}\d{2}-n$" title="Format lớp chưa đúng" size="11" required><br>
                <text>Ngày sinh</text>
                <input name="ngaySinh" type="date" placeholder="Ngày sinh" style="width: 64%;" path="ngaySinh">
                <input name="diaChi" type="text" placeholder="Địa chỉ" path="diaChi"  size="200"><br>
                <input name="diemTBTL" step=0.01 type="number" placeholder="Điểm trung bình tích lũy" min="0" max="4" path="diemTBTL" required><br>
                <button type="submit">Thêm</button>
            </form>
            <div class="div-login-bottom" style="height: 50px">
                <a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang web trên facebook</a>
            </div>
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
            <div class="div-login-bottom" style="height: 50px">
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
        <div class="div-student-content">
        	<p style="color: green; font-weight: bold; font-size: 15px">${message}</p>
          <div class="div-search">
               <input id="myInput" type="text" placeholder="Search..">
              <button>Tìm kiếm</button>
              <a href="javascript:void(0)" style="margin-left: 60px;" onclick="openAddStudent();">Thêm sinh viên</a>
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
		                    <th>Action</th>
		                    <th>Action</th>
	            </tr>
	            <tbody id="myTable">
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
	                    <td><a target="__blank" href="student/student/${sinhVien.getMaSV()}.htm" ${code == sinhVien.getMaSV() || role == 1 ?'':'hidden'}>Click</a></td>
	                   <!--  maSV, ho, ten, lop, phai, diaChi, khoa, diemTBTL -->
	                    <td><a href="javascript:void()" onclick="openEditStudent('${sinhVien.getMaSV()}','${sinhVien.getHo()}','${sinhVien.getTen()}','${sinhVien.getLop()}', '${sinhVien.getNgaySinh()}', '${sinhVien.isPhai()}','${sinhVien.getDiaChi()}','${sinhVien.getKhoa()}','${sinhVien.getDiemTBTL()}');" name="${sinhVien.getMaSV()}" ${code == sinhVien.getMaSV() || role == 1 ?'':'hidden'}>Sửa</a></td>
	                    <th><a role="button" href="student/student/${sinhVien.maSV}.htm?ldel" ${role == 1 ?'':'hidden'}>Xóa</a></th>
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