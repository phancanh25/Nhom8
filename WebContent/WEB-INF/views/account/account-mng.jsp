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