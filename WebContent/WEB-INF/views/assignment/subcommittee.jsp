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
        <link rel="stylesheet" type="text/css" href="resources/subcommittee.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Quản lý tiểu ban</title>

</head>
<body>
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
						<input value="${giangVienPro.getSDT()}" name="edit-phone" style="width: 100%; margin-bottom: 10px; margin-top: 0px;"  type="text" spellcheck="false" id="input-phone" spellcheck="false" hidden>
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
		
		
		<div class="div-subcommittee-add", id="div-subcommittee-add">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this,'div-subcommittee-add');">&times</a>
            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Thêm tiểu ban</p>
            <form action="scmt-add.htm" method="POST">
            	<input type="checkbox" name="select" value="" checked hidden>
	            <input name="tenTB" type="text" placeholder="Tên tiểu ban" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
	            <input name="gio" type="time" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
	            <input name="ngay" type="date" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
	            <input name="diaDiem" type="text" placeholder="Địa điểm" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
	            <select name="chuyenNganh" class="form-control" style="width: 300px; margin-left: 50px; display: inline;">
	                <option value="ATTT">An toàn thông tin</option>
	                <option value="CNTT">Công nghệ thông tin</option>
	                <option value="CNDPT">Công nghệ đa phương tiện</option>
	            </select>
	            <div class="div-subcommittee-wrapper">
	                <table class="table table-striped table-bordered table-subcommittee">
	                    <tr>
	                        <th>Mã GV</th>
	                        <th>Họ</th>
	                        <th>Tên</th>
	                        <th>Sđt</th>
	                        <th>Địa chỉ</th>
	                        <th>Chọn</th>
	                    </tr>
	                    <c:forEach items="${giangViens}" var="giangVien">
	                    	<tr>
								<td>${giangVien.getMaGV()}</td>
								<td>${giangVien.getHo()}</td>
								<td>${giangVien.getTen()}</td>
								<td>${giangVien.getSDT()}</td>
								<td>${giangVien.getDiaChi()}</td>
		                        <td><input type="checkbox" name="select" value="${giangVien.getMaGV()}"></td>
		                    </tr>
	                    </c:forEach>
	                    
	                </table>
	            </div>
            	<button type="submit" class="finish-btn btn btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Thêm tiểu ban</button>
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
        
        
        <div class="div-subcommittee">
        	<form action="event-create.htm" method="POST">
        		<button class="btn-confirm btn btn-success" ${lock=='have'?'hidden':''}>Xác nhận tạo</button>
        	</form>
        	<form action="event-cancel.htm" method="POST">
        		<button class="btn-cancel btn btn-danger" ${lock=='have'?'hidden':''}> Hủy bỏ</button>	
        	</form>
        	<p style="color: #6692e3; font-weight: bold; margin-left: 50px">Kỳ bảo vệ đồ án tốt nghiệp năm ${year}</p>
            <p style="color: #6692e3; font-weight: bold; margin-left: 50px">Quản lý tiểu ban</p>
            <a href="javascript:void(0)" style="margin-left: 50px" onclick="showAddSubcommittee();">Thêm tiểu ban</a>
            <ul class="ul-subcommittee">
                <h6 style="color: blue; font-weight: bold; margin-top: 20px;">An toàn thông tin</h6>
                <c:forEach items="${tieuBanATTTs}" var="tieuBanATTT">
                	<li>
	                    <a href="javascript:void(0)" onclick="showSubcommittee('${tieuBanATTT.getMaTB()}');" id="name-subcommittee1">${tieuBanATTT.getTenTB()}</a>
	                    <a ${lock=='have'?'hidden':''} href="javascript:void(0)" onclick="showEditSubcommittee('${tieuBanATTT.getMaTB()}');" id="edit-subcommittee1">Sửa</a>
	                    <a ${lock=='have'?'hidden':''} href="javascript:void(0)" onclick="showDeleteSubcommittee('${tieuBanATTT.getMaTB()}');" id="delete-subcommittee1">Xóa</a>
                	</li>
                	<div class="div-subcommittee-show"  id="show${tieuBanATTT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="hideSubcommitte('show${tieuBanATTT.getMaTB()}');">&times</a>
			            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">${tieuBanATTT.getTenTB()}</p>
			            <span class="scmt-info">Thời gian: ${tieuBanATTT.getGio()} ${tieuBanATTT.getNgay()}</span>
			            <span class="scmt-info">Địa điểm: ${tieuBanATTT.getDiaDiem()}</span>
			            <div class="div-subcommittee-wrapper">
			                <table class="table table-striped table-bordered table-subcommittee">
			                    <tr>
			                        <th>Mã GV</th>
			                        <th>Họ</th>
			                        <th>Tên</th>
			                        <th>Sđt</th>
			                        <th>Địa chỉ</th>
			                    </tr>
			                    <c:forEach items="${tieuBanATTT.getGiangViens()}" var="giangVien">
			                    	<tr>
				                        <td>${giangVien.getMaGV()}</td>
				                        <td>${giangVien.getHo()}</td>
				                        <td>${giangVien.getTen()}</td>
				                        <td>${giangVien.getSDT()}</td>
				                        <td>${giangVien.getDiaChi()}</td>
			                    	</tr>
			                    </c:forEach>
			                    
			                </table>
            			</div>
           				 <button onclick="hideSubcommitte('show${tieuBanATTT.getMaTB()}');" class="finish-btn btn btn-success"  style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        			</div>
        			<div class="div-subcommittee-edit" id="edit${tieuBanATTT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="hideEditSubcommitte('${tieuBanATTT.getMaTB()}')">&times</a>
			            <form action="scmt-edit.htm" method="POST">
			            	<input type="checkbox" name="select" value="" checked hidden>
			            	<input name="maTB" type="number" value="${tieuBanATTT.getMaTB()}" hidden>
				            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Sửa ${tieuBanATTT.getTenTB()}</p>
							<input name="tenTB" value="${tieuBanATTT.getTenTB()}" type="text" placeholder="Tên tiểu ban" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
							<input name="gio" value="${tieuBanATTT.getGio()}" type="time" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				            <input name="ngay" value="${tieuBanATTT.getNgay()}" type="date" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				            <input name="diaDiem" value="${tieuBanATTT.getDiaDiem()}" type="text" placeholder="Địa điểm" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				        	<select name="chuyenNganh" class="form-control" style="width: 300px; margin-left: 50px; display: inline;">
				                <option value="ATTT" ${tieuBanATTT.getChuyenNganh() == 'ATTT'?'selected':''}>An toàn thông tin</option>
				                <option value="CNTT" ${tieuBanATTT.getChuyenNganh() == 'CNTT'?'selected':''}>Công nghệ thông tin</option>
				                <option value="CNDPT" ${tieuBanATTT.getChuyenNganh() == 'CNDPT'?'selected':''}>Công nghệ đa phương tiện</option>
				            </select>
				            <div class="div-subcommittee-wrapper">
				                <table class="table table-striped table-bordered table-subcommittee">
				                    <tr>
				                        <th>Mã GV</th>
				                        <th>Họ</th>
				                        <th>Tên</th>
				                        <th>Sđt</th>
				                        <th>Địa chỉ</th>
				                        <th>Chọn</th>
				                    </tr>
				                    <c:forEach items="${giangViens}" var="giangVien">
				                    	
					                    	<tr>
												<td>${giangVien.getMaGV()}</td>
												<td>${giangVien.getHo()}</td>
												<td>${giangVien.getTen()}</td>
												<td>${giangVien.getSDT()}</td>
												<td>${giangVien.getDiaChi()}</td>
												<c:set var="have" value="false" />
												<c:forEach items="${tieuBanATTT.getGiangViens()}" var="giangVien2">
													<c:if test="${giangVien.getMaGV() == giangVien2.getMaGV()}">
														<c:set var="have" value="true" />
													</c:if>
						                        </c:forEach>
						                        <td><input type="checkbox" name="select" value="${giangVien.getMaGV()}" ${have=='true'?'checked':''}></td>
						                    </tr>
					                 </c:forEach>
				                </table>
				            </div>
				            <button onclick="location.reload();" class="finish-btn btn btn-success"  style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Cập nhật</button>
			            </form>    
			        </div>
			        <div class="div-subcommittee-delete" id="delete${tieuBanATTT.getMaTB()}">
			        	<form action="scmt-delete.htm" method="POST">
				        	<input name="maTB" type="number" value="${tieuBanATTT.getMaTB()}" hidden>
				            <p style="text-align: center; color:teal; font-weight: bold;">Bạn có chắc chắn muốn xóa ${tieuBanATTT.getTenTB()}</p>
				            <button type="submit" style="position: absolute; left:80px;" class="btn btn-success" >Đồng ý</button>
				            <button type="button" style="position: absolute; right:80px;" class="btn btn-danger" onclick="hideDeleteCommittee('${tieuBanATTT.getMaTB()}');">Hủy</button>
			       		</form>
			        </div>
                </c:forEach>
                <h6 style="color: blue; font-weight: bold; margin-top: 20px;">Công nghệ thông tin</h6>
                <c:forEach items="${tieuBanCNTTs}" var="tieuBanCNTT">
                	<li>
	                    <a href="javascript:void(0)" onclick="showSubcommittee('${tieuBanCNTT.getMaTB()}');" id="name-subcommittee1">${tieuBanCNTT.getTenTB()}</a>
	                    <a ${lock=='have'?'hidden':''} href="javascript:void(0)" onclick="showEditSubcommittee('${tieuBanCNTT.getMaTB()}');" id="edit-subcommittee1">Sửa</a>
	                    <a ${lock=='have'?'hidden':''} href="javascript:void(0)" onclick="showDeleteSubcommittee('${tieuBanCNTT.getMaTB()}');" id="delete-subcommittee1">Xóa</a>
                	</li>
                	<div class="div-subcommittee-show"  id="show${tieuBanCNTT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="hideSubcommitte('show${tieuBanCNTT.getMaTB()}');">&times</a>
			            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">${tieuBanCNTT.getTenTB()}</p>
			            <span class="scmt-info">Thời gian: ${tieuBanCNTT.getGio()} ${tieuBanCNTT.getNgay()}</span>
				        <span class="scmt-info">Địa điểm: ${tieuBanCNTT.getDiaDiem()}</span>
			            <div class="div-subcommittee-wrapper">
			                <table class="table table-striped table-bordered table-subcommittee">
			                    <tr>
			                        <th>Mã GV</th>
			                        <th>Họ</th>
			                        <th>Tên</th>
			                        <th>Sđt</th>
			                        <th>Địa chỉ</th>
			                    </tr>
			                    <c:forEach items="${tieuBanCNTT.getGiangViens()}" var="giangVien">
			                    	<tr>
				                        <td>${giangVien.getMaGV()}</td>
				                        <td>${giangVien.getHo()}</td>
				                        <td>${giangVien.getTen()}</td>
				                        <td>${giangVien.getSDT()}</td>
				                        <td>${giangVien.getDiaChi()}</td>
			                    	</tr>
			                    </c:forEach>
			                    
			                </table>
            			</div>
           				 <button onclick="hideSubcommitte('show${tieuBanCNTT.getMaTB()}');" class="finish-btn btn btn-success"  style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        			</div>
        			<div class="div-subcommittee-edit" id="edit${tieuBanCNTT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="hideEditSubcommitte('${tieuBanCNTT.getMaTB()}');">&times</a>
			            <form action="scmt-edit.htm" method="POST">
			            	<input type="checkbox" name="select" value="" checked hidden>
			            	<input name="maTB" type="number" value="${tieuBanCNTT.getMaTB()}" hidden>
				            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Sửa ${tieuBanCNTT.getTenTB()}</p>
				            <input name="tenTB" value="${tieuBanCNTT.getTenTB()}" type="text" placeholder="Tên tiểu ban" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
							<input name="gio" value="${tieuBanCNTT.getGio()}" type="time" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				            <input name="ngay" value="${tieuBanCNTT.getNgay()}" type="date" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				            <input name="diaDiem" value="${tieuBanCNTT.getDiaDiem()}" type="text" placeholder="Địa điểm" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				        	<select name="chuyenNganh" class="form-control" style="width: 300px; margin-left: 50px; display: inline;">
				                <option value="ATTT" ${tieuBanCNTT.getChuyenNganh() == 'ATTT'?'selected':''}>An toàn thông tin</option>
				                <option value="CNTT" ${tieuBanCNTT.getChuyenNganh() == 'CNTT'?'selected':''}>Công nghệ thông tin</option>
				                <option value="CNDPT" ${tieuBanCNTT.getChuyenNganh() == 'CNDPT'?'selected':''}>Công nghệ đa phương tiện</option>
				            </select>
				            <div class="div-subcommittee-wrapper">
				                <table class="table table-striped table-bordered table-subcommittee">
				                    <tr>
				                        <th>Mã GV</th>
				                        <th>Họ</th>
				                        <th>Tên</th>
				                        <th>Sđt</th>
				                        <th>Địa chỉ</th>
				                        <th>Chọn</th>
				                    </tr>
				                    <c:forEach items="${giangViens}" var="giangVien">
				                    	
					                    	<tr>
												<td>${giangVien.getMaGV()}</td>
												<td>${giangVien.getHo()}</td>
												<td>${giangVien.getTen()}</td>
												<td>${giangVien.getSDT()}</td>
												<td>${giangVien.getDiaChi()}</td>
												<c:set var="have" value="false" />
												<c:forEach items="${tieuBanCNTT.getGiangViens()}" var="giangVien2">
													<c:if test="${giangVien.getMaGV() == giangVien2.getMaGV()}">
														<c:set var="have" value="true" />
													</c:if>
						                        </c:forEach>
						                        <td><input type="checkbox" name="select" value="${giangVien.getMaGV()}" ${have=='true'?'checked':''}></td>
						                    </tr>
					                 </c:forEach>
				                </table>
				            </div>
				            <button onclick="location.reload();" class="finish-btn btn btn-success"  style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Cập nhật</button>
			            </form>    
			        </div>
			        <div class="div-subcommittee-delete" id="delete${tieuBanCNTT.getMaTB()}">
			        	<form action="scmt-delete.htm" method="POST">
				        	<input name="maTB" type="number" value="${tieuBanCNTT.getMaTB()}" hidden>
				            <p style="text-align: center; color:teal; font-weight: bold;">Bạn có chắc chắn muốn xóa ${tieuBanCNTT.getTenTB()}</p>
				            <button type="submit" style="position: absolute; left:80px;" class="btn btn-success" >Đồng ý</button>
				            <button type="button" style="position: absolute; right:80px;" class="btn btn-danger" onclick="hideDeleteCommittee('${tieuBanCNTT.getMaTB()}');">Hủy</button>
			       		</form>
			        </div>
                </c:forEach>
                <h6 style="color: blue; font-weight: bold; margin-top: 20px;">Công nghệ đa phương tiện</h6>
                <c:forEach items="${tieuBanCNDPTs}" var="tieuBanCNDPT">
                	<li>
	                    <a href="javascript:void(0)" onclick="showSubcommittee('${tieuBanCNDPT.getMaTB()}');" id="name-subcommittee1">${tieuBanCNDPT.getTenTB()}</a>
	                    <a ${lock=='have'?'hidden':''} href="javascript:void(0)" onclick="showEditSubcommittee('${tieuBanCNDPT.getMaTB()}');" id="edit-subcommittee1">Sửa</a>
	                    <a ${lock=='have'?'hidden':''} href="javascript:void(0)" onclick="showDeleteSubcommittee('${tieuBanCNDPT.getMaTB()}');" id="delete-subcommittee1">Xóa</a>
                	</li>
                	<div class="div-subcommittee-show"  id="show${tieuBanCNDPT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="hideSubcommitte('show${tieuBanCNDPT.getMaTB()}');">&times</a>
			            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">${tieuBanCNDPT.getTenTB()}</p>
			            <span class="scmt-info">Thời gian: ${tieuBanCNDPT.getGio()} ${tieuBanCNDPT.getNgay()}</span>
			            <span class="scmt-info">Địa điểm: ${tieuBanCNDPT.getDiaDiem()}</span>
			            <div class="div-subcommittee-wrapper">
			                <table class="table table-striped table-bordered table-subcommittee">
			                    <tr>
			                        <th>Mã GV</th>
			                        <th>Họ</th>
			                        <th>Tên</th>
			                        <th>Sđt</th>
			                        <th>Địa chỉ</th>
			                    </tr>
			                    <c:forEach items="${tieuBanCNDPT.getGiangViens()}" var="giangVien">
			                    	<tr>
				                        <td>${giangVien.getMaGV()}</td>
				                        <td>${giangVien.getHo()}</td>
				                        <td>${giangVien.getTen()}</td>
				                        <td>${giangVien.getSDT()}</td>
				                        <td>${giangVien.getDiaChi()}</td>
			                    	</tr>
			                    </c:forEach>
			                    
			                </table>
            			</div>
           				 <button onclick="hideSubcommitte('show${tieuBanCNDPT.getMaTB()}');" class="finish-btn btn btn-success"  style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        			</div>
        			<div class="div-subcommittee-edit" id="edit${tieuBanCNDPT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="hideEditSubcommitte('${tieuBanCNDPT.getMaTB()}');">&times</a>
			            <form action="scmt-edit.htm" method="POST">
			            	<input type="checkbox" name="select" value="" checked hidden>
			            	<input name="maTB" type="number" value="${tieuBanCNDPT.getMaTB()}" hidden>
				            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Sửa ${tieuBanCNDPT.getTenTB()}</p>
				            <input name="tenTB" value="${tieuBanCNDPT.getTenTB()}" type="text" placeholder="Tên tiểu ban" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
							<input name="gio" value="${tieuBanCNDPT.getGio()}" type="time" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				            <input name="ngay" value="${tieuBanCNDPT.getNgay()}" type="date" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				            <input name="diaDiem" value="${tieuBanCNDPT.getDiaDiem()}" type="text" placeholder="Địa điểm" class="form-control" style="width: 200px; margin-left: 50px; display: inline;" required="required">
				        	<select name="chuyenNganh" class="form-control" style="width: 300px; margin-left: 50px; display: inline;">
				                <option value="ATTT" ${tieuBanCNDPT.getChuyenNganh() == 'ATTT'?'selected':''}>An toàn thông tin</option>
				                <option value="CNTT" ${tieuBanCNDPT.getChuyenNganh() == 'CNTT'?'selected':''}>Công nghệ thông tin</option>
				                <option value="CNDPT" ${tieuBanCNDPT.getChuyenNganh() == 'CNDPT'?'selected':''}>Công nghệ đa phương tiện</option>
				            </select>
				            <div class="div-subcommittee-wrapper">
				                <table class="table table-striped table-bordered table-subcommittee">
				                    <tr>
				                        <th>Mã GV</th>
				                        <th>Họ</th>
				                        <th>Tên</th>
				                        <th>Sđt</th>
				                        <th>Địa chỉ</th>
				                        <th>Chọn</th>
				                    </tr>
				                    <c:forEach items="${giangViens}" var="giangVien">
				                    	
					                    	<tr>
												<td>${giangVien.getMaGV()}</td>
												<td>${giangVien.getHo()}</td>
												<td>${giangVien.getTen()}</td>
												<td>${giangVien.getSDT()}</td>
												<td>${giangVien.getDiaChi()}</td>
												<c:set var="have" value="false" />
												<c:forEach items="${tieuBanCNDPT.getGiangViens()}" var="giangVien2">
													<c:if test="${giangVien.getMaGV() == giangVien2.getMaGV()}">
														<c:set var="have" value="true" />
													</c:if>
						                        </c:forEach>
						                        <td><input type="checkbox" name="select" value="${giangVien.getMaGV()}" ${have=='true'?'checked':''}></td>
						                    </tr>
					                 </c:forEach>
				                </table>
				            </div>
				            <button onclick="location.reload();" class="finish-btn btn btn-success"  style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Cập nhật</button>
			            </form>    
			        </div>
			        <div class="div-subcommittee-delete" id="delete${tieuBanCNDPT.getMaTB()}">
			        	<form action="scmt-delete.htm" method="POST">
				        	<input name="maTB" type="number" value="${tieuBanCNDPT.getMaTB()}" hidden>
				            <p style="text-align: center; color:teal; font-weight: bold;">Bạn có chắc chắn muốn xóa ${tieuBanCNDPT.getTenTB()}</p>
				            <button type="submit" style="position: absolute; left:80px;" class="btn btn-success" >Đồng ý</button>
				            <button type="button" style="position: absolute; right:80px;" class="btn btn-danger" onclick="hideDeleteCommittee('${tieuBanCNDPT.getMaTB()}');">Hủy</button>
			       		</form>
			        </div>
                </c:forEach>
            </ul>
        </div>
        
    </body>
</html>