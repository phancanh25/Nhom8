<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>INDEX STAFF</title>
<base href="pageContext.servletContext.contextPath/">
<style>
table{
	border:1px solid black;
}
th, td{
	padding:10px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>Mã SV</th>
			<th>Họ</th>
			<th>Tên</th>
			<th>Lớp</th>
			<th>NgaySinh</th>
			<th>Phai</th>
			<th>Dia Chi</th>
			<th>Khoa</th>
			<th>mada</th>
			<th>diemtbtl</th>
			
		</tr>
		<c:forEach var="s" items="${students}">
			<tr>
				<td>${s.maSV}</td>
				<td>${s.ho}</td>
				<td>${s.ten}</td>
				<td>${s.lop}</td>
				<td>${s.ngaySinh}</td>
				<td>${s.phai}</td>
				<td>${s.diaChi}</td>
				<td>${s.khoa}</td>
				<td>${s.maDA}</td>
				<td>${s.diemTBTL}</td> 
			</tr>
		</c:forEach>
	</table>
</body>
</html>