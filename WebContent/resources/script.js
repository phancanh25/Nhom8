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
        document.getElementsByClassName("project-name")[i].disabled = !list[i].checked;
        document.getElementsByClassName("project-detail")[i].disabled = !list[i].checked;
    }
}