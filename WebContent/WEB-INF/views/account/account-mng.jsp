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
	        	<input name="ma" type="text" placeholder="MSSV/MSGV">
	        	<p class="p-error-add" ${type==''?'hidden':''}>${error}</p>
	        	<button type="submit">Tạo tài khoản</button>
        	</form>
        </div>
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
                <a href="event.htm">DS kỳ bảo vệ</a>
                <a href="assignment.htm">Phân công đồ án</a>
                <a href="student/student.htm">DSSV</a>
                <a href="Home/teacher.htm">DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-account-content">
        	  <p style="color: green; font-weight: bold; font-size: 15px">${message}</p>
        	  <form action="account-seacrh.htm" method="POST">
		          <div class="div-search">
		              <input name="username" type="text" placeholder="Tên tài khoản" style="border: 1px black solid; height: 33px">
		              <select id="select-account-type" onchange="changeAccountType();" name="type" style="float: left; width: 200px; height: 33px; margin-top: 5px;" >
		              	<option value="gv" ${type=='gv'?'selected':''}>Giảng viên</option>
		              	<option value="sv" ${type=='sv'?'selected':''}>Sinh viên</option>
		              </select>
		              <input name="ma" type="text" id="input-account-type" placeholder="${type=='gv'?'Mã giảng viên':'Mã sinh viên'}" style="margin-left: 30px; border: 1px black solid; height: 33px">
		              <button>Tìm kiếm</button>
		              <a href="javascript:void(0)" style="margin-left: 60px;" onclick="openAccountAdd();">Thêm tài khoản</a>
		          </div>
	          </form>
            <table ${type=='gv'?'':'hidden'} border="1" class="table table-striped table-bordered" style="font-size: 16px; border: 2px  #0095FF solid">
	            <tr style="text-align: center; color: #0096ff">
	            			<th>Tài khoản</th>
	            			<th>Mã giảng viên</th>
	            			<th>Họ và tên</th>
	            			<th>Quyền</th>
	            			<th></th>
	            </tr>
	            <c:forEach items="${accountGVs}" var="accountGV">
	            	<form action="account-delete.htm" method="POST">
	            		<input name="type" type="text" value="gv" hidden>
	            		<input name="username" type="text" value="${accountGV.getUsername()}" hidden>
		            	<tr style="text-align: center; font-weight: normal; font-size: 13px">
		            		<th>${accountGV.getUsername()}</th>
		            		<th>${accountGV.getGiangVien().getMaGV()}</th>
		            		<th>${accountGV.getGiangVien().getHo()} ${accountGV.getGiangVien().getTen()}</th>
		            		<th>Giảng viên</th>
		            		<th>
		            			<button class="btn btn-primary" type="submit" ${accountGV.getUsername()=='admin'?'hidden':''}>Xóa</button>
		            		</th>
		            	</tr>
	            	</form>
	            </c:forEach>
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
</html>