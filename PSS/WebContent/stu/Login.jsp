<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="UTF-8">
    <title>学生选题信息管理系统</title>
    <link href="css/stulogin.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-latest.js"></script>
	<script type="text/javascript" src="/js/jquery/jquery.form.js"></script>  
	<script type ="text/javascript">
	function commitForm(r){  
	    $.ajax({
	        url:"servlet/serDoLogin?type=stu",
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
			<!-- <div class="login_box">
				<div class="login_logo">
					<img class="login_logo_icon" src="img/Slogo.png" alt=""/>
					<img class="login_logo_text" src="img/StudentSelection.png" alt=""/>
				</div>
				<div class="login_line"></div>
				<div class="login_content">
					<h2>学生选题信息管理系统</h2>
					<p>Student Selection Management System</p>
					<form id="form_login" method='post' onsubmit='commitForm(this)' >
						<div class="login_input">
							<input type="text" placeholder="请输入学号" class="login_username" name="username" required="required"
                			oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
						</div>
		
						<div class="login_input">
							<input type="password" placeholder="请输入密码" class="login_password"  name="password" required="required"
                			oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
						</div>
						
						<div>
							<input id="login_button" class="login_btn sure" type="submit" value="登录"  >
							<input id="register_button" class="login_btn sure" type="button" value="注册" onclick="window.location.href='stu/sturegister.jsp'" >
							<input class="jump_btn cancle" type="button" value="教师入口" onclick="window.location.href='tea/teaLogin.jsp'">
						</div>
					</form>
				</div>
			</div> -->
			<div class="login-wrap">
				<div class="login-html">
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
					<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
					<div class="login-form">
						<div class="sign-in-htm">
							<div> <br> </div>
							<div class="group1">
								<label for="user" class="label1">编号</label>
								<input id="user" type="text" class="input1">
							</div>
							<div> <br> </div>
							<div> <br> </div>
							<div class="group1">
								<label for="pass" class="label1">密码</label>
								<input id="pass" type="password" class="input1" data-type="password">
							</div>
							<div> <br> </div>
							<div class="group1">
								<input id="check" type="checkbox" class="check" checked>
								<label for="check"><span class="icon"></span> 教师登录</label>
							</div>
							<div> <br> </div>
							<div> <br> </div>
							<div class="group1">
								<input type="submit" class="button1" value="登录">
							</div>
						</div>
						<div class="sign-up-htm">	
							<div class="group">
								<label for="user" class="label">学号</label>
								<input id="user" type="text" class="input">
							</div>
							<div class="group">
								<label for="pass" class="label">密码</label>
								<input id="pass" type="password" class="input" data-type="password">
							</div>
							<div class="group">
								<label for="pass" class="label">确认密码</label>
								<input id="pass" type="password" class="input" data-type="password">
							</div>
							<div class="group">
								<label for="pass" class="label">真实姓名</label>
								<input id="pass" type="text" class="input">
							</div>
							<div class="group">
								<label for="pass" class="label">性别</label>
								<select class="input" name="sex" id="sex" required="required" style="height:30px"
                					oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                   					<option class="input_bt" value="" selected>--请选择--</option>
                   				 	<option class="input_bt" value="1">男生</option>
                    				<option class="input_bt" value="2">女生</option>
                				</select>
							</div>
							<div class="group">
								<label for="pass" class="label">班级</label>
								<select class="input" name="classroom" id="classroom" required="required" style="height:30px"
				                		oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
				                    <option class="input_bt" value="" selected>--请选择--</option>
				                    <option class="input_bt" value="1">CS1704</option>
				                    <option class="input_bt" value="2">CS1705</option>
				                    <option class="input_bt" value="3">CS1706</option>
				                </select>
							</div>
							<div> <br> </div>
							<div class="group">
								<input type="submit" class="button" value="注册">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright">版权所有 ©2019-2020 学生选题信息系统 保留所有权利</div>
		</div>
	</body>
</html>