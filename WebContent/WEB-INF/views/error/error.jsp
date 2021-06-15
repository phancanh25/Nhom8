<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<link rel="shortcut icon" href="resources/img/logo-lite.png" />
<title>Error</title>
<link rel="stylesheet" href="/Nhom8/resources/error/css.css" >
<link rel="stylesheet" href="/Nhom8/resources/error/style.css" >
<link rel="stylesheet" href="/Nhom8/resources/error/4091b4eae6.css" >
    <title>Thông báo!</title>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

        if(window.self !== window.top){
            if (document.getElementById('back-to-home')) document.getElementById('back-to-home').style.display = 'none'
        }
	</script>
	<script>
	    var errorCode = "";
	</script>
</head>
<body>
	<div class="">
        <div class="page-container page-container-responsive">
            <div class="row space-top-8 space-8 row-table">
                <div class="col-5 col-middle">
                    <h1 class="text-jumbo text-ginormous">LỖI!</h1>
                    <h2>Đã xảy ra lỗi khi thực hiện hành động hoặc bạn không có quyền truy cập vào trang này (vui lòng đăng nhập trước)</h2>
                    <h4>${message}</h4>
                </div>
                <div class="col-5 col-middle text-center robo_figure">
                    <img class="robo_body" src="resources/error/404_body.png" width="100%" alt="Girl has dropped her ice cream.">
                    <img src="resources/error/404_bg.png" width="100%" alt="Girl has dropped her ice cream.">
                    <div class="robo_shadow"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>