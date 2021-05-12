function openLogin(){
    document.getElementById("div-login").style.visibility = "visible";
    document.getElementById("div-login").className = "div-login fadeInDown";
}

function closeLogin(){
    document.getElementById("div-login").className = "div-login fadeOutDown";
}

function openAddTeacher(){
    document.getElementById("div-add-teacher").style.visibility = "visible";
    document.getElementById("div-add-teacher").className = "div-add-teacher fadeInDown";
}

function closeAddTeacher(){
    document.getElementById("div-add-teacher").className = "div-add-teacher fadeOutDown";
}

function openEditTeacher(){
    document.getElementById("div-edit-teacher").style.visibility = "visible";
    document.getElementById("div-edit-teacher").className = "div-edit-teacher fadeInDown";
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
        document.getElementsByClassName("select-teacher")[i].disabled = !list[i].checked;
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
    document.getElementById("show"+id).classList.remove("fadeOut");
	document.getElementById("show"+id).style.display = "block";
	document.getElementById("show"+id).classList.add("fadeIn");
}
function hideSubcommitte(){
    document.getElementsByClassName("div-subcommittee-show")[0].classList.remove("fadeIn");
    document.getElementsByClassName("div-subcommittee-show")[0].classList.add("fadeOut");
    setTimeout(function(){
        document.getElementsByClassName("div-subcommittee-show")[0].style.display = "none";
    }, 500)   
}

function showEditSubcommittee(id){
    document.getElementById("edit"+id).classList.remove("fadeOut");
	document.getElementById("edit"+id).style.display = "block";
	document.getElementById("edit"+id).classList.add("fadeIn");
}


function showDeleteSubcommittee(id){
    document.getElementById("delete"+id).classList.remove("fadeOut");
    document.getElementById("delete"+id).style.display = "block";
  	document.getElementById("delete"+id).classList.add("fadeInDown");
}
function hideDeleteCommittee(id){
    document.getElementById("delete"+id).classList.remove("fadeInDown");
    document.getElementById("delete"+id).classList.add("fadeOut");
    setTimeout(function(){
       document.getElementById("delete"+id).style.display = "none";
    }, 500)   
}

function showAddSubcommittee(){
    document.getElementsByClassName("div-subcommittee-add")[0].style.display = "block";
    document.getElementsByClassName("div-subcommittee-add")[0].className = "div-subcommittee-add fadeIn";
}

function closeDiv(atag, id){
    temp = atag.parentNode.className;
    document.getElementById(id).className = temp + " fadeOut";
    setTimeout(function(){
        document.getElementById(id).style.display = "none";
    }, 500)   
}