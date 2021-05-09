<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Giáo Viên</title>
</head>
<body>
${message}
	<form:form action="insert.htm" modelAttribute="giangvien">
		<div>
			<label>Mã Giảng Viên</label>
			<form:input path="maGV" />
		</div>
		<div>
			<label>Họ</label>
			<form:input path="ho" />
		</div>
		<div>
			<label>Tên</label>
			<form:input path="ten" />
		</div>
		<div>
			<label>Phái</label>
			<form:input path="phai" />
		</div>
		<div>
			<label>SĐT</label>
			<form:input path="sDT" />
		</div>
		<div>
			<label>Địa chỉ</label>
			<form:input path="diaChi" />
		</div>
		<div>
		<button class="btn btn-default">Insert</button>
		</div>
		</form:form>
</body>
</html>