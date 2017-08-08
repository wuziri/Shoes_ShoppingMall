<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
  <script type="text/javascript" src="js/register.js"></script>
  <body>
    <div class="divBody">
<div class="divTitle">
	<span class="spanTitle">新用户注册</span>
</div>
<div class="divContent">
	<form action="<c:url value='/UserServlet'/>" method="post" id="registForm">
	<input type="hidden" name="method" value="register">
		<table border="0">
			<tr>
				<td class="tdTitle">用户名：</td>
				<td class="tdInput"><input type="text" name="username" class="input" id="loginname" value="${form.username }"/></td>
				<td class="tdLabel"><label class="error" id="loginnameError">${errors.loginname }</label></td>
			</tr>
			<tr>
				<td class="tdTitle">登录密码：</td>
				<td class="tdInput"><input type="password" name="password" class="input" id="loginpass" value="${form.password }"/></td>
				<td class="tdLabel"><label class="error" id="loginpassError">${errors.password }</label></td>
			</tr>
			<tr>
				<td class="tdTitle">确认密码：</td>
				<td class="tdInput"><input type="password" name="repassword" class="input" id="reloginpass"></td>
				<td class="tdLabel"><label class="error" id="reloginpassError"></label></td>
			</tr>
			<tr>
				<td class="tdTitle">Email：</td>
				<td class="tdInput" ><input type="text" name="email" class="input" id="email" placeholder="*必须是可用email" value="${form.email }"/></td>
				<td class="tdLabel"><label class="error" id="emailError">${errors.email }</label></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="submit" value="注  册" class="submitBtn"></td>
				<td class="tdLabel"></td>
			</tr>
		</table>
	</form>
	</div>
	</div>
  </body>
</html>
