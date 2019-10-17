<%@ page language="java" import="java.util.*,com.pss.user.Student,com.pss.user.GPS" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String stuMainPath = path + "/stu/stuMain/";
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
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=stuMainPath %>my_info.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>stu/Login.jsp"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="<%=stuMainPath %>main.jsp"><i class="fa fa-bell"></i> 选题通知</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>project_info.jsp"><i class="fa fa-desktop"></i> 课题信息</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>group_info.jsp"><i class="fa fa-users"></i> 团队信息</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>my_project.jsp" class="active-menu"><i class="fa fa-edit"></i> 我的课题</a>
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
            <%
                if (stu.getSgroup() == null) {
            %>
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h1>你还未选课题！</h1>
                        <p>请选择加入队伍或创建队伍</p>
                        <hr>
                        <p>
                            <a href="group_info.jsp" class="btn btn-primary btn-lg" role="button"
                               style="margin-right:50px">加入队伍</a>
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
                        <div style="margin-left:20px"><h4>数独</h4></div>
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
                                    <h4>标题</h4>
                                    <p>数独（shù dú）是源自18世纪瑞士的一种数学游戏。是一种运用纸、笔进行演算的逻辑游戏。
                                        玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
                                        并满足每一行、每一列、每一个粗线宫（3*3）内的数字均含1-9，不重复</p>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <h4>标题</h4>
                                    <p>。。。</p>
                                </div>
                                <div class="tab-pane fade" id="messages">
                                    <h4>标题</h4>
                                    <p>。。。</p>
                                </div>
                                <div class="tab-pane fade" id="settings">
                                    <h4>标题</h4>
                                    <p>。。。</p>
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
                            <div>
                                <h3>队长</h3>
                                <div style="margin-top:10px">
                                    <p><span>姓名：<% %></span></p>
                                    <p><span>班级：<% %></span></p>
                                    <p><span>学号：<% %></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:100px;" data-toggle="modal"
                                        data-target="#dismiss">解散团队
                                </button>
                                <div class="modal fade" id="dismiss" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="tips">提示</h4>
                                            </div>
                                            <div class="modal-body">
                                                确认解散？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <button type="button" class="btn btn-primary">确认</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row" style="margin-left:0px">
                        <div class="col-md-3">
                            <img src="<%=path%>/img/profile.png" style="max-width:80%; max-height:80%">
                        </div>
                        <div class="col-md-5">
                            <div>
                                <h3>队员</h3>

                                <div style="margin-top:10px">
                                    <p><span>姓名：<% %></span></p>
                                    <p><span>班级：<% %></span></p>
                                    <p><span>学号：<% %></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:50px;" data-toggle="modal"
                                        data-target="#remove">踢出团队
                                </button>
                                <div class="modal fade" id="remove1" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="tips1">提示</h4>
                                            </div>
                                            <div class="modal-body">
                                                确认踢出？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <button type="button" class="btn btn-primary">确认</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:20px;" data-toggle="modal"
                                        data-target="#transfer">转让队长
                                </button>
                                <div class="modal fade" id="transfer1" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="tips2">提示</h4>
                                            </div>
                                            <div class="modal-body">
                                                确认转让？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <button type="button" class="btn btn-primary">确认</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row" style="margin-left:0px">
                        <div class="col-md-3">
                            <img src="<%=path%>/img/profile.png" style="max-width:80%; max-height:80%">
                        </div>
                        <div class="col-md-5">
                            <div>
                                <h3>队员</h3>

                                <div style="margin-top:10px">
                                    <p><span>姓名：<% %></span></p>
                                    <p><span>班级：<% %></span></p>
                                    <p><span>学号：<% %></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:50px;" data-toggle="modal"
                                        data-target="#remove">踢出团队
                                </button>
                                <div class="modal fade" id="remove2" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="tips3">提示</h4>
                                            </div>
                                            <div class="modal-body">
                                                确认踢出？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <button type="button" class="btn btn-primary">确认</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:20px;" data-toggle="modal"
                                        data-target="#transfer">转让队长
                                </button>
                                <div class="modal fade" id="transfer2" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="tips4">提示</h4>
                                            </div>
                                            <div class="modal-body">
                                                确认转让？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <button type="button" class="btn btn-primary">确认</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /. ROW  -->
            <%
                }
            %>
            <!-- /. ROW  -->
            <footer><p>版权所有 ©2019-2020 学生选题信息系统 保留所有权利</p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
</body>
</html>