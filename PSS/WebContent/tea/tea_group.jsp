<%@ page language="java" import="java.util.*,com.pss.dao.*,com.pss.user.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String stuMainPath = path + "/stu/";
    String teaPath = path + "/tea/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>学生选题信息管理系统——教师界面</title>
    <!-- Bootstrap Styles-->
    <link href="<%=path %>/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="<%=path %>/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="<%=path %>/assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <!-- TABLE STYLES-->
    <link href="<%=path %>/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
</head>
<body>
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="<%=path %>/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="<%=path %>/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="<%=path %>/assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="<%=path %>/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="<%=path %>/assets/js/dataTables/dataTables.bootstrap.js"></script>

<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="<%=path %>/assets/js/custom-scripts.js"></script>

<!-- CreateGroup Js -->
<script type="text/javascript" src="<%=path %>/js/all_group.js"></script>
<% Teacher tea = null;
    if (session.getAttribute("teacher") == null) {
    	response.sendRedirect(basePath+"stu/Login.jsp");
    } else {
        tea = (Teacher) session.getAttribute("teacher");
    }
   %>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">学生选题信息管理系统</a>
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
                    <a><i class="fa fa-sitemap"></i> 课题信息<span class="fa arrow"></a>
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
                    <a class="active-menu" href="<%=teaPath %>tea_group.jsp"><i class="fa fa-users"></i> 学生组队信息</a>
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
                        所有团队 <small></small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            所有团队
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                    <%
                                        GPS gps = null;
                                        DaoGPS listall = new DaoGPS();
                                        List<GPS> list = listall.listAllGPS();
                                        Iterator<GPS> it = list.iterator();
                                    %>
                                    <table class="table table-striped table-bordered table-hover"
                                           id="dataTables-example" name="dataTables-example">
                                        <thead>
                                        <tr>
                                            <th style="width:12%">团队编号</th>
                                            <th style="width:17%">团队名</th>
                                            <th style="width:16%">所选课题</th>
                                            <th style="width:15%">队长</th>
                                            <th style="width:15%">队员</th>
                                            <th style="width:15%">队员</th>
                                            <th style="width:10%">剩余成员数</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                         <%
                                            while (it.hasNext()) {
                                                gps = it.next();
                                                int gno = gps.getGNo();
                                                String sno = gps.getStu1().getSNo();
                                                String gname = gps.getGname();
                                                String stu2name="";
                                                
                                                if(gps.getStu2()!=null) stu2name=gps.getStu2().getSname();
                                                String stu3name="";
                                                if(gps.getStu3()!=null) stu3name=gps.getStu3().getSname();
                                        %>
                                        <tr class="odd gradeX">
                                            <td><%= gps.getGNo() %>
                                            </td>
                                            <td><%= gps.getGname() %>
                                            </td>
                                            <td><%= gps.getPname() %>
                                            </td>
                                            <td class="center"><%= gps.getStu1().getSname() %>
                                            </td>
                                             <td class="center"><%= stu2name %>
                                            </td>
                                             <td class="center"><%= stu3name %>
                                            </td>
                                            <td class="center"><%=gps.getGleftnum() %>
                                            </td>
                                        <%   
                                           }
                                         
                                        %>
                                        </tr>
                                      
                                        </tbody>
                                    </table>
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
            <!-- /. ROW  -->
        </div>
        <footer><p>版权所有 ©2019-2020 学生选题信息系统 保留所有权利</p></footer>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
</body>
</html>
