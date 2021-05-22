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
        <link rel="stylesheet" type="text/css" href="resources/subcommittee.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Quản lý tiểu ban</title>

</head>
<body>
       <div class="div-login" id="div-login">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
            <img src="resources/img/logo-lite.png">
            <form action="./login.htm" method="POST">
                <input type="text" name="username" placeholder="Tên đăng nhập"><br>
                <input type="password" name="password" placeholder="Mật khẩu"><br>
                <button type="submit">Đăng nhập</button>
            </form>
            <div class="div-login-bottom">
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
        <div class="div-subcommittee">
        	<p style="color: #6692e3; font-weight: bold; margin-left: 50px">Kỳ bảo vệ đồ án tốt nghiệp năm ${year}</p>
            <p style="color: #6692e3; font-weight: bold; margin-left: 50px">Quản lý tiểu ban<code> Riêng trang này bấm thêm hoặc cập nhật sẽ reload lại page và tải lại danh sách tiểu ban</code></p>
            <a href="javascript:void(0)" style="margin-left: 50px" onclick="showAddSubcommittee();">Thêm tiểu ban</a>
            <ul class="ul-subcommittee">
                <h6 style="color: blue; font-weight: bold; margin-top: 20px;">An toàn thông tin</h6>
                <c:forEach items="${tieuBanATTTs}" var="tieuBanATTT">
                	<li>
	                    <a href="javascript:void(0)" onclick="showSubcommittee('${tieuBanATTT.getMaTB()}');" id="name-subcommittee1">${tieuBanATTT.getTenTB()}</a>
	                    <a href="javascript:void(0)" onclick="showEditSubcommittee('${tieuBanATTT.getMaTB()}');" id="edit-subcommittee1">Sửa</a>
	                    <a href="javascript:void(0)" onclick="showDeleteSubcommittee('${tieuBanATTT.getMaTB()}');" id="delete-subcommittee1">Xóa</a>
                	</li>
                	<div class="div-subcommittee-show"  id="show${tieuBanATTT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this,'show${tieuBanATTT.getMaTB()}');">&times</a>
			            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">${tieuBanATTT.getTenTB()}</p>
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
           				 <button onclick="hideSubcommitte();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        			</div>
        			<div class="div-subcommittee-edit" id="edit${tieuBanATTT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this,'edit${tieuBanATTT.getMaTB()}');">&times</a>
			            <form action="scmt-edit.htm" method="POST">
			            	<input name="maTB" type="number" value="${tieuBanATTT.getMaTB()}" hidden>
				            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Sửa ${tieuBanATTT.getTenTB()}</p>
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
				            <button onclick="location.reload();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Cập nhật</button>
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
	                    <a href="javascript:void(0)" onclick="showEditSubcommittee('${tieuBanCNTT.getMaTB()}');" id="edit-subcommittee1">Sửa</a>
	                    <a href="javascript:void(0)" onclick="showDeleteSubcommittee('${tieuBanCNTT.getMaTB()}');" id="delete-subcommittee1">Xóa</a>
                	</li>
                	<div class="div-subcommittee-show"  id="show${tieuBanCNTT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this,'show${tieuBanCNTT.getMaTB()}');">&times</a>
			            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">${tieuBanCNTT.getTenTB()}</p>
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
           				 <button onclick="hideSubcommitte();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        			</div>
        			<div class="div-subcommittee-edit" id="edit${tieuBanCNTT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this,'edit${tieuBanCNTT.getMaTB()}');">&times</a>
			            <form action="scmt-edit.htm" method="POST">
			            	<input name="maTB" type="number" value="${tieuBanCNTT.getMaTB()}" hidden>
				            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Sửa ${tieuBanCNTT.getTenTB()}</p>
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
				            <button onclick="location.reload();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Cập nhật</button>
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
	                    <a href="javascript:void(0)" onclick="showEditSubcommittee('${tieuBanCNDPT.getMaTB()}');" id="edit-subcommittee1">Sửa</a>
	                    <a href="javascript:void(0)" onclick="showDeleteSubcommittee('${tieuBanCNDPT.getMaTB()}');" id="delete-subcommittee1">Xóa</a>
                	</li>
                	<div class="div-subcommittee-show"  id="show${tieuBanCNDPT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this,'show${tieuBanCNDPT.getMaTB()}');">&times</a>
			            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">${tieuBanCNDPT.getTenTB()}</p>
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
           				 <button onclick="hideSubcommitte();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        			</div>
        			<div class="div-subcommittee-edit" id="edit${tieuBanCNDPT.getMaTB()}">
			            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this,'edit${tieuBanCNDPT.getMaTB()}');">&times</a>
			            <form action="scmt-edit.htm" method="POST">
			            	<input name="maTB" type="number" value="${tieuBanCNDPT.getMaTB()}" hidden>
				            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Sửa ${tieuBanCNDPT.getTenTB()}</p>
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
				            <button onclick="location.reload();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Cập nhật</button>
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
        <div class="div-subcommittee-add", id="div-subcommittee-add">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this,'div-subcommittee-add');">&times</a>
            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Thêm tiểu ban (giờ chọn CH bị lỗi)</p>
            <form action="scmt-add.htm" method="POST">
            	<input name="maTB" type="number" placeholder="Mã tiểu ban(Tạm thời)" class="form-control" style="width: 200px; margin-left: 50px; display: inline;">
	            <input name="tenTB" type="text" placeholder="Tên tiểu ban" class="form-control" style="width: 200px; margin-left: 50px; display: inline;">
	            <input name="gio" type="time" step="2" class="form-control" style="width: 200px; margin-left: 50px; display: inline;">
	            <input name="ngay" type="date" class="form-control" style="width: 200px; margin-left: 50px; display: inline;">
	            <input name="diaDiem" type="text" placeholder="Địa điểm" class="form-control" style="width: 200px; margin-left: 50px; display: inline;">
	            <input name="khoa" type="number" placeholder="Khóa" class="form-control" style="width: 200px; margin-left: 50px; display: inline;">
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
            	<button type="submit" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Thêm tiểu ban</button>
            </form>
                
        </div>
    </body>
</html>