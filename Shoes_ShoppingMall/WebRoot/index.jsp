<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<% 

String sql = "select * from shopping";
String dbClassName = "com.mysql.jdbc.Driver";
String dbUrl = "jdbc:mysql://localhost:3306/distance?useUnicode=true&characterEncoding=UTF8";
String dbUser = "root";
String dbPwd = "root";
try{
	Class.forName(dbClassName);
	Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPwd);
	Statement dbc = con.createStatement();
	ResultSet rs = dbc.executeQuery(sql);
	
	%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <title>首页</title>

</head>
<body>
<!-- logo和菜单条开始 -->
<div id="header">
	<div class="main">
	<div class="a"><img src="image/header_logo.jpg" class="img"></div>
	</div>
</div>
<div id="menu">
   <div class="main">
	<div class="a">
    	<ul class="menu">
          <li><a href="index.jsp">首页</a></li>
          
          <li><a href="shoppingCart.jsp">购物车</a></li>
          <li><a href="orderlist.jsp">订单查询</a></li>
          <li><a href="aboutUs.jsp">关于我们</a></li>
        </ul>
        <ul class="log_reg">
         <% if(session.getAttribute("sessionUser")==null){ %>
          <li><a href="login.jsp">登录</a>|<a href="register.jsp">注册</a></li>
            <%}else{ %>
            <li><span>欢迎您！<%=session.getAttribute("sessionUser") %></span>|<a href='<c:url value='/UserServlet?method=quit'/>'>退出登录</a> </li>
            <%} %>
        </ul>
    </div>
   </div>
</div>
<!-- logo和菜单条结束 -->

<div id="imgs">
  <div class="main">
	<div class="a">
      <img id="move_img" src="image/a.jpg">
    </div>
  </div>
</div>


<div id="main">
 <div class="main">
	<div class="goods">
	<img src="image/mrbt.gif">  
	<div><span style="font-size: 22px; font-style: normal;display: block;padding:15px 5px;">商品中心</span></div>
      <div class="wrapper" style="padding-left:5px">
        <%
      while(rs.next()){
	 
      %>
      <a href="shopping_info.jsp?id=<%=rs.getString("img_name")%>"><img src="images/<%=rs.getString("img_name")%>.jpg" width="190px" height="190px" style="border:1px solid #d7d7d7;"></a>
	  <%
	  }
	rs.close();
	dbc.close();
	con.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
	   %>
	  </div>
	</div>
</div>
</div>
<div id="footer">
<div class="main">
	<div class="a">CopyRight@2017</div>
	</div>
</div>
</body>
</html>
