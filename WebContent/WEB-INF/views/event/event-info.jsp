<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<script src="resources/script.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/student-css.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Thông tin kỳ bảo vệ đồ án tốt nghiệp</title>

</head>
<body>
        <div class="div-teacher-in-event" id="div-teacher-in-event">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeTeacherInEvent();" style="color: white; margin-top: -10px;">&times</a>
            <p>Danh sách giảng viên</p>
            <div class="wrapper-table-student-in-event">
                <table class="table-student-in-event table table-bordered table-striped">
                    <tr>
                        <th>Mã GV</th>
                        <th>Họ và tên</th>
                        <th>Sđt</th>
                        <th>Địa chỉ</th>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Dương Quá</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q.9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Dương Quá</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q.9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Dương Quá</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q.9, TP HCM</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="div-student-in-event" id="div-student-in-event">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeStudentInEvent();" style="color: white; margin-top: -10px;">&times</a>
            <p>Danh sách sinh viên tham gia</p>
            <div class="wrapper-table-student-in-event">
                <table class="table-student-in-event table table-bordered table-striped">
                    <tr>
                        <th>MSSV</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Lớp</th>
                        <th>Tên đồ án</th>
                        <th>GVHD</th>
                        <th>Điểm hướng dẫn</th>
                        <th>Điểm phản biện</th>
                        <th>Điểm tiểu ban</th>
                        <th>Điểm tổng</th>
                  </tr>
                  <tr>
                    <td>N18DCAT001</td>
                    <td>Trương Vô</td>
                    <td>Kỵ</td>
                    <td>D18CQAT01-N</td>
                    <td>Ứng dụng giám sát người dùng facebook</td>
                    <td>Obama</td>
                    <td><input type="text" value="9" disabled></td>
                    <td><input type="text" value="9.6" disabled></td>
                    <td><input type="text" value="9" disabled></td>
                    <td><input type="text" value="9.3" disabled></td>
                </tr>
                </table>
            </div>
        </div>
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
        <div class="div-event-info">
            <!-- <div class="div-detail">
                <p>Địa điểm: Phòng 2A08</p>
                <p>Thời gian: 8:00 15/5/2021</p>
            </div> -->
            <!-- Căn cứ vào mã đồ án để biết sv thuộc kỳ bảo vệ nào -->
            <!-- <a href="javascript:void(0)">Xem danh sách sinh viên tham gia</a> -->
            <br>
            <div class="div-department" style="margin-top: 10px">
                <p>An toàn thông tin</p>
                <span>Địa điểm: 2A08</span>
                <span>Thời gian: 8:00 15/5/2021</span>
            </div>
            <table class="table-deparment">
                <tr>
                    <td>Tiểu ban 1</td>
                    <td><a href="javascript:void(0)" onclick="openTeacherInEvent();">Xem DSGV</a></td>
                    <td><a href="javascript:void(0)" onclick="openStudentInEvent();">Xem DSSV</a></td>
                </tr>
                <tr>
                    <td>Tiểu ban 2</td>
                    <td><a href="javascript:void(0)" onclick="openTeacherInEvent();">Xem DSGV</a></td>
                    <td><a href="javascript:void(0)" onclick="openStudentInEvent();" >Xem DSSV</a></td>
                </tr>
            </table>
            
            <div class="div-department" style="margin-top: 20px">
                <p>Công nghệ đa phương tiện</p>
                <span>Địa điểm: 2A08</span>
                <span>Thời gian: 8:00 15/5/2021</span>
            </div>
            <table class="table-deparment">
                <tr>
                    <td>Tiểu ban 3</td>
                    <td><a href="javascript:void(0)" onclick="openTeacherInEvent();">Xem DSGV</a></td>
                    <td><a href="javascript:void(0)" onclick="openStudentInEvent();">Xem DSSV</a></td>
                </tr>
            </table>
            <div class="div-department" style="margin-top: 20px">
                <p>Công nghệ thông tin</p>
                <span>Địa điểm: 2A08</span>
                <span>Thời gian: 8:00 15/5/2021</span>
            </div>
            <table class="table-deparment">
                <tr>
                    <td>Tiểu ban 4</td>
                    <td><a href="javascript:void(0)" onclick="openTeacherInEvent();">Xem DSGV</a></td>
                    <td><a href="javascript:void(0)" onclick="openStudentInEvent();">Xem DSSV</a></td>
                </tr>
            </table>
        </div>
    </body>
</html>