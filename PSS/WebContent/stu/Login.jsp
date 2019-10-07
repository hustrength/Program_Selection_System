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
	
<script type="text/javascript" src="../jquery-latest.js"></script>
<script type ="text/javascript">
function commitForm(r){  
    
    if(r.username.value==""){
    	alert('请输入用户名');
    	return false;
    }
    if(r.password.value==""){
    	alert('请输入密码');
    	return false;
    }
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
<script type="text/javascript" src="/js/jquery/jquery.form.js"></script>   

  </head>
  <body>
  <div class="login_bg">
			<div class="login_box">
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
							<input type="text" placeholder="请输入学号" class="login_username" name="username">
						</div>
		
						<div class="login_input">
							<input type="password" placeholder="请输入密码" class="login_password"  name="password">
						</div>
						
						<div>
							<input id="login_button" class="login_btn sure" type="submit" value="登录"  >
							<input id="register_button" class="login_btn sure" type="button" value="注册" onclick="window.location.href='stu/sturegister.jsp'" >
							<input class="jump_btn cancle" type="button" value="教师入口 " onclick="window.location.href='tea/teaLogin.jsp'">
						</div>
					</form>
				</div>
			</div>
			<div class="copyright">版权所有 ©2019-2020 学生选题信息系统 保留所有权利</div>
		</div>
	</body>
</html>