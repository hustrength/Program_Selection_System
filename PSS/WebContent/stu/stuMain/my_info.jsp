<%@ page language="java" import="java.util.*,com.pss.user.Student" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Dream</title>
    <!-- Bootstrap Styles-->
    <link href="<%=path %>/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="<%=path %>/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="<%=path %>/assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link href="<%=path %>/assets/css/main.css" rel="stylesheet"/>
</head>
<body>
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="<%=path %>/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="<%=path %>/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="<%=path %>/assets/js/jquery.metisMenu.js"></script>
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
                    <a href="my_project.jsp"><i class="fa fa-edit"></i> 我的课题</a>
                </li>

                <li>
                    <a href="my_info.jsp" class="active-menu"><i class="fa fa-user"></i> 我的信息</a>
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
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        UI Elements <small>This is your UI elements section</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
                <div class="col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            个人信息
                        </div>
                        <div class="panel-body">
                            <div class="alert alert-success">
                                <div style="width:60px; align:right"><strong>学号：</strong>U1</div>
                            </div>
                            <div class="alert alert-info">
                                <strong>姓名：</strong> 小呆呆
                            </div>
                            <div class="alert alert-warning">
                                <strong>性别：</strong> 男
                            </div>
                            <div class="alert alert-danger">
                                <strong>班级：</strong> CS1705
                            </div>
                            <div class="alert alert-success">
                                <strong>所属团队：</strong> Group1
                            </div>
                            <div class="alert alert-info">
                                <strong>团队职位：</strong> 队长
                            </div>
                            <div class="alert alert-warning">
                                <strong>课题得分：</strong> 100
                            </div>
                            <!-- <div class="alert alert-danger">
                                <strong>班级</strong> Change a few things up and try submitting again.
                            </div> -->
                        </div>
                    </div>
                </div>
				<div class="col-md-4 col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            用户头像
                        </div>
						<img src="<%=path%>/img/profile.png" style="max-width:80%; max-height:80%; margin-left:25px">
                        <div class="panel-footer">
                             
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">

                    <!--  Modals-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            登录密码修改
                        </div>
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:20px">
                            <label>请输入初始密码</label>
                            <input class="form-control" type="password">
                        </div>
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:20px">
                            <label>请输入新密码</label>
                            <input class="form-control" type="password">
                        </div>
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:20px">
                            <label>请再次输入新密码</label>
                            <input class="form-control" type="password">
                        </div>
                        <div class="panel-body">
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                点击修改
                            </button>
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                &times;
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title Here</h4>
                                        </div>
                                        <div class="modal-body">
                                            确认更改？
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary">更改</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Modals-->

                </div>
            </div>
            <!-- /. ROW  -->
            <footer><p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank"
                                                                                 href="http://www.freemoban.com/">www.freemoban.com</a>
            </p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->

</body>
</html>
