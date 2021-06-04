<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="forgotpass.htm" method="post">
        <div class="form-group">
          <label for="Ma">MSGV/MSSV</label>
          <input name="ma" id="Ma" type="text" placeholder="MSSV/MSGV">
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email">
        </div>
        <div><span style="color: red">${message}</span> </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        
      </form>
</body>
</html>