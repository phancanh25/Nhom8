<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="shortcut icon" href="resources/img/logo-lite.png" />
<meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/pie-chart.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="resources/script.js"></script>
	<title>Thống kê</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	var SLDADat=<%=request.getAttribute("DADat") %>;
      	var SLDAKDat=<%=request.getAttribute("DAKDat") %>;
      	var listnam=<%=request.getAttribute("listnam") %>;
      	var nam=<%=request.getAttribute("nam") %>;
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Đạt', SLDADat],
          ['Không đạt', SLDAKDat]
        ]);
        console.log(listnam);
        var options = {
          title: 'Thống kê tỉ lệ đồ án đạt hay không năm '+nam,
          titleTextStyle: {
              color: '#139CD5',    // any HTML string color ('red', '#cc00cc')
              fontName: 'Tahoma', // i.e. 'Times New Roman'
              fontSize: 25, // 12, 18 whatever you want (don't specify px)
          },
          is3D: true,
          legend: {
		        textStyle: {
		            color: 'black',
		            fontSize: 18
		        }
		    },
		    chartArea:{left:270,top:50,width:"70%",height:"70%"},
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    <script>
	function submitValue() {
		valueSelect = document.getElementById("nowtime").value;
		document.getElementById("myForm").action = "statistic/piechart/" + valueSelect + ".htm";
		document.getElementById("myForm").submit()

	}
</script>

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
        
        <div class="div-piechart-content">
        	<form id="myForm" action="statistic/piechart/'document.getElementById('nowtime').value'+.htm" target="__blank" method="post" style="margin-top: 50px; ">
        		<font style="margin-left: 110px; font-family: Tahoma; font-size: 25; color: black;">Chọn năm </font> &nbsp;
			    <select class="form-control" id="nowtime" style="width: 200px; display: inline;">
			    	<c:forEach items="${listnam}" var="listnam">
			        	<option value="${listnam}" ${String.valueOf(nam)==listnam?'selected':''}>${listnam}</option>
			        </c:forEach>
			    </select> &nbsp;
			    <button type="button" class="btn btn-primary" onclick="submitValue()" style="margin-top: -5px;">Tìm kiếm</button>
			    <a style="margin: 5px 110px 0 0; float: right; font-weight: bold" href="./statistic/barchart.htm" class="text-success">Chuyển sang biểu đồ cột</a>
			</form>
			<hr style="background: #139CD5; width: 80%">
        	<div id="piechart" style="width: 900px; height: 500px; margin-top: -10px;"></div>
        </div>
    </body>
</html>