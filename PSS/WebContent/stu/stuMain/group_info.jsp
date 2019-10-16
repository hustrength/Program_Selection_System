<%@ page language="java" import="java.util.*,com.pss.dao.*,com.pss.user.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String stuMainPath = path+"/stu/stuMain/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>团队信息</title>
	<!-- Bootstrap Styles-->
    <link href="<%=path %>/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="<%=path %>/assets/css/font-awesome.css" rel="stylesheet" />
     <!-- Morris Chart Styles-->
   
        <!-- Custom Styles-->
    <link href="<%=path %>/assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="<%=path %>/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
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
                        <li><a href="<%=basePath%>stu/Login.jsp"><i class="fa fa-sign-out fa-fw"
                                                    onclick="<%session.removeAttribute("student"); %>
                                                            "></i> Sign out</a>
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
                        <a href="<%=stuMainPath %>main.jsp"><i class="fa fa-bell"></i> 选题通知</a>
                    </li>
                    <li>
                        <a href="<%=stuMainPath %>project_info.jsp"><i class="fa fa-desktop"></i> 课题信息</a>
                    </li>
					<li>
                        <a href="<%=stuMainPath %>group_info.jsp" class="active-menu"><i class="fa fa-users"></i> 团队信息</a>
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
        <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Tables Page <small>Responsive tables</small>
                        </h1>
                    </div>
                </div> 
                 <!-- /. ROW  -->
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             可选团队
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
								<form name="join_group_form" action="" method="post">
								<%
                                   GPS gps =null;
  				                   DaoGPS listall = new DaoGPS();
  				                   List<GPS> list = listall.listAllGPS();
  				                   Iterator<GPS> it = list.iterator();
  			                    %>
	                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
	                                    <thead>
	                                        <tr>
	                                            <th>团队编号</th>
	                                            <th>团队名</th>
	                                            <th>所选课题</th>
	                                            <th>队长</th>
	                                            <th>剩余成员数</th>
	                                            <th>选择</th>
	                                        </tr>
	                                          
	                                    </thead>
	                                  
	                                    <tbody>
	                                        <% 
  						                      while(it.hasNext()){
  							                  gps = it.next();
  							                  if(gps.getGleftnum()>0){
  						                      %>
	                                        <tr class="odd gradeX">
	                                            <td><%= gps.getGNo() %></td>
	                                            <td><%= gps.getGname() %></td>
	                                            <td><%= gps.getPname() %></td>
	                                            <td class="center"><%= gps.getStu1().getSname() %></td>
	                                            <td class="center"><%=gps.getGleftnum() %></td>
	                                            <td><input type="button" value="加入" id="join" name="join"></td>
	                                        </tr>
	                                        <%
  							                  }
  							                  }
  						                      %>
	                                     </tbody>
	                                </table>
                                </form>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
            
                <!-- /. ROW  -->
        </div>
               <footer><p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://www.freemoban.com/">www.freemoban.com</a></p></footer>
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->

</body>
</html>
