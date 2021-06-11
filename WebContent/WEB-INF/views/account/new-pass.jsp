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
        <link rel="stylesheet" type="text/css" href="resources/new-pass.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Tạo mật khẩu mới</title>

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
        <div class="div-new-pass">
            <div class="div-renew-pass" ${token!='expired'?'':'hidden' }>
            	<p>Xin chào tài khoản ${account}</p>
            	<h5 style="text-align: center ;color: ${wrongFlag=='wrong'?'red;':'#00CE40'}">${flagMsg} <a href="Home/index.htm" ${doneFlag==null?'hidden':''}>Trở về trang chủ</a></h5>
            	<form action="set-new-pass.htm" method="POST">
            		<input type="text" name="account" value="${account}" hidden/>
            		<input type="number" name="accountRole" value="${accountRole}" hidden/>
            		<input type="password" name="newpass1" placeholder="Nhập mật khẩu mới" required="required"/>
            		<input type="password" name="newpass2" placeholder="Nhập lại mật khẩu mới" required="required"/>
            		<br/>
            		<button class="btn-primary" type="submit">Xác nhận</button>
            	</form>
            </div>
            <div class="div-error" ${token=='expired'?'':'hidden' }>
            	<img src="resources/img/error.png" width="200px" height="200px">
            	<p>Đường dẫn đã hết hạn</p>
            </div>
        </div>
        
    </body>
</html>