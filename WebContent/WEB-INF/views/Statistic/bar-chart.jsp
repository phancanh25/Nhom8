<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/bar-chart.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="resources/script.js"></script>
<title>Thống kê</title>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
    	var SLDAperYears=<%=request.getAttribute("SLDAperYear") %>;
    	var namofSLDAs=<%=request.getAttribute("namofSLDA") %>;
    	<%-- var AllDoAns=<%=request.getAttribute("AllDoAn") %>; --%>
        var data = new google.visualization.arrayToDataTable([
          ["Đồ án mỗi năm", 'Số lượng']
        ]);
        
        
        for (var i = 0; i < SLDAperYears.length; i ++) {
        	data.Vf[i] = [namofSLDAs[i], SLDAperYears[i]]
        	data.Vf[i] = {
        			c: [
        				{
            				v: namofSLDAs[i]
            			},
            			{
            				v: SLDAperYears[i]
            			}
        			]
        	}
        }
/*         
        console.log(data.Vf) */

        var options = {
          title: 'ĐỒ ÁN TRONG TỪNG NĂM!!!',
          width: 1000,
          height: 150,
          legend: { position: 'none' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Số lượng đồ án'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
    </script>
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
        
        <div class="div-barchar-content">
        	<a style="margin: 5px 20px 0 0; float: right; font-weight: bold" href="./statistic/piechart.htm" class="text-success">Chuyển sang biểu đồ tròn</a>
        	<br>
        	<br>
        	<p style="text-align: center; font-family: Tahoma; font-size: 25px; color: #139CD5;">Thống kê số lượng đồ án tốt nghiệp theo từng năm</p>
        	<div id="top_x_div" style="width: 900px; height: 500px;"></div>
        	<a class="scroll-to-top rounded" href="#page-top">
		        <i class="fas fa-angle-up"></i>
		    </a>
        </div>
    </body>
</html>