<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录页面</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
	
	<script type="text/javascript" src="js/login.js"></script>
	
</head>
<body>
<div class="divBody">
	<div class="divTitle">
		<span class="spanTitle">用户登录</span>
	</div>
	<div class="divContent">
	<form action="<c:url value='/UserServlet'/>" method="post" id="loginForm">
	<input type="hidden" name="method" value="login">
		<table border="0">
			<tr>
				<td class="tdTitle"></td>
				<td height="18"><label class="error" id="msg">${message }</label></td>
			</tr>
			<tr>
				<td class="tdTitle">用户名：</td>
				<td class="tdInput"><input type="text" name="username" class="input" id="username" value="${user.username}"><span class="clear-btn" id="clearusername"></span></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td class="tdLabel" height="20"><label class="error" id="usernameError">${errors.loginname }</label></td>
			</tr>
			<tr>
				<td class="tdTitle">密   码：</td>
				<td class="tdInput"><input type="password" name="password" class="input" id="password" value="${user.password }"><span class="clear-btn" id="clearpassword"></span></td>
				
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td class="tdLabel" height="20"><label class="error" id="passwordError">${errors.password }</label></td>
			</tr>
			<tr>
                <td class="tdTitle">验证码：</td>
                <td>
                  <input class="input yzm" type="text" name="verifyCode" id="verifyCode" value=""/>
                  <img class="vCode" src="/Shoes_ShoppingMall/VerifyCodeServlet"/>
                  <a id="verifyCode" href="javascript:_change()">换一张</a>
                </td>
            </tr>
            <tr>
                <td height="20px">&nbsp;</td>
                <td><label id="verifyCodeError" class="error">${errors.verifyCode }</label></td>
            </tr>
			<tr>
				<td></td>
				<td class="tdInput" >
				  <input type="image" id="submit" src="image/login1.jpg" class="loginBtn"/>
				  <!--<input type="submit" name="submit" value="登  录" class="Button">-->
				  <!--<input type="reset" name="reset" value="取  消" class="Button">-->
				</td>
			</tr>
			
		</table>
		</form>
		<div class="footer">
			<a class="register" href="<c:url value='/register.jsp'/>">立即注册</a>|
			<a class="forgetPassword" href="">忘记密码</a>
		</div>
	</div>
</div>
</body>
</html>