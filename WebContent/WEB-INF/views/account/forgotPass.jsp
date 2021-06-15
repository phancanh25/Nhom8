<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="shortcut icon" href="resources/img/logo-lite.png" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="forgotpass.htm" method="post">
        <div class="form-group">
          <label for="Ma">MSGV/MSSV</label>
          <input name="ma" id="Ma" type="text" placeholder="MSSV/MSGV"  pattern="^n\d{2}dc[a-z]{2}\d{3} |PTITGV\d{2}" title="Format nhập vào chưa đúng!!!" size="10" required>
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email" pattern="\w+@\w+(\.\w+)+" title="Format email chưa đúng!!!" required>
        </div>
        <div><span style="color: red">${message}</span> </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        
      </form>
</body>
</html>