<%@ page language="java" import="java.util.*,com.pss.user.Student" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String teaPath = path + "/tea/";
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

<script type="text/javascript">
    function edit_input() {
    	var t = $('.nav-tabs .active').text();
    	alert(t);
        var btn = document.getElementById("edit");
        var title = document.getElementById("title");
        var content = document.getElementById("content");
        var string = "sds";
        if (btn.getAttribute('value') === "编辑") {
            btn.setAttribute("value", "复原");
            title.removeAttribute("readOnly");
            title.style.border = "0.5px solid #808080";
            content.removeAttribute("readOnly");
            content.style.border = "0.5px solid #808080";

        } else {
            title.value = "title";
            content.value = "content";
            content.setAttribute("value", "content");
            btn.setAttribute("value", "编辑");
            title.setAttribute("readOnly", 'true');
            title.style.border = "0.5px solid #ffffff";
            content.setAttribute("readOnly", 'true');
            content.style.border = "0.5px solid #ffffff";
        }
    }
</script>

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

            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=teaPath %>tea_info.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>stu/Login.jsp"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
        </ul>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="<%=teaPath %>tea_main.jsp"><i class="fa fa-desktop"></i> 选题通知</a>
                </li>
                <li>
                    <a class="active-menu"><i class="fa fa-sitemap"></i> 课题信息<span class="fa arrow"></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<%=teaPath %>project_release.jsp">发布课题</a><!--连接到发布题目信息jsp，自动创建一个新的题目信息数据结构  -->
                        </li>
                        <li>
                            <a href="<%=teaPath %>project_info_tea.jsp">查看课题</a><!--连接到查看题目信息jsp，自动创建一个新的题目信息数据结构  -->
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%=teaPath %>tea_group.jsp"><i class="fa fa-users"></i> 学生组队信息</a>
                </li>
                <li>
                    <a href="<%=teaPath %>tea_info.jsp"><i class="fa fa-user"></i> 教师个人信息</a>
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
                        可选课题 <small></small>
                    </h1>
                </div>
            </div>
            <!-- 看到这个注释你记得写一次性获取两个题目信息的后台脚本 -->
            <!-- /. ROW  -->

            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <form>
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
                                                <div class="tab-pane fade active in" id="home1"
                                                     style="overflow:scroll; height:240px">
                                                    <p>数独（shù dú）是源自18世纪瑞士的一种数学游戏。是一种运用纸、笔进行演算的逻辑游戏。
                                                        玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
                                                        并满足每一行、每一列、每一个粗线宫（3*3）内的数字均含1-9，不重复</p>
                                                </div>
                                                <div class="tab-pane fade" id="profile1"
                                                     style="overflow:scroll; height:240px">

                                                    <p>...</p>
                                                </div>
                                                <div class="tab-pane fade" id="messages1"
                                                     style="overflow:scroll; height:240px">

                                                    <p>...</p>
                                                </div>
                                                <div class="tab-pane fade" id="settings1"
                                                     style="overflow:scroll; height:240px">
                                                    <p>...</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display:flex">
                                        <input id="edit" type="button" value="编辑" class="btn btn-default"
                                               style="margin-left:18px;" onclick="edit_input()">
                                        <input type="button" value="提交" class="btn btn-primary"
                                               style="margin-left:18px;"
                                               data-toggle="modal" data-target="#dismiss">
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
                                                        确认修改？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default"
                                                                data-dismiss="modal">取消
                                                        </button>
                                                        <input type="button" class="btn btn-primary" value="确认"
                                                               onclick="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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
                                            <div class="tab-pane fade active in" id="home2"
                                                 style="overflow:scroll; height:240px">
                                                <h4>标题</h4>
                                                <p>数独（shù dú）是源自18世纪瑞士的一种数学游戏。是一种运用纸、笔进行演算的逻辑游戏。
                                                    玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
                                                    并满足每一行、每一列、每一个粗线宫（3*3）内的数字均含1-9，不重复</p>
                                            </div>
                                            <div class="tab-pane fade" id="profile2"
                                                 style="overflow:scroll; height:240px">
                                                <h4>标题</h4>
                                                <p>...</p>
                                            </div>
                                            <div class="tab-pane fade" id="messages2"
                                                 style="overflow:scroll; height:240px">
                                                <h4>...</h4>
                                                <p>...</p>
                                            </div>
                                            <div class="tab-pane fade" id="settings2"
                                                 style="overflow:scroll; height:240px">
                                                <h4>...</h4>
                                                <p>...</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn-group" style="float:right; margin-top:20px">
                                        <button class="btn btn-primary">修改操作</button>
                                        <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"><span
                                                class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">修改课题信息</a></li>
                                            <!-- 点击这个链接的同时你需要跳转至project_release.jsp，在project_release.jsp 中获取该题目的所有信息，同时填充相应的空格-->
                                            <li><a href="#">重置课题信息</a></li>
                                            <!-- 点击这个链接的同时你需要删除这个题目的除课题名字之外的所有信息，同时转到project_release.jsp获取该题目的题目信息 ，同时填充相应的空格（已经被删除的信息可以不填充）-->
                                            <li><a href="#">删除课题</a></li>
                                            <!-- 点击这个链接的同时你需要删除这个题目的所有信息，其余题目在数据库中自动向前移动，同时刷新当前页面-->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
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

                                            <div class="tab-pane fade active in" id="home3"
                                                 style="overflow:scroll; height:240px">
                                                <h4>标题</h4>
                                                <p>数独（shù dú）是源自18世纪瑞士的一种数学游戏。是一种运用纸、笔进行演算的逻辑游戏。
                                                    玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
                                                    并满足每一行、每一列、每一个粗线宫（3*3）内的数字均含1-9，不重复</p>
                                            </div>
                                            <div class="tab-pane fade" id="profile3"
                                                 style="overflow:scroll; height:240px">
                                                <h4>...</h4>
                                                <p>...</p>
                                            </div>
                                            <div class="tab-pane fade" id="messages3"
                                                 style="overflow:scroll; height:240px">
                                                <h4>...</h4>
                                                <p>...</p>
                                            </div>
                                            <div class="tab-pane fade" id="settings3"
                                                 style="overflow:scroll; height:240px">
                                                <h4>...</h4>
                                                <p>...</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn-group" style="float:right; margin-top:20px">
                                        <button class="btn btn-primary">修改操作</button>
                                        <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"><span
                                                class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">修改课题信息</a></li>
                                            <!-- 点击这个链接的同时你需要跳转至project_release.jsp，在project_release.jsp 中获取该题目的所有信息，同时填充相应的空格-->
                                            <li><a href="#">重置课题信息</a></li>
                                            <!-- 点击这个链接的同时你需要删除这个题目的除课题名字之外的所有信息，同时转到project_release.jsp获取该题目的题目信息 ，同时填充相应的空格（已经被删除的信息可以不填充）-->
                                            <li><a href="#">删除课题</a></li>
                                            <!-- 点击这个链接的同时你需要删除这个题目的所有信息，其余题目在数据库中自动向前移动，同时刷新当前页面-->
                                        </ul>
                                    </div>
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
