<%@ page language="java" import="java.util.*,com.pss.user.Student" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
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
<% Student stu = null;
    if (session.getAttribute("student") == null) {
        stu = new Student("U1", "学生1号", "0", "男", "CS1705", "组1", "组长", 0);
    } else {
        stu = (Student) session.getAttribute("student");
    }
%>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<div>
</div>
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
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">学生选题信息管理系统</a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Doe</strong>
                                <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
                            </div>
                            <div>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem Ipsum has been the industry's standard dummy text ever since the...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>Read All Messages</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-messages -->
            </li>
            <!-- /.dropdown -->
            <!-- /.dropdown -->
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <!-- tab-panel.html 选择课题
                ui-elements.html 个人信息
                table.html 查看可选队伍
                form.html 创建队伍
                index.html 查看已选课题
                 -->
                <li>
                    <a href="main.jsp"><i class="fa fa-bell"></i> 选题通知</a>
                </li>
                <li>
                    <a href="project_info.jsp"><i class="fa fa-desktop"></i> 课题信息</a>
                </li>
                <li>
                    <a href="group_info.jsp"><i class="fa fa-users"></i> 团队信息</a>
                </li>
                <li>
                    <a href="my_project.jsp" class="active-menu"><i class="fa fa-edit"></i> 我的课题</a>
                </li>

                <li>
                    <a href="my_info.jsp"><i class="fa fa-user"></i> 我的信息</a>
                </li>
                <li>
                    <a href="empty.html"><i class="fa fa-file"></i> Empty Page</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <%
                if (true) {
            %>

            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h1>你还未选课题！</h1>
                        <p>请选择加入队伍或创建队伍</p>
                        <hr>
                        <p>
                            <a href="group_info.jsp" class="btn btn-primary btn-lg" role="button" style="margin-right:50px">加入队伍</a>
                            <a href="create_group.jsp" class="btn btn-primary btn-lg" role="button">创建队伍</a>
                        </p>
                    </div>
                </div>
            </div>
            <%
            } else {
            %>

            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        我的课题 <small>巴拉巴拉</small>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            课题信息
                        </div>
                        <div style="margin-left:20px"><h4>课题一</h4></div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">简介</a>
                                </li>
                                <li class=""><a href="#profile" data-toggle="tab">背景</a>
                                </li>
                                <li class=""><a href="#messages" data-toggle="tab">详情</a>
                                </li>
                                <li class=""><a href="#settings" data-toggle="tab">其他要求</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home">
                                    <h4>Home Tab</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <h4>Profile Tab</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="messages">
                                    <h4>Messages Tab</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="settings">
                                    <h4>Settings Tab</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    团队信息
                </div>
                <div class="panel-body">
                	<div class="row" style="margin-left:0px">
                	<div class="col-md-3">
                	<img src="<%=path%>/img/profile.png" style="max-width:80%; max-height:80%">
                	</div>
                	
                    <div class="col-md-5">
                        
                            
                            <div >
                                <h3>队长</h3>
                              
                                <div style="margin-top:10px">
                                    <p><span>姓名：<% %></span></p>
                                        <p><span>班级：<% %></span></p>
                                        <p><span>学号：<% %></span> </p>
                                </div>
                            </div>
                      
                    </div>
                    <div class="col-md-3">
                    <a class="btn btn-primary btn-lg" role="button" style="margin-top:100px; margin-left:30px;">按钮1</a>
                    <a class="btn btn-primary btn-lg" role="button" style="margin-top:100px; margin-left:30px">按钮2</a>
                    </div>
                    </div>
                    <hr>
                    <div class="row" style="margin-left:0px">
                    <div class="col-md-3">
                	<img src="<%=path%>/img/profile.png" style="max-width:80%; max-height:80%">
                	</div>
                	
                    <div class="col-md-5">
                        
                            
                            <div >
                                <h3>队员</h3>
                              
                                <div style="margin-top:10px">
                                    <p><span>姓名：<% %></span></p>
                                        <p><span>班级：<% %></span></p>
                                        <p><span>学号：<% %></span> </p>
                                </div>
                            </div>
                      
                    </div>
                    <div class="col-md-3">
                    <a class="btn btn-primary btn-lg" role="button" style="margin-top:100px; margin-left:30px;">按钮1</a>
                    <a class="btn btn-primary btn-lg" role="button" style="margin-top:100px; margin-left:30px">按钮2</a>
                    </div>
                    </div>
                    <hr>
                    <div class="row" style="margin-left:0px">
                    <div class="col-md-3">
                	<img src="<%=path%>/img/profile.png" style="max-width:80%; max-height:80%">
                	</div>
                	
                    <div class="col-md-5">
                        
                            
                            <div >
                                <h3>队员</h3>
                              
                                <div style="margin-top:10px">
                                    <p><span>姓名：<% %></span></p>
                                        <p><span>班级：<% %></span></p>
                                        <p><span>学号：<% %></span> </p>
                                </div>
                            </div>
                      
                    </div>
                    <div class="col-md-3">
                    <a class="btn btn-primary btn-lg" role="button" style="margin-top:100px; margin-left:30px;">按钮1</a>
                    <a class="btn btn-primary btn-lg" role="button" style="margin-top:100px; margin-left:30px">按钮2</a>
                    </div>
                    </div>
                </div>
            </div>

            <!-- /. ROW  -->
            <%
                }
            %>
            <!-- /. ROW  -->
            <footer><p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank"
                                                                                 href="http://www.freemoban.com/">www.freemoban.com</a>
            </p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>


</body>

</html>