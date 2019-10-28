<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String teaMainPath = path + "/tea/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>学生选题信息管理系统——教师界面</title>
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
%><!-- 不太行，老师不能登陆了进去发现没有给个新的 -->
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
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="tea_main.jsp">学生选题信息管理系统--教师端</a>
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
                                <strong>张三</strong>
                                <span class="pull-right text-muted">
                                        <em>今天</em>
                                    </span>
                            </div>
                            <div style="display:flex; margin-top:3px">
                                <div style="margin-top:5px">申请加入你的团队</div>
                                <button class="btn btn-info btn-sm" style="margin-left:40px">同意</button>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>李四</strong>
                                <span class="pull-right text-muted">
                                        <em>今天</em>
                                    </span>
                            </div>
                            <div style="display:flex; margin-top:3px">
                                <div style="margin-top:5px">申请加入你的团队</div>
                                <button class="btn btn-info btn-sm" style="margin-left:40px">同意</button>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>王五</strong>
                                <span class="pull-right text-muted">
                                        <em>今天</em>
                                    </span>
                            </div>
                            <div style="display:flex; margin-top:3px">
                                <div style="margin-top:5px">申请加入你的团队</div>
                                <button class="btn btn-info btn-sm" style="margin-left:40px">同意</button>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>读取全部消息</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-messages -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <!-- 要改成teaMainPath,这个怎么办！ -->
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=teaMainPath %>tea_info.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>stu/Login.jsp"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
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
                <li>
                    <a class="active-menu" href="<%=teaMainPath %>tea_main.jsp"><i class="fa fa-sitemap"></i> 选题通知<span class="fa arrow"></a>
                    <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=teaMainPath %>tea_main_news.jsp">修改公告</a><!--连接到修改公告jsp  -->
                            </li>
                        </ul>
                </li>
                <!--二级页面  
                <li>
                        <a href="#"><i class="fa fa-sitemap"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>

                                </ul>

                            </li>
                        </ul>
                    </li>-->
                <li>
                    <a href="<%=teaMainPath %>project_info_tea.jsp"><i class="fa fa-desktop"></i> 课题信息</a>
                </li>
                <li>
                    <a href="<%=teaMainPath %>group_info.jsp"><i class="fa fa-users"></i> 学生组队信息</a>
                </li>
                <li>
                    <a href="<%=teaMainPath %>tea_info.jsp"><i class="fa fa-user"></i> 教师个人信息</a>
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
                        关于本学期软件工程选题相关事宜安排的通知 <small>巴拉巴拉</small>
                    </h1>
                </div>
            </div>
           
            <!-- /. 这里需要获取文本输入框的接口  -->
            <footer><p>版权所有 ©2019-2020 学生选题信息系统 保留所有权利</p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
</body>
</html>