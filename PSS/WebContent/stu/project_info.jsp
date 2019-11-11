<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String stuMainPath = path + "/stu/";
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
                    <%

                        Student stu = null;
                        stu = (Student) session.getAttribute("student");
                        if (stu == null) {
                            response.sendRedirect(basePath + "stu/Login.jsp");
                        }
                        String leader_sno = stu.getSNo();
                        if ("组长".equals(stu.getSposition())) {
                            String applicant = null;
                            Apply apply = null;
                            DaoApply list_all_apply = new DaoApply();
                            List<Apply> list_apply = list_all_apply.listApplybyGname(stu.getSgroup());
                            Iterator<Apply> it_apply = list_apply.iterator();

                            while (it_apply.hasNext()) {
                                apply = it_apply.next();
                                int status = apply.getStatus();
                                if (status == 0) {
                                    applicant = apply.getApplicant().getSNo();
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
                                   onclick="agree('<%=applicant%>')">
                        </div>

                    </li>
                    <li class="divider"></li>
                    <%
                            }
                        }

                    %>
                    <li>
                        <a class="text-center" href="#">
                            <strong>读取全部消息</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                    <%
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
    </nav>
    <!--/. NAV TOP  -->
   
         
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="<%=stuMainPath %>main.jsp"><i class="fa fa-bell"></i> 选题通知</a>
                </li>
                <li>
                    <a class="active-menu" href="<%=stuMainPath %>project_info.jsp"><i class="fa fa-desktop"></i>
                        课题信息</a>
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
                        可选课题 <small></small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <%
                    Project pro = null;
                    DaoPro daopro = new DaoPro();
                    List<Project> list_pro = daopro.listAllProject();
                    Iterator<Project> it_pro = list_pro.iterator();
                    int i = 0;

                    while (it_pro.hasNext()) {
                        ++i;
                        pro = it_pro.next();
                        String intro=pro.getIntroduction();
                        String bg=pro.getBackground();
                        String info=pro.getInfo();
                        String other=pro.getOther();
                        intro=intro.replace("\r\n","<br/>");
                        bg=bg.replace("\r\n","<br/>");
                        info=info.replace("\r\n","<br/>");
                        other=other.replace("\r\n","<br/>");
                        
                %>
                <div class="col-md-6 col-sm-6">
                    <form>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                课题<%=pro.getPNo()%>
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
                                    <div>
                                    	<p style="float:right;margin-top:-14px;font-size:13px">剩余可选组数：<%=pro.getPavailable() %></p>
                                    </div>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="home1" style="height:240px">
                                        <p class="col-sm-12"
                                           style="overflow-y:scroll;height:240px;font-size:21px;font-weight:200;line-height:25px;margin-top:15px">
                                            <%=intro%>
                                        </p>
                                    </div>
                                    <div class="tab-pane fade" id="profile1" style="height:240px">
                                        <p class="col-sm-12"
                                           style="overflow-y:scroll;height:240px;font-size:21px;font-weight:200;line-height:25px;margin-top:15px">
                                            <%=bg %>
                                        </p>
                                    </div>
                                    <div class="tab-pane fade" id="messages1" style="height:240px">
                                        <p class="col-sm-12"
                                           style="overflow-y:scroll;height:240px;font-size:21px;font-weight:200;line-height:25px;margin-top:15px">
                                            <%=info %>
                                        </p>
                                    </div>
                                    <div class="tab-pane fade" id="settings1" style="height:240px">
                                        <p class="col-sm-12" readonly="readonly"
                                           style="overflow-y:scroll;height:240px;font-size:21px;font-weight:200;line-height:25px;margin-top:15px">
                                            <%=other %>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <%
                    if (i % 2 == 0) {
                %>
                <hr style="border:1px solid  #e5ebf2">
                <%
                        }
                    }
                %>
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
