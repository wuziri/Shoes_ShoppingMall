<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
String imgName = request.getParameter("id");
String sql = "select name,price,address from shopping where img_name=\'"+imgName+"\'";
String dbClassName = "com.mysql.jdbc.Driver";
String dbUrl = "jdbc:mysql://localhost:3306/distance";
String dbUser = "root";
String dbPwd = "root";
try{
	Class.forName(dbClassName);
	Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPwd);
	Statement dbc = con.createStatement();
	ResultSet rs = dbc.executeQuery(sql);
	if(rs.next()){
	%>
	
<!doctype html>
<html>
<head>
<meta charset="gbk">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>商品信息</title>
<style type="text/css">
.wrapper{background:#ffffff;}

        .button{    
        width: 150px;
    	height: 40px;
    	background-color: #f40;
    	color: #FFFFFF;
    	font-family: 'Lantinghei SC','Microsoft Yahei';
    	font-size: 18px;
    	cursor:pointer;
    	border:none;
    	border-radius: 5px;}
    	.button[name="buy"]{cursor:not-allowed;}
</style>
</head>

<body>
<!--body1部分开始-->
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
          <li><a href="#">订单查询</a></li>
          <li><a href="aboutUs.jsp">关于我们</a></li>
        </ul>
        <ul class="log_reg">
           <% if(session.getAttribute("userID")==null){ %>
          <li><a href="login.jsp">登录</a>|<a href="login.jsp">注册</a></li>
            <%}else{ %>
            <li><span>欢迎您！<%=session.getAttribute("userID") %></span>|<a href='logout.jsp'>退出登录</a> </li>
            <%} %>
        </ul>
    </div>
   </div>
</div>
<!--body1部分结束-->

<div class="body2">
	<div class="main" >
		<div class="wrapper" >
			<div class="left" style="padding:30px 50px 30px 10px;width:350px;float:left;"><img src="images/<%=imgName%>.jpg" width="350px" height="350px" style="border: 1px solid #d7d7d7;"></div>
			<div class="right" style="width:500px;float:left;padding-top:30px">
			<form action="addCart.jsp" method="post">
			<input type="hidden" name="imgName" value="<%=imgName%>">
				<table border="0" width="450px;" cellpadding="0" cellspacing="0">
					<tr height="130px">
						<td colspan="2"><%=rs.getString("name") %><input type="hidden" name="name" value="<%=rs.getString("name") %>"></td>
					</tr>
					<tr height="50px">
						<td width="80px">价格：</td>
						<td>￥<%=rs.getString("price") %><input type="hidden" name="price" value="<%=rs.getString("price") %>"></td>
					</tr>
					<tr height="50px">
						<td>配送：</td>
						<td><%=rs.getString("address") %>  至 
                       		<select name="select">
                                <option value="1">广东 从化</option>
                                <option value="2">广东 广州</option>
                                <option value="3">湖北 武汉</option>
                                <option value="4">北京</option>
                                <option value="5">山东 青岛</option>
                            </select>
                         </td>
                    
					</tr>
					<tr height="50px">
						<td>数量：</td>
						<td><input type="text" id="number" name="number" value="1" style="width: 50px;text-align:center;padding:5px;" onblur="add()"></td>
					</tr>
					<tr height="70px">
						<td colspan="2">
						<input class="button" type="button" name="buy" value="立即购买">
						<input class="button" type="submit" name="add" value="加入购物车">
						</td>					
					</tr>
				</table>
				</form>
				<%	}rs.close();
					dbc.close();
					con.close();
				}catch(SQLException e){e.printStackTrace();}
				 %>
				
			</div>			
		</div>
		
	</div>

</div>


<div id="footer">
<div class="main">
<div class="wrapper">
	<div class="a">CopyRight@2017</div>
	</div>
</div>
</div>
</body>
</html>
