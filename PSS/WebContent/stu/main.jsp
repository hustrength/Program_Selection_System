<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String stuMainPath = path + "/stu/";
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
            <a class="navbar-brand" href="main.jsp">学生选题信息管理系统</a>
        </div>
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
                   if("队长".equals(stu.getSposition())){
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

                    <li>
                        
                            <div>
                                <strong><%=apply.getApplicant().getSname() %>
                                </strong>
                                <span class="pull-right text-muted">
                                        <em></em>
                                    </span>
                            </div>
                            <div style="display:flex; margin-top:3px">
                                <div style="margin-top:5px">申请加入你的团队</div>
                               <input type="button" value="同意" class="btn btn-info btn-sm" style="margin-left:40px" onclick="agree('<%=applicant%>')">
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
                        关于本学期软件工程选题相关事宜安排的通知 <small>巴拉巴拉</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="function"><p>[通知]选题系统已开放</p></div>
                        </div>
                        <div class="box">
                            <div class="info">
                                <p>亲爱的<%=stu.getSname() %>同学，你好！</p>
                            </div>
                            <div class="form">
                                <table class="news">
                                    <tr>
                                        <td><h2></h2></td>
                                    </tr>
                                    <tr>
                                        <td>各学院及相关单位:</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据学校教学安排，本学期全校任选课定于6月20日（星期五）
                                            正式开课，选课工作将从6月16日开始。现将有关事项通知如下：
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一、选课时间：6月16日----6月20日</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、学生登录选课信息管理系统后进入学生选课进行选课。学生选课前请认真阅读选课公告，再进行“网上选课”。</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三、教师可登陆选课信息管理系统后进入选课管理增删课程，
                                            6月15日14:00之后各位教师及学生登录教务处网站查询自己申报的课程是否停开。
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四、选课退课均须在选课时间内完成，选课结束后不再进行补退选，请学生注意选课时间。
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;五、请各学院通知并组织学生进行选课，同时请各学院及相关单位通知任课教师按时上课。教务处将组织相关人员对上课情况进行不定期的检查。</td>
                                    </tr>
                                    <tr>
                                        <td align="right">2017-06-10</td>
                                    </tr>
                                </table>
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