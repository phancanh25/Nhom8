<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
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
                
                <a href="javascript:void(0)" onclick="openLogin();" style="visibility: ${user==null?'visible':'hidden'}">Login</a>
                <a href="Home/logout.htm" style="margin: 0px;  border: none; background: none; visibility: ${user!=null?'visible':'hidden'}">Logout</a>
                <a href="javascript:void(0)" style="margin-right: 10px; visibility: ${user!=null?'visible':'hidden'}">Hi ${user}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${user=='admin'?'':'hidden'}>Quản lý tài khoản</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="${role == 1?'./statistic/piechart.htm':'error.htm'}">Thống kê</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'event.htm':'error.htm'}">DS kỳ bảo vệ</a>
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
			        	<option value="${listnam}">${listnam}</option>
			        </c:forEach>
			    </select> &nbsp;
			    <button type="button" class="btn btn-primary" onclick="submitValue()" style="margin-top: -5px;">submit </button>
			    <a style="margin: 5px 110px 0 0; float: right; font-weight: bold" href="./statistic/barchart.htm" class="text-success">Chuyển sang biểu đồ cột</a>
			</form>
			<hr style="background: #139CD5; width: 80%">
        	<div id="piechart" style="width: 900px; height: 500px; margin-top: -10px;"></div>
        </div>
    </body>
</html>