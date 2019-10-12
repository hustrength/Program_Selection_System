var flag1=false,flag2=false,flag3=false;
function checkIdrepeat(val, ele) {
    $.ajax({
        url: "servlet/serRegisterStu?action=checkuserid&userid=" + val,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
            if (text === "true") {
				flag1=true;
            } else {
            	flag1=false;
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

	console.log(1);
	if (val == null || val.trim().length === 0 || val === "") {
		flag1=false;
		console.log(2);
		v.setCustomValidity("该项不可为空");
    } else if (!ptn.exec(val)) {
    	flag1=false;
		v.setCustomValidity("学号格式不正确");
	} else {
		v.setCustomValidity("");
		checkIdrepeat(val, v);
    }
}

function checkPassword() {
	var pass1 = document.getElementById("password_signup");
	var pass2 = document.getElementById("repassword");

	if (pass1.value !== pass2.value){
		flag2=false;
		pass2.setCustomValidity("两次输入的密码不匹配");
	}
		
	else{
		pass2.setCustomValidity("");
		flag2=true;
	}
		
}

function commitForm_signin(r) {
	var status = document.getElementById("status").value;
	$.ajax({
		 url: "servlet/serDoLogin?status="+status,
        type:"post",
        async:false,
        data:$('#form_login').serialize(),  
        dataType: "text",
        success:function(text){
        	if(text=="-1"){
        		alert("未知错误");
        	}
        	if(text=="0"){
        		alert("用户名不存在");
        	}
        	else if(text=="1"){
        		alert('密码错误');
        	}
        	else {
        		
        		$("#form_login").attr("action","stu/stuMain/main.jsp");
        	}
            console.log(1);
        }
    })
}

function commitForm_signup(r) {
	if(flag1==false||flag2==false) return false;
    $.ajax({
    	url: "servlet/serRegisterStu?action=register",
        type: "post",
        async: false,
        data: $('#form_register').serialize(),
        dataType: "text",
        success: function (text) {
           if(text=="success"){
        	   alert("注册成功");
           }
           else{
        	   alert("注册失败");
           }
        }
    })
}


