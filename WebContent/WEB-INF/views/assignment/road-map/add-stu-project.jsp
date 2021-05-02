<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<script src="resources/script.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/add-stu-project.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Chọn sinh viên làm đồ án tốt nghiệp</title>

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
                <a href="javascript:void(0)" onclick="openLogin();">Login</a>
                <a href="javascript:void(0)"></a>
                <a href="javascript:void(0)">Register</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="index.html">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="event.html">DS kỳ bảo vệ</a>
                <a href="assignment.html">Phân công đồ án</a>
                <a href="student.html">DSSV</a>
                <a href="teacher.html">DSGV</a>
                <a href="index.html">Trang chủ</a>
            </div>
        </div>
        <div class="div-add-stu-project">
            <p style="color: #6692e3; font-weight: bold; margin-left: 50px">Chọn sinh viên <code>(Table này dùng sql xuất những sinh viên đủ điều kiện làm đồ án)</code></p>
            <div class="div-add-stu-project-wrapper">
                <table class="table table-striped table-bordered table-add-stu-project">
                    <tr>
                        <th>MSSV</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Lớp</th>
                        <th>Phái</th>
                        <th>Ngày sinh</th>
                        <th>Khóa</th>
                        <th>Tốt nghiệp</th>
                        <th>Chọn</th>
                        <th>GVHD</th>
                    </tr>
                    <tr>
                        <td>N18DCAT001</td>
                        <td>Trương Vô</td>
                        <td>Kỵ</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT002</td>
                        <td>Lê Văn</td>
                        <td>Luyện</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT001</td>
                        <td>Trương Vô</td>
                        <td>Kỵ</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT002</td>
                        <td>Lê Văn</td>
                        <td>Luyện</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT001</td>
                        <td>Trương Vô</td>
                        <td>Kỵ</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT002</td>
                        <td>Lê Văn</td>
                        <td>Luyện</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT001</td>
                        <td>Trương Vô</td>
                        <td>Kỵ</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT002</td>
                        <td>Lê Văn</td>
                        <td>Luyện</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT001</td>
                        <td>Trương Vô</td>
                        <td>Kỵ</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>N18DCAT002</td>
                        <td>Lê Văn</td>
                        <td>Luyện</td>
                        <td>D18CQAT01-N</td>
                        <td>Nam</td>
                        <td>01/01/2000</td>
                        <td>2018</td>
                        <td>Chưa TN</td>
                        <td><input type="checkbox" class="student-check" onchange="check();"></td>
                        <td>
                            <select disabled class="select-teacher">
                                <option>Trương Tam Phong</option>
                                <option>Tạ Tốn</option>
                                <option>Optimus</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <button class="finish-btn btn btn-success" id="btn-success" style="position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        </div>
        
    </body>
</html>