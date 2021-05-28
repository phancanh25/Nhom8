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
        <div class="div-add-student ${check==false?'fadeInDown':''}" id="div-add-student" style="height: 650px; margin-top: 50px; visibility: ${check==false?'visible':'hidden' }">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeAddStudent();" style="color: white; margin-top: -10px;">&times</a>
            <p>Thêm sinh viên</p>
            <form action="student/add-student.htm" method="POST" >
                <label>Nam&nbsp&nbsp<input type="radio" value="0" name="phai" path="phai" style="width: 15px; height: 15px; color: black;" checked></label> &nbsp&nbsp&nbsp
                <label>Nữ&nbsp&nbsp<input type="radio" value="1" name="phai" path="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <select name="chuyenNganh" path="chuyenNganh">
                    <option>An toàn thông tin</option>
                    <option>Công nghệ đa phương tiện</option>
                    <option>Công nghệ thông tin</option>
                </select>
                <input name="maSV" type="text" placeholder="Mã Sinh Viên" path="maSV" pattern="^n\d{2}dc[a-z]{2}\d{3}" title="Format MSSV chưa đúng" size="10" required><br>
                <%-- <span style="color: red">${LoiDinhDangMSSV}</span> --%>
                <input name="khoa" type="number" placeholder="Khóa" path="khoa" min="1900" max="2900" required><br>
                <%-- <span style="color: red">${LoiDinhDangKhoa}</span> --%>
                <input name="ho" type="text" placeholder="Họ" path="ho" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
                <%-- <span style="color: red">${LoiDinhDangHo}</span> --%>
                <input name="ten" type="text" placeholder="Tên" path="ten" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br>
                <%-- <span style="color: red">${LoiDinhDangTen}</span> --%>
                <input name="lop" type="text" placeholder="Lớp" path="lop" pattern="^d\d{2}cq[a-z]{2}\d{2}-n$" title="Format lớp chưa đúng" size="11" required><br>
                <span style="color: red">${LoiDinhDangLop}</span>
                <text>Ngày sinh</text>
                <input name="ngaySinh" type="date" placeholder="Ngày sinh" style="width: 64%;" path="ngaySinh">
                <input name="diaChi" type="text" placeholder="Địa chỉ" path="diaChi"  size="50"><br>
                <span style="color: red">${LoiDinhDangDiaChi}</span>
                <input name="diemTBTL" step=0.01 type="number" placeholder="Điểm trung bình tích lũy" min="0" max="4" path="diemTBTL" required><br>
                <span style="color: red">${LoiDinhDangDiem}</span>
                <button type="submit">Thêm</button>
            </form>
            <div class="div-login-bottom" style="height: 50px">
                <a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang web trên facebook</a>
            </div>
        </div>
        <div class="div-edit-student ${check==false?'fadeInDown':''}" id="div-edit-student" style="height: 650px; margin-top: 50px; visibility: ${check==false?'visible':'hidden' }">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeEditStudent();" style="color: white; margin-top: -10px;">&times</a>
          <!--  SỬA SINH VIÊN ------------------------------- -->
            <p>Sửa sinh viên</p>
            <form action="student/edit-student.htm" method="POST">
                <label>Nam&nbsp&nbsp<input type="radio" value="1" name="phai" style="width: 15px; height: 15px; color: black;"checked></label> &nbsp&nbsp&nbsp
                <label>Nữ&nbsp&nbsp<input type="radio" value="0" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <select name="chuyenNganh">
                    <option>An toàn thông tin</option>
                    <option>Công nghệ đa phương tiện</option>
                    <option>Công nghệ thông tin</option>
                </select>
                <input id="input-edit-maSV" name="maSV" type="text" placeholder="Mã Sinh Viên" readonly="readonly"><br>
                <input id="input-edit-khoa" name="khoa" type="number" placeholder="Khóa"  min="1900" max="2900" required><br>
                <%-- <span style="color: red">${LoiDinhDangKhoa}</span> --%>
                <input id="input-edit-ho" name="ho" type="text" placeholder="Họ" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-30 ký tự !!!" maxlength="30" size="30" minlength="2" required><br>
                <%-- <span style="color: red">${LoiDinhDangHo}</span> --%>
                <input id="input-edit-ten" name="ten" type="text" placeholder="Tên" pattern="[^1-9]{2,30}" title="Không nhập số và nhập từ 2-50 ký tự !!!" maxlength="50" size="50" minlength="2" required><br>
                <%-- <span style="color: red">${LoiDinhDangTen}</span> --%>
                <input id="input-edit-lop" name="lop" type="text" placeholder="Lớp" pattern="^d\d{2}cq[a-z]{2}\d{2}-n$" title="Format lớp chưa đúng" size="11" required><br>
                <%-- <span style="color: red">${LoiDinhDangLop}</span> --%>
                <text>Ngày sinh</text>
                <input name="ngaySinh" type="date" placeholder="Ngày sinh" style="width: 64%;">
                <input id="input-edit-diaChi" name="diaChi" type="text" placeholder="Địa chỉ" size="50"><br>
                <%-- <span style="color: red">${LoiDinhDangDiaChi}</span> --%>
                <input id="input-edit-diemTBTL" name="diemTBTL" step=0.01 type="number" placeholder="Điểm trung bình tích lũy"  min="0" max="4" path="diemTBTL" required><br>
                <%-- <span style="color: red">${LoiDinhDangDiem}</span> --%>
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
                <a href="javascript:void(0)" onclick="openLogin();" style="visibility: ${username==null?'visible':'hidden'}">Login</a>
                <a href="Home/logout.htm" style="margin: 0px;  border: none; background: none; visibility: ${username!=null?'visible':'hidden'}">Logout</a>
                <a href="javascript:void(0)" style="visibility: ${username!=null?'visible':'hidden'}">Hi ${username}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${username=='admin'?'':'hidden'}>Quản lý tài khoản</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="./statistic/piechart.htm">Thống kê</a>
                <a href="event.htm">DS kỳ bảo vệ</a>
                <a href="assignment.htm">Phân công đồ án</a>
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
	                    <td><a target="__blank" href="student/student/${sinhVien.getMaSV()}.htm">Click</a></td>
	                    <td><a href="javascript:void()" onclick="openEditStudent('${sinhVien.getMaSV()}','${sinhVien.getHo()}','${sinhVien.getTen()}','${sinhVien.getLop()}',${sinhVien.isPhai()},'${sinhVien.getDiaChi()}','${sinhVien.getKhoa()}',${sinhVien.getDiemTBTL()});" name="${sinhVien.getMaSV()}">Sửa</a></td>
	                    <th><a role="button" href="student/student/${sinhVien.maSV}.htm?ldel">Xóa</a></th>
            		</tr>
            	</c:forEach>
            </table>
        </div>
    </body>
</html>