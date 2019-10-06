<%@ page language="java" import="java.util.*,com.pss.dao.DaoGPS,com.pss.user.Student,com.pss.user.SedPro" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="UTF-8">
	<title>学生选题信息管理系统-显示已选课题</title>
	<link href="style_1.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
<div class="top">
	<div class="title"><p> 学生选题信息管理系统 </p></div>
</div>
<div class="main">
	<div class="main_left">
		<div class="main_left_class00"><img src=img/touxiang.png></div>
		<div class="main_left_class01"><a href="stu/student.jsp">选课通知</a></div>
		<div class="main_left_class02"><a href="stu/showPro.jsp">课程查询</a></div>
		<div class="main_left_class03"><a href="stu/stuInfo.jsp">学生信息</a></div>
		<div class="main_left_class100">
		<input class="reset" type="button" value="注销" onClick="window.location.href=('/Ten/servlet/serDoLogout')">
		</div>
	</div>
					<%
			    	Student stu = null;
			    	if(session.getAttribute("student")==null){
			    		response.sendRedirect("/PSS/Login.jsp");
			    	}else{
			    		stu = (Student)session.getAttribute("student");%>
	<div class="main_right">
		<div class="info">
			<p>亲爱的<%= stu.getSname() %>同学，下午好</p>
		</div>
		<div class="box">
			<div class="function"><p>[通知]选课系统已开放</p></div>
			<div class="form">
				<table>
  					<tr><td></td></tr>
  					<tr>
  						<td>小组名</td><td>课题编号</td><td>课程名称</td><td>组长</td><td>组员</td><td>组员</td><td>退出小组</td>
  						
  					</tr>
			  		<%
			   			DaoGPS select = new DaoGPS();
			   			Iterator<SedPro> list = select.selectGPS(stu.getSNo());
			   			GPS gps = null;
			   			while(list.hasNext()){
			   				gps = list.next();
			   		%>
  					<tr>
  					<td><%= gps.getPNo() %></td>
  					<td><%= gps.getPNo() %></td>
  					<td><%= gps.getPname() %></td>
  					<td><%= gps.getCcredit() %></td>
  					<td><%= gps.getClassroom() %></td>
  					<td><input class="cancle" type="button" value="取消" onClick="window.location.href=('/PSS/servlet/serDeleteSc?cno=<%= cou.getCNo() %>')"></td>
  					</tr>
		  				<%
		   			}
		   		}
		    %>
  				</table>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>
