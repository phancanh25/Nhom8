<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<script src="resources/script.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css.css">
        <link rel="stylesheet" type="text/css" href="resources/subcommittee.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Quản lý tiểu ban</title>

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
        <div class="div-subcommittee">
            <p style="color: #6692e3; font-weight: bold; margin-left: 50px">Quản lý tiểu ban <code>Riêng trang này bấm thêm hoặc cập nhật sẽ reload lại page và tải lại danh sách tiểu ban</code></p>
            <a href="javascript:void(0)" style="margin-left: 50px" onclick="showAddSubcommittee();">Thêm tiểu ban</a>
            <ul class="ul-subcommittee">
                <h6 style="color: blue; font-weight: bold; margin-top: 20px;">An toàn thông tin</h6>
                <li>
                    <!-- id ở đây là khóa của bảng tiểu ban -->
                    <a href="javascript:void(0)" onclick="showSubcommittee(this.id);" id="name-subcommittee1">Tiểu ban 1</a> 
                    <a href="javascript:void(0)" onclick="showEditSubcommittee(this.id);" id="edit-subcommittee1">Sửa</a>
                    <a href="javascript:void(0)" onclick="showDeleteSubcommittee(this.id);" id="delete-subcommittee1">Xóa</a>
                </li>
                <li>
                    <!-- id ở đây là khóa của bảng tiểu ban -->
                    <a href="javascript:void(0)" onclick="showSubcommittee(this.id);" id="name-subcommittee2">Tiểu ban 2</a> 
                    <a href="javascript:void(0)" onclick="showEditSubcommittee(this.id);" id="edit-subcommittee2">Sửa</a>
                    <a href="javascript:void(0)" onclick="showDeleteSubcommittee(this.id);" id="delete-subcommittee2">Xóa</a>
                </li>
                <h6 style="color: blue; font-weight: bold;  margin-top: 30px;">Công nghệ thông tin</h6>
                <li>
                    <!-- id ở đây là khóa của bảng tiểu ban -->
                    <a href="javascript:void(0)" onclick="showSubcommittee(this.id);" id="name-subcommittee3">Tiểu ban 3</a> 
                    <a href="javascript:void(0)" onclick="showEditSubcommittee(this.id);" id="edit-subcommittee3">Sửa</a>
                    <a href="javascript:void(0)" onclick="showDeleteSubcommittee(this.id);" id="delete-subcommittee3">Xóa</a>
                </li>
                <h6 style="color: blue; font-weight: bold; margin-top: 30px;">Công nghệ đa phương tiện</h6>
            </ul>
        </div>
        <div class="div-subcommittee-show">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this);">&times</a>
            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Tiểu ban 1</p>
            <div class="div-subcommittee-wrapper">
                <table class="table table-striped table-bordered table-subcommittee">
                    <tr>
                        <th>Mã GV</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Sđt</th>
                        <th>Địa chỉ</th>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                    </tr>
                </table>
            </div>
            <button onclick="hideSubcommitte();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">OK</button>    
        </div>
        <div class="div-subcommittee-edit">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this);">&times</a>
            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Sửa Tiểu ban 1</p>
            <div class="div-subcommittee-wrapper">
                <table class="table table-striped table-bordered table-subcommittee">
                    <tr>
                        <th>Mã GV</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Sđt</th>
                        <th>Địa chỉ</th>
                        <th>Chọn</th>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox" checked></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox" checked></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox" checked></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>

                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                    
                </table>
            </div>
            <button onclick="location.reload();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Cập nhật</button>    
        </div>
        <div class="div-subcommittee-delete">
            <p style="text-align: center; color:teal; font-weight: bold;">Bạn có chắc chắn muốn xóa tiểu ban 1</p>
            <button style="position: absolute; left:80px;" class="btn btn-success" >Đồng ý</button>
            <button style="position: absolute; right:80px;" class="btn btn-danger" onclick="hideDeleteCommittee();">Hủy</button>
        </div>
        <div class="div-subcommittee-add">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeDiv(this);">&times</a>
            <p style="margin-top: 10px; margin-left: 50px; color: #6692e3; font-weight: bold;">Thêm tiểu ban</p>
            <input type="text" placeholder="Tên tiểu ban" class="form-control" style="width: 200px; margin-left: 50px; display: inline;">
            <select class="form-control" style="width: 300px; margin-left: 50px; display: inline;">
                <option>An toàn thông tin</option>
                <option>Công nghệ thông tin</option>
                <option>Công nghệ đa phương tiện</option>
            </select>
            <div class="div-subcommittee-wrapper">
                <table class="table table-striped table-bordered table-subcommittee">
                    <tr>
                        <th>Mã GV</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Sđt</th>
                        <th>Địa chỉ</th>
                        <th>Chọn</th>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>

                    <tr>
                        <td>GV1</td>
                        <td>Thầy giáo</td>
                        <td>ba</td>
                        <td>0987654321</td>
                        <td>P.Hiệp Phú, Q9, TP HCM</td>
                        <td><input type="checkbox"></td>
                    </tr>
                </table>
            </div>
            <button onclick="location.reload();" class="finish-btn btn btn-success" id="btn-success" style="margin-top: 10px; position: relative; left: 50%; transform: translate(-50%,0);">Thêm tiểu ban</button>    
        </div>
    </body>
</html>