<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- <link rel="stylesheet" type="text/css" href="css.css">
        <link rel="stylesheet" type="text/css" href="student-css.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
        
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="student-css.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>">
    </head>
    <body>
        <div class="div-login" id="div-login">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeLogin();">&times</a>
            <!-- <img src="img/logo-lite.png"> -->
            <img src="<c:url value="/resources/img/logo-lite.png"/>">
            <form>
                <input type="text" placeholder="Tên đăng nhập"><br>
                <input type="password" placeholder="Mật khẩu"><br>
                <button>Đăng nhập</button>
            </form>
            <div class="div-login-bottom">
                <a href="https://www.facebook.com/ptithcm.edu.vn">Đi tới trang web trên facebook</a>
            </div>
        </div>
        <div class="div-add-student" id="div-add-student">
            <a href="javascript:void(0)" class="a-login-quit" onclick="closeAddStudent();" style="color: white; margin-top: -10px;">&times</a>
            <p>Thêm sinh viên</p>
            <form>
                <label>Nam&nbsp&nbsp<input type="radio" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <label>Nữ&nbsp&nbsp<input type="radio" name="phai" style="width: 15px; height: 15px; color: black;"></label> &nbsp&nbsp&nbsp
                <select>
                    <option>An toàn thông tin</option>
                    <option>Công nghệ đa phương tiện</option>
                    <option>Công nghệ thông tin</option>
                </select>
                <input type="text" placeholder="Khóa"><br>
                <input type="text" placeholder="Họ"><br>
                <input type="text" placeholder="Tên"><br>
                <text>Ngày sinh</text>
                <input type="date" placeholder="Ngày sinh" style="width: 64%;">
                <input type="text" placeholder="SĐT"><br>
                <input type="text" placeholder="Địa chỉ"><br>
                <button>Thêm</button>
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
                    <!-- <img src="img/logo.png" class="img-logo"> -->
                    <img src="<c:url value="/resources/img/logo.png"/>" class="img-logo">
                </a>
                <a href="event.htm">DS kỳ bảo vệ</a>
                <a href="student.htm">DSSV</a>
                <a href="teacher.htm">DSGV</a>
                <a href="index.htm">Trang chủ</a>
            </div>
        </div>
        <div class="div-student-content">
          <div class="div-search">
              <input type="text" placeholder="Tên sinh viên">
              <input type="text" placeholder="Lớp">
              <input type="text" placeholder="Khóa">
              <button>Tìm kiếm</button>
              <a href="javascript:void(0)" style="margin-left: 60px;" onclick="openAddStudent();">Thêm sinh viên</a>
          </div>
            <table border="1" class="table table-striped" style="font-size: 13px;">
              <tr style="text-align: center;">
                    <th>#</th>
                    <th>MSSV</th>
                    <th>Họ</th>
                    <th>Tên</th>
                    <th>Lớp</th>
                    <th>Phái</th>
                    <th>Ngày sinh</th>
                    <th>Địa chỉ</th>
                    <th>Khóa</th>
                    <th>Tốt nghiệp</th>
                    <th>Đồ án</th>
              </tr>
              <tr>
                  <td>1</td>
                  <td>N18DCAT001</td>
                  <td>Trương Vô</td>
                  <td>Kỵ</td>
                  <td>D18CQAT01-N</td>
                  <td>Nam</td>
                  <td>01/01/2000</td>
                  <td>97 Man Thiện, phường Hiệp Phú, quận 9, TP HCM</td>
                  <td>2018</td>
                  <td>Chưa TN</td>
                  <td><a href="student-info.htm">Click</a></td>
              </tr>

	              
          
            </table>
        </div>
    </body>
</html>
<!-- <script src="script.js"></script> -->
<script src="<c:url value="/resources/script.js"/>"></script>