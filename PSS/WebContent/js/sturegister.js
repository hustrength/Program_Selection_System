function checkIdrepeat(val, ele) {
    $.ajax({
        url: "servlet/serRegisterStu?action=checkuserid&userid=" + val,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
            if (text === "true") {
				ele.setCustomValidity("该学号可用");
            } else {
				ele.setCustomValidity("该学号已被注册");
			}
            console.log(1);
        }
    })
}

function checkUserid() {
    var v = document.getElementById("userid_signup");
	var val = v.value;
    var ptn = /^[A-Z][0-9]{1,15}$/;
	alert("1");
	console.log(1);
	if (val == null || v.trim().length === 0 || val === "") {
		alert("2");
		console.log(2);
		v.setCustomValidity("该项不可为空");
    } else if (!ptn.exec(val)) {
		v.setCustomValidity("学号格式不正确");
	} else {
		v.setCustomValidity("");
		checkIdrepeat(val, v);
    }
}

function checkPassword() {
	var pass1 = document.getElementById("password_signup");
	var pass2 = document.getElementById("repassword");

	if (pass1.value !== pass2.value)
		pass2.setCustomValidity("两次输入的密码不匹配");
	else
		pass2.setCustomValidity("");
}

function commitForm_signup(r) {
	//未完成
	$.ajax({
        url:"servlet/serDoRegister",
        type:"post",
        async:false,
        data:$('#form_register').serialize(),  
        dataType: "text",
        success:function(text){
        	if(text=="0"){
        		alert('用户名或密码错误');
        	}
        	else {
        		$("#form_register").attr("action","stu/sturegister.jsp");
        	}
            console.log(1);
        }
    })
}

function commitForm_signin(r) {
    $.ajax({
        url: "servlet/serDoLogin?type=stu",
        type: "post",
        async: false,
        data: $('#form_login').serialize(),
        dataType: "text",
        success: function (text) {
            if (text === "0") {
                alert('用户名或密码错误');
            } else {
                $("#form_login").attr("action", "stu/student.jsp");
            }
            console.log(1);
        }
    })
}

function recheckpassword() {

}

function checkusername() {

}

function checksex() {

}

function checkclass() {

}
