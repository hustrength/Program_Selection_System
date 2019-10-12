<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <base href="<%=basePath%>">

    <meta charset="UTF-8">
    <title>学生选题信息管理系统</title>
    <link href="css/stulogin.css" type="text/css" rel="stylesheet"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-latest.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/sturegister.js"></script>
</head>

<body>
<div class="login_bg">
    <!-- <div class="login_box">
        <div class="login_logo">
            <img class="login_logo_icon" src="img/Slogo.png" alt=""/>
            <img class="login_logo_text" src="img/StudentSelection.png" alt=""/>
        </div>
        <div class="login_line"></div>
        <div class="login_content">
            <h2>学生选题信息管理系统</h2>
            <p>Student Selection Management System</p>
            <form id="form_login" method='post' onsubmit='commitForm(this)' >
                <div class="login_input">
                    <input type="text" placeholder="请输入学号" class="login_username" name="username" required="required"
                    oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                </div>

                <div class="login_input">
                    <input type="password" placeholder="请输入密码" class="login_password"  name="password" required="required"
                    oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                </div>

                <div>
                    <input id="login_button" class="login_btn sure" type="submit" value="登录"  >
                    <input id="register_button" class="login_btn sure" type="button" value="注册" onclick="window.location.href='stu/sturegister.jsp'" >
                    <input class="jump_btn cancle" type="button" value="教师入口" onclick="window.location.href='tea/teaLogin.jsp'">
                </div>
            </form>
        </div>
    </div> -->
    <div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
            <div class="login-form">
                <form id="form_login" name="form_login" method='post' onsubmit='commitForm_signin(this)'>
                    <div class="sign-in-htm">
                        <div><br></div>
                        <div><br></div>
                        <div class="group1">
                            <label for="userid_signin" class="label1">编号</label>
                            <input id="userid_signin" name="userid_signin" type="text" class="input1" required="required"
                                   oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                        </div>
                        <div><br></div>
                        <div><br></div>
                        <div class="group1">
                            <label for="password_signin" class="label1">密码</label>
                            <input id="password_signin" name="password_signin" type="password" class="input1" data-type="password"
                                   required="required"
                                   oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                        </div>
                        <div><br></div>
                        <div><br></div>
                        <div class="group1">
                            <label for="status" class="label1">身份</label>
                            <select class="input1" name="status" id="status" required="required" style="height:40px"
                                    oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                                <option class="input_bt" value="" selected>--请选择--</option>
                                <option class="input_bt" value="stu">学生</option>
                                <option class="input_bt" value="tea">教师</option>
                            </select>
                        </div>
                        <div><br></div>
                        <div><br></div>
                        <div><br></div>
                        <div class="group1">
                            <input type="submit" class="button1" value="登录" >
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <a style="font-size:12px"> 忘记密码？请联系管理员：18888888888</a>
                        </div>
                    </div>
                </form>
                <form id="form_register" name="form_register" method="post" onsubmit='commitForm_signup(this)'>
                    <div class="sign-up-htm">
                        <div class="group">
                            <label for="userid_signup" class="label">学号</label>
                            <input id="userid_signup" name="userid_signup" type="text" class="input"
                                   required="required" oninput="checkUserid()">
                        </div>
                        <div class="group">
                            <label for="password_signup" class="label">密码</label>
                            <input id="password_signup" name="password_signup" type="password" class="input"
                                   data-type="password" oninput="checkPassword()" required="required">
                        </div>
                        <div class="group">
                            <label for="repassword" class="label">确认密码</label>
                            <input id="repassword" name="repassword" type="password" class="input" data-type="password"
								   required="required" oninput="checkPassword()">
                        </div>
                        <div class="group">
                            <label for="username" class="label">真实姓名</label>
                            <input id="username" name="username" type="text" class="input" required="required"
                                   oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                        </div>
                        <div class="group">
                            <label for="sex" class="label">性别</label>
                            <select class="input" name="sex" id="sex" required="required" style="height:30px"
                                    oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                                <option class="input_bt" value="" selected>--请选择--</option>
                                <option class="input_bt" value="男">男生</option>
                                <option class="input_bt" value="女">女生</option>
                            </select>
                        </div>
                        <div class="group">
                            <label for="class" class="label">班级</label>
                            <select class="input" name="class" id="class" required="required"
                                    style="height:30px"
                                    oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                                <option class="input_bt" value="" selected>--请选择--</option>
                                <option class="input_bt" value="CS1704">CS1704</option>
                                <option class="input_bt" value="CS1705">CS1705</option>
                                <option class="input_bt" value="CS1706">CS1706</option>
                            </select>
                        </div>
                        <div><br></div>
                        <div class="group">
                            <input type="submit" class="button" value="注册">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="copyright">版权所有 ©2019-2020 学生选题信息系统 保留所有权利</div>
</div>
</body>
</html>