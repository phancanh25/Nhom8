<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<script src="resources/script.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Giảng viên</title>

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
        <div class="div-add-teacher" id="div-add-teacher">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeAddTeacher();" style="color: white; margin-top: -10px;">&times</a>
            <p>Thêm giảng viên</p>
            <form>
                <input type="text" placeholder="Họ"><br>
                <input type="text" placeholder="Tên"><br>
                <input type="text" placeholder="SĐT"><br>
                <input type="text" placeholder="Địa chỉ"><br>
                <button>Thêm</button>
            </form>
            <div class="div-login-bottom">
                <a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang web trên facebook</a>
            </div>
        </div>
        <div class="div-edit-teacher" id="div-edit-teacher">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeEditTeacher();" style="color: white; margin-top: -10px;">&times</a>
            <p>Chỉnh sửa thông tin giảng viên</p>
            <form>
                <input type="text" placeholder="Họ"><br>
                <input type="text" placeholder="Tên"><br>
                <input type="text" placeholder="SĐT"><br>
                <input type="text" placeholder="Địa chỉ"><br>
                <button>Cập nhật</button>
            </form>
            <div class="div-login-bottom">
                <a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang web trên facebook</a>
            </div>
        </div>
        <div class="div-top">
            <div class="div-top-wrapper">
                <a href="javascript:void(0)">&#9743 0987-654-321</a>
                <a href="javascript:void(0)">&#9993 ptithcm@edu.vn</a>
                
                <a href="javascript:void(0)" onclick="openLogin();" style="visibility: ${user==null?'visible':'hidden'}">Login</a>
                <a href="Home/logout.htm" style="margin: 0px;  border: none; background: none; visibility: ${user!=null?'visible':'hidden'}">Logout</a>
                <a href="javascript:void(0)" style="margin-right: 10px; visibility: ${user!=null?'visible':'hidden'}">Hi ${user}</a>
                <a href="open-account-mng.htm" style="margin-right: 18px;" ${user=='admin'?'':'hidden'}>Quản lý tài khoản</a>
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
        <div class="div-teacher-content">
            <div class="div-teacher-left">
                <div class="div-department">
                    <p>An toàn thông tin</p>
                </div>
                <hr style="border: 1px #3f8eae solid; margin-top: 0">
                <ul class="ul-teacher">
                    <li>
                        <div class="div-teacher-li">
                            <a href="javascript:void(0)" class="teacher-edit" onclick="openEditTeacher();">Sửa</a>
                            <img src="resources/img/user1.png">
                            <div class="div-teacher-info">
                                <ul class="ul-teacher-info">
                                    <li>
                                        <div class="div-patern-info">Họ và tên:</div>
                                        <div class="div-data">Trương Tam Phong</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Mã GV</div>
                                        <div class="div-data">GV123</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">SĐT</div>
                                        <div class="div-data">0987654321</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Địa chỉ</div>
                                        <div class="div-data">97 Man Thiện, phường Hiệp Phú, TP Thủ Đức, TP HCM</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="div-teacher-li">
                            <a href="javascript:void(0)" class="teacher-edit" onclick="openEditTeacher();">Sửa</a>
                            <img src="resources/img/user1.png">
                            <div class="div-teacher-info">
                                <ul class="ul-teacher-info">
                                    <li>
                                        <div class="div-patern-info">Họ và tên:</div>
                                        <div class="div-data">Trương Tam Phong</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Mã GV</div>
                                        <div class="div-data">GV123</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">SĐT</div>
                                        <div class="div-data">0987654321</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Địa chỉ</div>
                                        <div class="div-data">97 Man Thiện, phường Hiệp Phú, TP Thủ Đức, TP HCM</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="div-teacher-li">
                            <a href="javascript:void(0)" class="teacher-edit" onclick="openEditTeacher();">Sửa</a>
                            <img src="resources/img/user1.png">
                            <div class="div-teacher-info">
                                <ul class="ul-teacher-info">
                                    <li>
                                        <div class="div-patern-info">Họ và tên:</div>
                                        <div class="div-data">Trương Tam Phong</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Mã GV</div>
                                        <div class="div-data">GV123</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">SĐT</div>
                                        <div class="div-data">0987654321</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Địa chỉ</div>
                                        <div class="div-data">97 Man Thiện, phường Hiệp Phú, TP Thủ Đức, TP HCM</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="div-teacher-li">
                            <a href="javascript:void(0)" class="teacher-edit" onclick="openEditTeacher();">Sửa</a>
                            <img src="resources/img/user1.png">
                            <div class="div-teacher-info">
                                <ul class="ul-teacher-info">
                                    <li>
                                        <div class="div-patern-info">Họ và tên:</div>
                                        <div class="div-data">Trương Tam Phong</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Mã GV</div>
                                        <div class="div-data">GV123</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">SĐT</div>
                                        <div class="div-data">0987654321</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Địa chỉ</div>
                                        <div class="div-data">97 Man Thiện, phường Hiệp Phú, TP Thủ Đức, TP HCM</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="div-teacher-li">
                            <a href="javascript:void(0)" class="teacher-edit" onclick="openEditTeacher();">Sửa</a>
                            <img src="resources/img/user1.png">
                            <div class="div-teacher-info">
                                <ul class="ul-teacher-info">
                                    <li>
                                        <div class="div-patern-info">Họ và tên:</div>
                                        <div class="div-data">Trương Tam Phong</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Mã GV</div>
                                        <div class="div-data">GV123</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">SĐT</div>
                                        <div class="div-data">0987654321</div>
                                    </li>
                                    <li>
                                        <div class="div-patern-info">Địa chỉ</div>
                                        <div class="div-data">97 Man Thiện, phường Hiệp Phú, TP Thủ Đức, TP HCM</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="div-teacher-right">
                <p class="p-teacher-title">CHUYÊN NGÀNH</p>
                <a href="javascript:void(0)">An toàn thông tin</a>
                <hr>
                <a href="javascript:void(0)">Công nghệ đa phương tiện</a>
                <hr>
                <a href="javascript:void(0)">Công nghệ thông tin</a>
                <hr>
                <a href="javascript:void(0)" onclick="openAddTeacher();" style="text-decoration: underline; text-align: center; margin: 0; margin-top: 50px">Thêm giảng viên</a>
            </div>
        </div>
    </body>
</html>