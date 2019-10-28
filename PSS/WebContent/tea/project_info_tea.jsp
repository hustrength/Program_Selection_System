<%@ page language="java" import="java.util.*,com.pss.user.Student" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String teaMainPath = path + "/tea/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>学生选题信息管理系统——学生界面</title>
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
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- -- PagingManage Js -- -->
<script type="text/javascript" src="<%=path %>/js/PagingManage.js"></script>
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
            
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>
    <!--/. NAV TOP  -->
   <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="<%=teaMainPath %>tea_main.jsp"><i class="fa fa-desktop"></i> 选题通知</a>
                </li>
              
                <li>
                    <a class="active-menu" href="<%=teaMainPath %>project_info_tea.jsp"><i class="fa fa-sitemap"></i> 题目信息<span class="fa arrow"></a>
                    <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=teaMainPath %>project_release.jsp">发布题目信息</a><!--连接到发布题目信息jsp  -->
                            </li>
                        </ul>
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
                        可选课题 <small>巴拉巴拉</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            课题一
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home1" data-toggle="tab">简介</a>
                                </li>
                                <li class=""><a href="#profile1" data-toggle="tab">背景</a>
                                </li>
                                <li class=""><a href="#messages1" data-toggle="tab">详情</a>
                                </li>
                                <li class=""><a href="#settings1" data-toggle="tab">其他要求</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home1">
                                    <h4>标题</h4>
                                    <p>数独（shù dú）是源自18世纪瑞士的一种数学游戏。是一种运用纸、笔进行演算的逻辑游戏。
                                        玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
                                        并满足每一行、每一列、每一个粗线宫（3*3）内的数字均含1-9，不重复</p>
                                </div>
                                <div class="tab-pane fade" id="profile1">
                                    <h4>标题</h4>
                                    <p>...</p>
                                </div>
                                <div class="tab-pane fade" id="messages1">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                                <div class="tab-pane fade" id="settings1">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            课题二
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home2" data-toggle="tab">简介</a>
                                </li>
                                <li class=""><a href="#profile2" data-toggle="tab">背景</a>
                                </li>
                                <li class=""><a href="#messages2" data-toggle="tab">详情</a>
                                </li>
                                <li class=""><a href="#settings2" data-toggle="tab">其他要求</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home2">
                                    <h4>标题</h4>
                                    <p>数独（shù dú）是源自18世纪瑞士的一种数学游戏。是一种运用纸、笔进行演算的逻辑游戏。
                                        玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
                                        并满足每一行、每一列、每一个粗线宫（3*3）内的数字均含1-9，不重复</p>
                                </div>
                                <div class="tab-pane fade" id="profile2">
                                    <h4>标题</h4>
                                    <p>...</p>
                                </div>
                                <div class="tab-pane fade" id="messages2">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                                <div class="tab-pane fade" id="settings2">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            课题三
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home3" data-toggle="tab">简介</a>
                                </li>
                                <li class=""><a href="#profile3" data-toggle="tab">背景</a>
                                </li>
                                <li class=""><a href="#messages3" data-toggle="tab">详情</a>
                                </li>
                                <li class=""><a href="#settings3" data-toggle="tab">其他要求</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home3">
                                    <h4>标题</h4>
                                    <p>数独（shù dú）是源自18世纪瑞士的一种数学游戏。是一种运用纸、笔进行演算的逻辑游戏。
                                        玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
                                        并满足每一行、每一列、每一个粗线宫（3*3）内的数字均含1-9，不重复</p>
                                </div>
                                <div class="tab-pane fade" id="profile3">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                                <div class="tab-pane fade" id="messages3">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                                <div class="tab-pane fade" id="settings3">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            课题三
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home4" data-toggle="tab">简介</a>
                                </li>
                                <li class=""><a href="#profile4" data-toggle="tab">背景</a>
                                </li>
                                <li class=""><a href="#messages4" data-toggle="tab">详情</a>
                                </li>
                                <li class=""><a href="#settings4" data-toggle="tab">其他要求</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home4">
                                    <h4>标题</h4>
                                    <p>数独（shù dú）是源自18世纪瑞士的一种数学游戏。是一种运用纸、笔进行演算的逻辑游戏。
                                        玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
                                        并满足每一行、每一列、每一个粗线宫（3*3）内的数字均含1-9，不重复</p>
                                </div>
                                <div class="tab-pane fade" id="profile4">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                                <div class="tab-pane fade" id="messages4">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                                <div class="tab-pane fade" id="settings4">
                                    <h4>...</h4>
                                    <p>...</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /. ROW  -->
            <!-- /. ROW  -->
            <!-- /. ROW  -->
            <footer><p>版权所有 ©2019-2020 学生选题信息系统 保留所有权利</p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>


</body>
</html>
