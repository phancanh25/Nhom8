<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="resources/script.js"></script>
<title>Trang chủ</title>
</head>
<body>
        <div class="div-login ${error!=null?'fadeInDown':''}" style="visibility: ${error!=null?'visible':'hidden'}" id="div-login">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
            <img src="resources/img/logo-lite.png">
            <form action="./login.htm" method="POST">
                <input type="text" name="username" placeholder="Tên đăng nhập"><br>
                <input type="password" name="password" placeholder="Mật khẩu"><br>
                <p class="error" ${error!=null?'':'hidden'}>Tài khoản hoặc mật khẩu không chính xác</p>
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
                <a href="javascript:void(0)" ${role==1 || role==2 || role == 3?'':'hidden'}	>Role: ${role}</a>
                <a href="javascript:void(0)" onclick="openLogin();" style="width: 90px; visibility: ${user==null?'visible':'hidden'}">Đăng nhập</a>
                <a href="Home/logout.htm" style="margin: 0px;  border: none; background: none; visibility: ${user!=null?'visible':'hidden'}">Đăng xuất</a>
                <a href="javascript:void(0)" style="margin-right: 10px; visibility: ${user!=null?'visible':'hidden'}">Hi ${user}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${role=='1'?'':'hidden'}>Quản lý tài khoản</a>
            </div>
        </div>
        <div class="div-menu">
            <div class="div-top-wrapper"> 
                <a href="">
                    <img src="resources/img/logo.png" class="img-logo">
                </a>
                <a href="${role == 1?'./statistic/piechart.htm':'error.htm'}">Thống kê</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'event.htm':'error.htm'}">DS kỳ bảo vệ</a>
                <a href="${role == 1 || role == 2?'assignment.htm':'error.htm'}">Phân công đồ án</a>
                <a href="${role == 1 || role == 2 || role == 3 ?'student/student.htm':'error.htm'}">DSSV</a>
                <a href="${role == 1 || role == 2?'teacher/teacher.htm':'error.htm'}" >DSGV</a>
                <a href="Home/index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-home">
            <ul class="ul-home">
                <li>
                    <a href="javascript:void(0)"><h4>Danh sách sinh viên tốt nghiệp 2018</h4></a>
                    <div class="div-content">
                        <img src="resources/img/img-content1.png">
                        <p>Trước đó, vào sáng 19/3, tại Trụ sở Chính phủ, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia phòng, chống dịch COVID-19 đã chủ trì cuộc họp về “hộ chiếu vaccine COVID-19”. Theo Bộ trưởng Bộ Y tế Nguyễn Thanh Long, từ góc độ tiếp cận của ngành Y tế, “hộ chiếu vaccine COVID-19” thực chất là giấy chứng nhận đã tiêm chủng đầy đủ hai mũi vaccine ngừa COVID-19, được điều chỉnh theo Luật Phòng, chống bệnh truyền nhiễm và Điều lệ kiểm dịch Y tế quốc tế...</p>
                    </div> 
                </li>
                <li>
                    <a href="javascript:void(0)"><h4>Danh sách sinh viên tốt nghiệp 2018</h4></a>
                    <div class="div-content">
                        <img src="resources/img/img-content1.png">
                        <p>Trước đó, vào sáng 19/3, tại Trụ sở Chính phủ, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia phòng, chống dịch COVID-19 đã chủ trì cuộc họp về “hộ chiếu vaccine COVID-19”. Theo Bộ trưởng Bộ Y tế Nguyễn Thanh Long, từ góc độ tiếp cận của ngành Y tế, “hộ chiếu vaccine COVID-19” thực chất là giấy chứng nhận đã tiêm chủng đầy đủ hai mũi vaccine ngừa COVID-19, được điều chỉnh theo Luật Phòng, chống bệnh truyền nhiễm và Điều lệ kiểm dịch Y tế quốc tế...</p>
                    </div> 
                </li>
                <li>
                    <a href="javascript:void(0)"><h4>Danh sách sinh viên tốt nghiệp 2018</h4></a>
                    <div class="div-content">
                        <img src="resources/img/img-content1.png">
                        <p>Trước đó, vào sáng 19/3, tại Trụ sở Chính phủ, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia phòng, chống dịch COVID-19 đã chủ trì cuộc họp về “hộ chiếu vaccine COVID-19”. Theo Bộ trưởng Bộ Y tế Nguyễn Thanh Long, từ góc độ tiếp cận của ngành Y tế, “hộ chiếu vaccine COVID-19” thực chất là giấy chứng nhận đã tiêm chủng đầy đủ hai mũi vaccine ngừa COVID-19, được điều chỉnh theo Luật Phòng, chống bệnh truyền nhiễm và Điều lệ kiểm dịch Y tế quốc tế...</p>
                    </div> 
                </li>
                <li>
                    <a href="javascript:void(0)"><h4>Danh sách sinh viên tốt nghiệp 2018</h4></a>
                    <div class="div-content">
                        <img src="resources/img/img-content1.png">
                        <p>Trước đó, vào sáng 19/3, tại Trụ sở Chính phủ, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia phòng, chống dịch COVID-19 đã chủ trì cuộc họp về “hộ chiếu vaccine COVID-19”. Theo Bộ trưởng Bộ Y tế Nguyễn Thanh Long, từ góc độ tiếp cận của ngành Y tế, “hộ chiếu vaccine COVID-19” thực chất là giấy chứng nhận đã tiêm chủng đầy đủ hai mũi vaccine ngừa COVID-19, được điều chỉnh theo Luật Phòng, chống bệnh truyền nhiễm và Điều lệ kiểm dịch Y tế quốc tế...</p>
                    </div> 
                </li>
            </ul>
        </div>
    </body>
</html>