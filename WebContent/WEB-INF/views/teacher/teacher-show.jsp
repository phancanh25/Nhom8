<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Index</title>
</head>
<body>
	<table class="table table-hower">
		<tr>
			<th>Mã giáo viên</th>
			<th>Họ</th>
			<th>Tên</th>
			<th>Phái</th>
			<th>Địa chỉ</th>
			<th></th>
		</tr>
		<c:forEach var="t" items="${giangVien}">
			<tr>
				<td>${t.maGV}</td>
				<td>${t.ho}</td>
				<td>${t.ten}</td>
			 	<td>${t.isPhai()?'Nam':'Nữ'}</td>
				<td>${t.diaChi}</td>
				<td><a href="insert.htm">Insert</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>