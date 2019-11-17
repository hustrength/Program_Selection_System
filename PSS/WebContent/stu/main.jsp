<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String stuMainPath = path + "/stu/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>学生选题信息管理系统——学生界面</title>
    <!-- Bootstrap Styles-->
    <link href="<%=path %>/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="<%=path %>/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="<%=path %>/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="<%=path %>/assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href="style_1.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="<%=path%>/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="<%=path %>/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="<%=path %>/assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="<%=path %>/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="<%=path %>/assets/js/morris/morris.js"></script>
<!-- Custom Js -->
<script src="<%=path %>/assets/js/custom-scripts.js"></script>
<script type="text/javascript" src="<%=path %>/js/msg.js"></script>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">学生选题信息管理系统</a>
        </div>
        <div id="msg">
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <%

                   Student stu=null;
                   stu = (Student) session.getAttribute("student");
                   if(stu==null){
                	   response.sendRedirect(basePath+"stu/Login.jsp");
                   }
                   String leader_sno=stu.getSNo();
                   if("组长".equals(stu.getSposition())){
                   String applicant=null;
                   Apply apply = null;
                   DaoApply list_all_apply = new DaoApply();
                   List<Apply> list_apply = list_all_apply.listApplybyGname(stu.getSgroup());
                   Iterator<Apply> it_apply = list_apply.iterator();
                   
                   while (it_apply.hasNext()) {
                       apply = it_apply.next();
                       int status = apply.getStatus();
                       if (status== 0) {
                    	   applicant=apply.getApplicant().getSNo();
                   %>

                    <li style="margin:3px 0px 0px 15px">
                        
                            <div>
                                <strong><%=apply.getApplicant().getSname() %>
                                </strong>
                                <span class="pull-right text-muted">
                                        <em></em>
                                    </span>
                            </div>
                            <div style="display:flex;">
                                <div style="margin-top:5px">申请加入你的团队</div>
                               	<input type="button" value="同意" class="btn btn-info btn-sm" style="margin-left:20px"
                                   onclick="agree('<%=applicant%>')">
                            	<input type="button" value="拒绝" class="btn btn-danger btn-sm" style="margin-left:10px"
                                   onclick="refuse('<%=applicant%>')">
                            </div>
                       
                    </li>
                    <li class="divider"></li>
                    <%
                            }
                        }
                   }
                %>
                </ul>
                <!-- /.dropdown-messages -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=stuMainPath %>my_info.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>stu/Login.jsp"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        </div>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a class="active-menu" href="<%=stuMainPath %>main.jsp"><i class="fa fa-bell"></i> 选题通知</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>project_info.jsp"><i class="fa fa-desktop"></i> 课题信息</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>all_group.jsp"><i class="fa fa-users"></i> 所有团队</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>project_group.jsp"><i class="fa fa-edit"></i> 课题与团队</a>
                </li>

                <li>
                    <a href="<%=stuMainPath %>my_info.jsp"><i class="fa fa-user"></i> 我的信息</a>
                </li>
                
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        关于本学期软件工程选题相关事宜安排的通知 <small></small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                    <%
                      Notification noti=null;
                      DaoNoti daonoti = new DaoNoti();
                      noti=daonoti.query();
                      String cont=noti.getContent();
                      cont=cont.replace("\r\n", "<br/>");
                      String title=noti.getTitle();
                      title=title.replace("\r\n","");
                    %>
                        <div class="panel-heading">
                            <div class="function" style="font-size:20px;
                                font-weight:700;padding:0px 10px 0px 10px;margin-bottom:-10px;margin-top:5px"><p><%=title %></p></div>
                        </div>
                        <div class="box">
                            <div class="info" style="padding:0px 10px 0px 10px;margin-left:15px;margin-right:10px;width:97.3%;">
                                <p>亲爱的<%=stu.getSname() %>同学，你好！</p>
                            </div>
                            <div class="form" style="font-size:16px;padding:10px 0px 0px 10px;margin-left:15px;margin-right:10px;width:97.3%;height:400px">
                                    <%=cont %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /. ROW  -->
            <footer><p>版权所有 ©2019-2020 学生选题信息系统 保留所有权利</p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
</body>
</html>