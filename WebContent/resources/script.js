function openLogin(){
    document.getElementById("div-login").style.visibility = "visible";
    document.getElementById("div-login").className = "div-login fadeInDown";
}

function closeLogin(){
    document.getElementById("div-login").className = "div-login fadeOutDown";
}

function openProfile(){
	document.getElementById("div-profile").style.visibility = "visible";
    document.getElementById("div-profile").className = "div-profile fadeInDown";
}
function closeProfile(){
	document.getElementById("div-profile").className = "div-profile fadeOutDown";
}

function editAddress(diaChi){
	document.getElementById("p-address").hidden = true;
	document.getElementById("input-address").hidden = false;
	document.getElementById("input-address").value = diaChi;
	document.getElementById("input-address").focus();
}
function editPhone(phone){
	document.getElementById("p-phone").hidden = true;
	document.getElementById("input-phone").hidden = false;
	document.getElementById("input-phone").value = phone;
	document.getElementById("input-phone").focus();
}

function openForgotPass(){
	document.getElementById("div-login-form").classList.remove("rightIn");
	document.getElementById("div-login-form").classList.add("leftIn");
	document.getElementById("div-forgot-form").classList.remove("rightIn");
	document.getElementById("div-forgot-form").classList.add("leftIn");
}

function closeForgotPass(){
	document.getElementById("div-login-form").classList.remove("leftIn");
	document.getElementById("div-login-form").classList.add("rightIn");
	document.getElementById("div-forgot-form").classList.remove("leftIn");
	document.getElementById("div-forgot-form").classList.add("rightIn");
}

function openAddTeacher(){
    document.getElementById("div-add-teacher").style.visibility = "visible";
    document.getElementById("div-add-teacher").className = "div-add-teacher fadeInDown";
}

function closeAddTeacher(){
    document.getElementById("div-add-teacher").className = "div-add-teacher fadeOutDown";
}

function openEditTeacher(maGV, ho, ten, phai, sDT, diaChi){
	document.getElementById("input-edit-maGV").value = maGV;
	document.getElementById("input-edit-ho").value = ho;
	document.getElementById("input-edit-ten").value = ten;
	document.getElementById("input-edit-sDT").value = sDT;
	document.getElementById("input-edit-diaChi").value = diaChi;
    document.getElementById("div-edit-teacher").style.visibility = "visible";
    document.getElementById("div-edit-teacher").className = "div-edit-teacher fadeInDown";
}

function openDeleteTeacherConfirm(maGV){
	document.getElementById("form-delete-teacher-confirm").action = "teacher/teacher/"+maGV+".htm?ldel";
 	document.getElementById("div-delete-teacher-confirm").classList.remove("fadeOutDown");
 	document.getElementById("div-delete-teacher-confirm").classList.add("fadeInDown");
 }
   function closeDeleteTeacherConfirm(){
 	document.getElementById("div-delete-teacher-confirm").classList.remove("fadeInDown");
 	document.getElementById("div-delete-teacher-confirm").classList.add("fadeOutDown");
 }

function yesNo(){
	confirm("Xac nhan Delete");
}

function closeEditTeacher(){
    document.getElementById("div-edit-teacher").className = "div-edit-teacher fadeOutDown";
}

function openAddStudent(){
    document.getElementById("div-add-student").style.visibility = "visible";
    document.getElementById("div-add-student").className = "div-add-student fadeInDown";
}

function closeAddStudent(){
    document.getElementById("div-add-student").className = "div-add-student fadeOutDown";
}

function openDeleteStudentConfirm(maSV){
	document.getElementById("form-delete-student-confirm").action = "student/student/"+maSV+".htm?ldel";
 	document.getElementById("div-delete-student-confirm").classList.remove("fadeOutDown");
 	document.getElementById("div-delete-student-confirm").classList.add("fadeInDown");
 }
   function closeDeleteStudentConfirm(){
 	document.getElementById("div-delete-student-confirm").classList.remove("fadeInDown");
 	document.getElementById("div-delete-student-confirm").classList.add("fadeOutDown");
 }

//${sinhVien.getMaSV()}','${sinhVien.getHo()}','${sinhVien.getTen()}','${sinhVien.getLop()}',${sinhVien.isPhai()},'${sinhVien.getDiaChi()}','${sinhVien.getKhoa()}',${sinhVien.getDiemTBTL()}
function openEditStudent(maSV, ho, ten, lop, ngaySinh, phai, diaChi, khoa, diemTBTL){
	if(phai=='true') document.getElementById("input-edit-female").checked= true;
	else document.getElementById("input-edit-male").checked= true;
	document.getElementById("input-edit-maSV").value = maSV;
	document.getElementById("input-edit-ho").value = ho;
	document.getElementById("input-edit-ten").value = ten;
	document.getElementById("input-edit-lop").value = lop;
	document.getElementById("input-edit-ngaySinh").value = ngaySinh;
	document.getElementById("input-edit-diaChi").value = diaChi;
	document.getElementById("input-edit-khoa").value = khoa;
	document.getElementById("input-edit-diemTBTL").value = diemTBTL;
    document.getElementById("div-edit-student").style.visibility = "visible";
    document.getElementById("div-edit-student").className = "div-edit-student fadeInDown";
}

function closeEditStudent(){
    document.getElementById("div-edit-student").className = "div-edit-student fadeOutDown";
}


function openTeacherInEvent(){
    document.getElementById("div-teacher-in-event").style.visibility = "visible";
    document.getElementById("div-teacher-in-event").className = "div-teacher-in-event fadeInDown";
}
function closeTeacherInEvent(){
    document.getElementById("div-teacher-in-event").className = "div-teacher-in-event fadeOutDown";
}

function openStudentInEvent(){
    document.getElementById("div-student-in-event").style.visibility = "visible";
    document.getElementById("div-student-in-event").className = "div-student-in-event fadeInDown";
}

function closeStudentInEvent(){
    document.getElementById("div-student-in-event").className = "div-student-in-event fadeOutDown";
}

function prevPageAddEvent(){
    var marginTop = window.getComputedStyle(document.getElementById("div-event-add-wrapper")).getPropertyValue("margin-top");
    marginTop = marginTop.substring(0, marginTop.length-2);
    if(parseInt(marginTop) < 0) document.getElementById("div-event-add-wrapper").style.marginTop = (parseInt(marginTop) + 646) + "px";
    document.getElementById("btn-success").disabled = true;
}

function nextPageAddEvent(){
    var marginTop = window.getComputedStyle(document.getElementById("div-event-add-wrapper")).getPropertyValue("margin-top");
    marginTop = marginTop.substring(0, marginTop.length-2);
    if(parseInt(marginTop) >= -1292) document.getElementById("div-event-add-wrapper").style.marginTop = (parseInt(marginTop) - 646) + "px";
    if(parseInt(marginTop)<=-1292){
        document.getElementById("btn-success").disabled = false;
    }
}

function check(){
    var list = document.getElementsByClassName("student-check");
    for(i = 0; i<list.length; i++){
        if(list[i].checked){
        	document.getElementsByClassName("student-choose")[i].value = "choose";
        }
        else{
        	document.getElementsByClassName("student-choose")[i].value = "";
        }
    }
}

function expandAssignmentRoadmap(){
    check = document.getElementsByClassName("div-assignment-roadmap")[0].style.display;
    if(check == "block"){
        document.getElementsByClassName("div-assignment-roadmap")[0].style.display = "none";
    }
    else{
        document.getElementsByClassName("div-assignment-roadmap")[0].style.display = "block";
    }
}

function showSubcommittee(id){
	id = "show"+id;
	document.getElementById(id).classList.remove("fadeOut");
	document.getElementById(id).style.display = "block";
	document.getElementById(id).classList.add("fadeIn");
}
function hideSubcommitte(id){
	document.getElementById(id).classList.remove("fadeIn");
    document.getElementById(id).classList.add("fadeOut");
    setTimeout(function(){
        document.getElementById(id).style.display = "none";
    }, 500)   
}

function showEditSubcommittee(id){
    document.getElementsByClassName("div-subcommittee-edit")[0].classList.remove("fadeOut");
    document.getElementsByClassName("div-subcommittee-edit")[0].style.display = "block";
    document.getElementsByClassName("div-subcommittee-edit")[0].classList.add("fadeIn");
}


function showDeleteSubcommittee(id){
    document.getElementsByClassName("div-subcommittee-delete")[0].classList.remove("fadeOut");
    document.getElementsByClassName("div-subcommittee-delete")[0].style.display = "block";
    document.getElementsByClassName("div-subcommittee-delete")[0].classList.add("fadeInDown");
}
function hideDeleteCommittee(){
    document.getElementsByClassName("div-subcommittee-delete")[0].classList.remove("fadeInDown");
    document.getElementsByClassName("div-subcommittee-delete")[0].classList.add("fadeOut");
    setTimeout(function(){
        document.getElementsByClassName("div-subcommittee-delete")[0].style.display = "none";
    }, 500)   
}

function showAddSubcommittee(){
    document.getElementsByClassName("div-subcommittee-add")[0].style.display = "block";
    document.getElementsByClassName("div-subcommittee-add")[0].className = "div-subcommittee-add fadeIn";
}

function closeDiv(atag){
    temp = atag.parentNode.className;
    document.getElementsByClassName(temp)[0].className = temp + " fadeOut";
    setTimeout(function(){
        document.getElementsByClassName(temp)[0].style.display = "none";
    }, 500)   
}

function openAccountAdd(){
	document.getElementById("div-account-add").classList.remove("fadeOutUp2");
    document.getElementById("div-account-add").style.display = "block";
    document.getElementById("div-account-add").classList.add("fadeInDown2");
}
function closeAccountAdd(){
	document.getElementById("div-account-add").classList.remove("fadeInDown2");
    document.getElementById("div-account-add").classList.add("fadeOutUp2");
}

function changeAccountType(){
 	type= document.getElementById("select-account-type").value;
	if(type=="gv"){
		document.getElementById("input-account-type").placeholder = "Mã giảng viên";
	}
	else{
		document.getElementById("input-account-type").placeholder = "Mã sinh viên";
	}
}

function openDeleteAccountConfirm(type,username){
	document.getElementById("input-delete-account-confirm-type").value = type;
	document.getElementById("input-delete-account-confirm-username").value = username;
 	document.getElementById("div-delete-account-confirm").classList.remove("fadeOutDown");
 	document.getElementById("div-delete-account-confirm").classList.add("fadeInDown");
}
function closeDeleteAccountConfirm(){
 	document.getElementById("div-delete-account-confirm").classList.remove("fadeInDown");
 	document.getElementById("div-delete-account-confirm").classList.add("fadeOutDown");
}

//Lock chuc nang trong phan cong do an
function setLock(button, number){
	for(i = 0; i < 8; i++){
			if(i==number-1) continue;
			document.getElementsByClassName("btn-lock")[i].classList.remove("btn-success");
			document.getElementsByClassName("btn-lock")[i].classList.add("btn-danger");
			document.getElementsByClassName("btn-lock")[i].value = "1";
			document.getElementById("input-action").value = 0;
			document.getElementsByClassName("btn-lock")[i].innerHTML = "Khóa 🔒";
	}
	if(button.value == "1"){
			document.getElementsByClassName("btn-lock")[number-1].classList.remove("btn-danger");
			document.getElementsByClassName("btn-lock")[number-1].classList.add("btn-success");
			document.getElementsByClassName("btn-lock")[number-1].value = "0";
			document.getElementsByClassName("btn-lock")[number-1].innerHTML = "Mở 🔓";
			document.getElementById("input-action").value = number;
	}
	else{
			document.getElementsByClassName("btn-lock")[number-1].classList.remove("btn-success");
			document.getElementsByClassName("btn-lock")[number-1].classList.add("btn-danger");
			document.getElementsByClassName("btn-lock")[number-1].value = "1";
			document.getElementsByClassName("btn-lock")[number-1].innerHTML = "Khóa 🔒";
			document.getElementById("input-action").value = 0;
	}
	document.getElementById("btn-confirm").disabled = false;
}

/*Cong bo ket qua bao ve do an nam xxxx*/
//Kiem tra xem co the cong bo duoc chua (dieu kien: toan bo chuc nang phai duoc khoa)
function checkOpenRelease(){
	var finished = document.getElementById("input-event-finish").checked;
	if(finished == false){
		document.getElementById("p-message").innerHTML = "Kỳ bảo vệ cần được hoàn thành trước khi công bố kết quả!";
		document.getElementById("p-message").style.color = "red";
		document.getElementById("p-message").hidden = false;
	}
	else{
		document.getElementById("p-message").hidden = true;
		openRelease();
	}
}

function openRelease(){
	document.getElementById("div-release").classList.remove("fadeOutDown");
	document.getElementById("div-release").classList.add("fadeInDown");
}
function closeRelease(){
	document.getElementById("div-release").classList.remove("fadeInDown");
	document.getElementById("div-release").classList.add("fadeOutDown");
}

function showReleaseImg(event) {
	var type = event.target.files[0].type;
	if(type != 'image/png' && type!= 'image/jpeg'){
		document.getElementById("p-img-error").hidden = false;
		document.getElementById("btn-confirm-release-event").disabled = true;
		return;
	}
	else{
		document.getElementById("p-img-error").hidden = true;
	}
    var output = document.getElementById('img-release');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
    document.getElementById("btn-confirm-release-event").disabled = false;
 }
 
 function openImgEventRelease(){
 	document.getElementById("div-img-event-release").classList.remove("fadeOutDown");
 	document.getElementById("div-img-event-release").classList.add("fadeInDown");
 }
  function closeImgEventRelease(){
 	document.getElementById("div-img-event-release").classList.remove("fadeInDown");
 	document.getElementById("div-img-event-release").classList.add("fadeOutDown");
 }
 
 function openCancelRelease(){
 	document.getElementById("div-cancel-release").classList.remove("fadeOutDown");
 	document.getElementById("div-cancel-release").classList.add("fadeInDown");
 }
   function closeCancelRelease(){
 	document.getElementById("div-cancel-release").classList.remove("fadeInDown");
 	document.getElementById("div-cancel-release").classList.add("fadeOutDown");
 }
  