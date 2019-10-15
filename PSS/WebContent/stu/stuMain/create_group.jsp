<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String stuMainPath = path+"/stu/stuMain/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>建立团队</title>
    <!-- Bootstrap Styles-->
    <link href="<%=path %>/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="<%=path %>/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="<%=path %>/assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
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
<!-- Jquery Js -->
<script type="text/javascript" src="<%=path %>/js/jquery-latest.js"></script>
<!-- CreateGroup Js -->
<script type="text/javascript" src="<%=basePath %>/js/createGroup.js"></script>
<div id="wrapper">
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
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...
                                </div>
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
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...
                                </div>
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
                        <a class="active-menu" href="<%=stuMainPath %>main.jsp"><i class="fa fa-bell"></i> 选题通知</a>
                    </li>
                    <li>
                        <a href="<%=stuMainPath %>project_info.jsp"><i class="fa fa-desktop"></i> 课题信息</a>
                    </li>
                    <li>
                        <a href="<%=stuMainPath %>group_info.jsp"><i class="fa fa-users"></i> 团队信息</a>
                    </li>
                    <li>
                        <a href="<%=stuMainPath %>my_project.jsp"><i class="fa fa-edit"></i> 我的课题</a>
                    </li>

                    <li>
                        <a href="<%=stuMainPath %>my_info.jsp"><i class="fa fa-user"></i> 我的信息</a>
                    </li>
                    <li>
                        <a href="<%=stuMainPath %>empty.html"><i class="fa fa-file"></i> Empty Page</a>
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
                            建立团队 <small>Best form elements.</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                团队信息
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <form role="form" id="form_create" name="form_create" method="post" onsubmit='create_group()'>
                                            <div class="form-group">
                                                <label>团队名称</label>
                                                <input class="form-control" id="Gname" name="Gname" oninput="checkGnamerepeat()">
                                            </div>
                                            <div class="form-group">
                                                <label>选择课题</label>
                                                <select id="PNo" name="PNo" class="form-control">
                                                    
                                                    <%
                                                       Project pro =null;
                   				                       DaoPro listpro = new DaoPro();
                   				                       List<Project> list = listpro.listAllProject();
                   				                       Iterator<Project> it = list.iterator();
                                                       while(it.hasNext()){
                                                       pro=it.next();
                                                    %>
                                                    <option  value="<%=pro.getPNo() %>"><%=pro.getPname() %></option>
                                                   
                                                    <%
                                                       }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                            <label>团队人数</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="Gsnum" id="optionsRadios1" value="1" checked="">1 人
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="Gsnum" id="optionsRadios2" value="2">2 人
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="Gsnum" id="optionsRadios3" value="3">3 人
                                                </label>
                                            </div>
                                        </div>
                                            <hr>
                                            <button type="submit" class="btn btn-primary" >创建</button>
                                           
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <footer><p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank"
                                                                                     href="http://www.freemoban.com/">www.freemoban.com</a>
                </p></footer>
                <!-- /. PAGE INNER  -->
            </div>


            <!-- /. PAGE WRAPPER  -->
        </div>
</body>
</html>
