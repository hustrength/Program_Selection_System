<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>学生注册</title>
    <link href="css/sturegister.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-latest.js"></script>
	<script type ="text/javascript">
	function commitForm(r){  
	    //未完成
		$.ajax({
	        url:"",
	        type:"post",
	        async:false,
	        data:$('#form_login').serialize(),  
	        dataType: "text",
	        success:function(text){
	       
	        	if(text=="0"){
	        		alert('用户名或密码错误');
	        	}
	        	else {
	        		$("#form_login").attr("action","stu/student.jsp");
	        	}
	            console.log(1);
	        },
	    })
	}  
	</script>
</head>
<body>
<div class="login_bg">

    <div class="register_box">
    	<br>
        <h2>学生注册</h2>
        <form id="form_register" method="post" onsubmit='commitForm(this)'>
            <div>
                <span class="span">学号: </span>
                <input type="text" class="input_bt" name="userid"
                       id="userid" placeholder="请输入学号" required="required"
                       oninvalid="setCustomValidity('该项不可为空')" οninput="setCustomValidity('')">
                <span id="s1"></span>
            </div>
            <div>
                <span class="span">密码:</span>
                <input type="password" class="input_bt" name="password"
                       id="password" placeholder="请输入密码" required="required"
                       oninvalid="setCustomValidity('该项不可为空')" οninput="setCustomValidity('')">
                <span id="s2"></span>
            </div>
            <div>
                <span class="span">确认密码:</span>
                <input type="password" class="input_bt" name="repassword"
                       id="repassword" placeholder="请再次输入密码" required="required"
                       oninvalid="setCustomValidity('该项不可为空')" οninput="setCustomValidity('')">
                <span id="s3"></span>
            </div>
            <div>
                <span class="span">真实姓名: </span>
                <input type="text" class="input_bt" name="username"
                       id="username" placeholder="请输入真实姓名" required="required" 
                       oninvalid="setCustomValidity('该项不可为空')" οninput="setCustomValidity('')">
                <span id="s4"></span>
            </div>
            <div>
                <span class="span">性别:</span>
                <select class="input_bt" name="sex" onchange="checksex()" id="sex" required="required"
                oninvalid="setCustomValidity('该项不可为空')" οninput="setCustomValidity('')">
                    <option class="input_bt" value="" selected>--请选择--</option>
                    <option class="input_bt" value="1">男生</option>
                    <option class="input_bt" value="2">女生</option>
                </select>
                <span id="s5"></span>
            </div>
            <div>
                <span class="span">班级:</span>
                <select class="input_bt" name="sex" onchange="checkclass()" id="sex" required="required"
                oninvalid="setCustomValidity('该项不可为空')" οninput="setCustomValidity('')">
                    <option class="input_bt" value="" selected>--请选择--</option>
                    <option class="input_bt" value="1">CS1704</option>
                    <option class="input_bt" value="2">CS1705</option>
                    <option class="input_bt" value="3">CS1706</option>
                </select>
                <span id="s6"></span>
            </div>
            	<input class="submit_bt sure" type="submit" value="注册">
            	<input class="back_menu sure" type="button" value="返回主菜单">

        </form>
    </div>
    <div class="copyright">版权所有 ©2019-2020 学生选题信息系统 保留所有权利</div>
</div>
</body>
</html>