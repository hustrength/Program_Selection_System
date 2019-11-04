<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
 <script type="text/javascript" src="<%=path %>/js/project_info_tea.js"></script>
<script type="text/javascript">
    function GetActiveTab(i) {
    	var nav_id = "#nav-tabs" + i.toString() + " li.active";
        var id = $(nav_id).children('a').attr('href').substring(1);
        var div = document.getElementById(id);
        return div.getElementsByTagName("textarea")[0];
    }

    function edit_input(i,name,intro,bg,info,other,group_value) {
        var tab = GetActiveTab(i);
        var content_old = tab.value;
        var btn_id = "edit" + i.toString();
        var btn = document.getElementById(btn_id);
        var group_num_id = "max_group_num" + i.toString();
        var max_group_num = document.getElementById(group_num_id);
        var pname_id = "Pname" + i.toString();
        var pname = document.getElementById(pname_id);
        if (btn.value === "编辑") {
            btn.value = "复原";
            tab.removeAttribute("readOnly");
            max_group_num.removeAttribute("readOnly");
            tab.style.border = "0.5px solid #808080";
            pname.style.border = "0.5px solid #808080";
            pname.removeAttribute("readOnly");
        } else {
        	if(tab.id=="Intro") tab.value = intro;
        	else if(tab.id=="Bg") tab.value = bg;
        	else if(tab.id=="Info") tab.value = info;
        	else if(tab.id=="Other") tab.value = other;
        	pname.value = name;
            btn.setAttribute("value", "编辑");
            tab.setAttribute("readOnly", 'true');
            tab.style.border = "0.5px solid #ffffff";
            pname.setAttribute("readOnly", 'true');
            pname.style.border = "0.5px solid #ffffff";
            max_group_num.setAttribute("readOnly", 'true');
            max_group_num.value = group_value;
        }
    }

    function ResetBtn(i) {
    	 var btn_id = "edit" + i.toString();
         var btn = document.getElementById(btn_id);
         var group_num_id = "max_group_num" + i.toString();
         var max_group_num = document.getElementById(group_num_id);
        var tab = GetActiveTab(i);
        btn.setAttribute("value", "编辑");
        tab.setAttribute("readOnly", 'true');
        max_group_num.setAttribute("readOnly", 'true');
        tab.style.border = "0.5px solid #ffffff";
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
                        已发布课题 <small></small>
                    </h1>
                </div>
            </div>
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
                %>
                <div class="col-md-6 col-sm-6">
                    <form id="form_pro" name ="form_pro">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <input id ="PNo" name="PNo" value=<%=pro.getPNo()%> style="display:none">
                                <input id="Pname<%=i%>" name="Pname" value="<%=pro.getPname()%>" readonly="readonly" style="border:0.5px solid #ffffff;">
                            </div>
                            <div class="panel-body">
                                <ul id="nav-tabs<%=i%>" class="nav nav-tabs">
                                    <li class="active"><a href="#home<%=i%>" data-toggle="tab" onclick="ResetBtn(<%=i%>)">简介</a>
                                    </li>
                                    <li class=""><a href="#profile<%=i%>" data-toggle="tab" onclick="ResetBtn(<%=i%>)">背景</a>
                                    </li>
                                    <li class=""><a href="#messages<%=i%>" data-toggle="tab" onclick="ResetBtn(<%=i%>)">详情</a>
                                    </li>
                                    <li class=""><a href="#settings<%=i%>" data-toggle="tab" onclick="ResetBtn(<%=i%>)">其他要求</a>
                                    </li>
                                </ul>
                                    <button type="button" class="close" aria-hidden="true" style="margin:-95px -5px" data-toggle="modal" data-target="#remove_project<%=i%>">
                                                &times;
                                    </button>
                                    <div class="modal fade" id="remove_project<%=i%>" tabindex="-1" role="dialog"
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
                                            确认删除课题？
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">取消
                                            </button>
                                            <input id="pro_edit<%=i%>" type="button" class="btn btn-primary" value="确认" data-dismiss="modal"
                                                   onclick="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="home<%=i%>" style="height:240px">
                                                    <textarea class="col-sm-12"  id="Intro" name ="Intro" readonly="readonly"
                                                              style="border:0.5px solid #ffffff;overflow-y:scroll;height:240px;font-size:21px;
                                                              font-weight:200;line-height:25px;margin-top:15px"><%=pro.getIntroduction() %></textarea>
                                    </div>
                                    <div class="tab-pane fade" id="profile<%=i%>" style="height:240px">
													<textarea class="col-sm-12"  id="Bg" name="Bg" readonly="readonly"
                                                              style="border:0.5px solid #ffffff;overflow-y:scroll;height:240px;font-size:21px;
                                                              font-weight:200;line-height:25px;margin-top:15px"><%=pro.getBackground() %></textarea>
                                    </div>
                                    <div class="tab-pane fade" id="messages<%=i%>" style="height:240px">
													<textarea class="col-sm-12"  id="Info" name="Info" readonly="readonly"
                                                              style="border:0.5px solid #ffffff;overflow-y:scroll;height:240px;font-size:21px;
                                                              font-weight:200;line-height:25px;margin-top:15px" value="<%=pro.getInfo() %>"></textarea>
                                    </div>
                                    <div class="tab-pane fade" id="settings<%=i%>" style="height:240px">
                                                    <textarea class="col-sm-12"  id="Other" name="Other" readonly="readonly"
                                                              style="border:0.5px solid #ffffff;overflow-y:scroll;height:240px;font-size:21px;
                                                              font-weight:200;line-height:25px;margin-top:15px"><%=pro.getOther() %></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="display:inline">
                        <label for="status" class="label1" style="display:inline" >最大可选组数：</label>
                      
                        <input id="max_group_num<%=i%>" class="form-control" value="<%=pro.getPmaxnum() %>" readonly="readonly" id="Pmaxnum" name="Pmaxnum" style="width:50px;display:inline">
                        </div>
                        <div style="display:inline">
                            <input id="submit" type="button" value="提交" class="btn btn-primary"
                                   style="margin-right:18px;float:right"
                                   data-toggle="modal" data-target="#dismiss<%=i%>">
                            <input id="edit<%=i%>" type="button" value="编辑" class="btn btn-default"
                                   style="margin-right:18px;float:right" 
                                   onclick="edit_input(<%=i%>,'<%=pro.getPname()%>','<%=pro.getIntroduction()%>','<%=pro.getBackground()%>','<%=pro.getInfo()%>','<%=pro.getOther()%>','<%=pro.getPmaxnum()%>')">
                            <div class="modal fade" id="dismiss<%=i%>" tabindex="-1" role="dialog"
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
                                            <input id="pro_edit<%=i%>" type="button" class="btn btn-primary" value="确认" data-dismiss="modal"
                                                   onclick="pro_edit()">
                                        </div>
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
