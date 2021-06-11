<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="resources/script.js"></script>
<title>Trang chủ</title>
</head>
<body>
		<div id="div-profile" class="div-profile ${changePassFlag != null?'fadeInDown ':''}" style="visibility: ${changePassFlag != null?'visible':'hidden'}">
			<a href="javascript:void(0)" class="a-login-quit" onclick="closeChangePass();" style="margin-top: -12px;">&times</a>
			<div class="div-profile-info">
				<h5 style="color: #2F79FF; margin-top: 20px;">Thông tin tài khoản</h5>
				<div class="div-info-permanent">
					<img src="resources/img/user1.png" style="width: 120px; height: 120px; float: left; border: 1px #2F79FF solid; padding: 5px;">
					<div>
						<p>Giảng viên</p>
						<hr style="background: gray;">
						<p>PTITGV01</p>
						<hr style="background: gray;">
						<p>Huỳnh Trọng Thưa</p>
					</div>
				</div>	
				<div class="div-info-change">
					<hr>
					<p>Giới tính: Nam <a href="javascript:void()">Sửa</a></p>
					<hr style="background: gray;">
					<p>SĐT: 0987654321 <a href="javascript:void()">Sửa</a></p>
					<hr style="background: gray;">
					<p>Địa chỉ: 97 Man Thiện, TP Thủ Đức, TP HCM <a href="javascript:void()">Sửa</a></p>
				</div>
				<button class="btn-primary" style="width: 200px; height: 40px; margin: 50px auto;">Sửa thông tin</button>
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
        <div class="div-login ${error!=null || forgotFlag =='have' || forgotFlag =='done'?'fadeInDown':''}" style="visibility: ${error!=null || forgotFlag =='have' || forgotFlag =='done'?'visible':'hidden'}" id="div-login">
            <div id="div-login-form" class="${forgotFlag =='have' || forgotFlag =='done'?'leftIn':''}" style="width: 100%; height: 100%">
	            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
	            <img src="resources/img/logo-lite.png">
	            <form action="./login.htm" method="POST">
	                <input type="text" name="username" placeholder="Tên đăng nhập"><br>
	                <input type="password" name="password" placeholder="Mật khẩu"><br>
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
		            <input name="ma" id="Ma" type="text" placeholder="Nhập MSSV/MSGV"  pattern="^n\d{2}dc[a-z]{2}\d{3} |PTITGV\d{2}" title="Format nhập vào chưa đúng!!!" size="10" required>
		            <input type="email" name="email" id="email" placeholder="Nhập Email" pattern="\w+@\w+(\.\w+)+" title="Format email chưa đúng!!!" required>
	                <button type="submit">Lấy lại mật khẩu</button>
	            </form>
            </div>
        </div>
        <div class="div-top">
            <div class="div-top-wrapper">
            	<a href="javascript:void(0)">&#9743 0987-654-321</a>
                <a href="javascript:void(0)">&#9993 ptithcm@edu.vn</a>
                <a href="javascript:void(0)" onclick="openLogin();" style="visibility: ${user==null?'visible':'hidden'}">Đăng nhập</a>
                <a href="Home/logout.htm" style="margin: 0 -100px 0 10px; border: none; background: none; width: 120px; visibility: ${user!=null?'visible':'hidden'}">Đăng xuất</a>
                <a href="javascript:void(0)" onClick="openChangePass();" style="margin-right: 10px; visibility: ${user!=null?'visible':'hidden'}">Xin chào ${user}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${role==1?'':'hidden'}>Quản lý tài khoản</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="${role == 1?'./statistic/piechart.htm':'error.htm'}">Thống kê</a>
                <a href="${role == 1 || role==2 ?'event.htm':'error.htm'}">DS kỳ bảo vệ</a>
                <a href="${role == 1 || role == 2?'assignment.htm':'error.htm'}">Phân công đồ án</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'student/student.htm':'error.htm'}">DSSV</a>
                <a href="${role == 1 || role == 2?'teacher/teacher.htm':'error.htm'}">DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-home">
            <ul class="ul-home">
                <li>
                    <a href="javascript:void(0)"><h4>Danh sách sinh viên tốt nghiệp 2018</h4></a>
                    <div class="div-content">
                        <img src="resources/img/img-content1.png">
                        <p>Trước đó, vào sáng 19/3, tại Trụ sở Chính phủ, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia phòng, chống dịch COVID-19 đã chủ trì cuộc họp về “hộ chiếu vaccine COVID-19”. Theo Bộ trưởng Bộ Y tế Nguyễn Thanh Long, từ góc độ tiếp cận của ngành Y tế, “hộ chiếu vaccine COVID-19” thực chất là giấy chứng nhận đã tiêm chủng đầy đủ hai mũi vaccine ngừa COVID-19, được điều chỉnh theo Luật Phòng, chống bệnh truyền nhiễm và Điều lệ kiểm dịch Y tế quốc tế...</p>
                    </div> 
                </li>
                <li>
                    <a href="javascript:void(0)"><h4>Danh sách sinh viên tốt nghiệp 2018</h4></a>
                    <div class="div-content">
                        <img src="resources/img/img-content1.png">
                        <p>Trước đó, vào sáng 19/3, tại Trụ sở Chính phủ, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia phòng, chống dịch COVID-19 đã chủ trì cuộc họp về “hộ chiếu vaccine COVID-19”. Theo Bộ trưởng Bộ Y tế Nguyễn Thanh Long, từ góc độ tiếp cận của ngành Y tế, “hộ chiếu vaccine COVID-19” thực chất là giấy chứng nhận đã tiêm chủng đầy đủ hai mũi vaccine ngừa COVID-19, được điều chỉnh theo Luật Phòng, chống bệnh truyền nhiễm và Điều lệ kiểm dịch Y tế quốc tế...</p>
                    </div> 
                </li>
                <li>
                    <a href="javascript:void(0)"><h4>Danh sách sinh viên tốt nghiệp 2018</h4></a>
                    <div class="div-content">
                        <img src="resources/img/img-content1.png">
                        <p>Trước đó, vào sáng 19/3, tại Trụ sở Chính phủ, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia phòng, chống dịch COVID-19 đã chủ trì cuộc họp về “hộ chiếu vaccine COVID-19”. Theo Bộ trưởng Bộ Y tế Nguyễn Thanh Long, từ góc độ tiếp cận của ngành Y tế, “hộ chiếu vaccine COVID-19” thực chất là giấy chứng nhận đã tiêm chủng đầy đủ hai mũi vaccine ngừa COVID-19, được điều chỉnh theo Luật Phòng, chống bệnh truyền nhiễm và Điều lệ kiểm dịch Y tế quốc tế...</p>
                    </div> 
                </li>
                <li>
                    <a href="javascript:void(0)"><h4>Danh sách sinh viên tốt nghiệp 2018</h4></a>
                    <div class="div-content">
                        <img src="resources/img/img-content1.png">
                        <p>Trước đó, vào sáng 19/3, tại Trụ sở Chính phủ, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia phòng, chống dịch COVID-19 đã chủ trì cuộc họp về “hộ chiếu vaccine COVID-19”. Theo Bộ trưởng Bộ Y tế Nguyễn Thanh Long, từ góc độ tiếp cận của ngành Y tế, “hộ chiếu vaccine COVID-19” thực chất là giấy chứng nhận đã tiêm chủng đầy đủ hai mũi vaccine ngừa COVID-19, được điều chỉnh theo Luật Phòng, chống bệnh truyền nhiễm và Điều lệ kiểm dịch Y tế quốc tế...</p>
                    </div> 
                </li>
            </ul>
        </div>
    </body>
</html>