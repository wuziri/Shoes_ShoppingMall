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


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/style2.css" type="text/css" media="all">
    <title>购物车</title>
    
</head>
<script type="text/javascript">


function del_shopping(){
document.form1.action="del_all.jsp";
document.form1.submit();
return true;
}
function order(){
document.form1.action="order.jsp";
document.form1.submit();
return true;
}
</script>
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
          <li><a href="#">订单查询</a></li>
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
    <div class="main">
    <div id="shoppingCart">
        <div id="h">
            <div class="all_goods">全部商品</div>
        </div>
        <div style="width:900px;height: 2px;background: #000;margin-top: 5px;margin-bottom: 5px;"></div>


       
            <div id="th" style="height:40px;">
                <div style="width: 180px;">选择商品</div>
                <div style="width: 230px;">商品信息</div>
                <div style="width: 110px;">单价（元）</div>
                <div style="width: 100px;">数量</div>
                <!--  <div style="width: 100px;">金额（元）</div>-->
                <div style="width: 100px;">操作</div>
            </div>
            <form name="form1" action="del_all.jsp" method="post" >
            
            <div class="container">
                <div class="a" style="width: 180px;">
                    <div  style="float: left;"><input type="checkbox" name="checkbox" value="checkbox"></div>
                    <div class="img">
                    	<img src="images/.jpg" style="width: 150px;height: 150px;">
                    	<input type="hidden" name="productid" value="">
                    </div>
                </div>
                <div class="a" style="width: 230px;">
                	
                	<input type="hidden" name="name" value="">
                </div>
                <div class="a" style="width: 110px;">
                	<strong id="price"></strong>
                	<input type="hidden" name="price" value="">
                </div>
                <div class="a" style="width: 100px;">
                	<input type="text" name="num" id="num" value="" onblur="change()">
                </div>
                <!--  
                <div class="a" style="width: 100px;">
                	<strong style="color: #f40;font-size: 16px;" ><span id="sum"></span></strong>
                	
                </div>
                -->
                <div class="a" style="width: 100px;"><span><a href="del_shopping.jsp?id=">删除</a></span></div>
            </div>
			
        	
            <div class="add">
            <div class="a"><a href="#" onClick="javascript:return del_shopping();" style="text-decoration: none;">删除</a></div>
            <div class="c"><a href="#" onClick="javascript:return order();" style="color:#fff;">发送订单</a></div>
           <!--   <div class="b" >合计（不含运费）<strong>¥<span id="all_sum" style="font-size: 22px;margin-left: 5px">.00</span></strong>
            </div>-->
            
        </div>
        </form>
    </div>
    </div>
    
     <div class="main" style="background:#fff;">
    <div style="width:550px;font-size:22px;margin: 0 auto;padding:50px 20px;">
	<a href="index.jsp"><img src="image/shoppingCart.png">你的购物车是空的，赶快去添加吧！</a>
	</div>
	</div>
  
    <div id="footer">
<div class="main">
	<div class="a">CopyRight@2017</div>
	</div>
</div>
</body>
<script>
    function change(){

         var num=document.getElementById("num").value;
         var sum=document.getElementById("sum");
        var all_sum = document.getElementById("all_sum");
         var s=parseFloat(parseInt(document.getElementById("price").innerHTML)*parseInt(num)).toFixed(2);

        sum.innerHTML=s;
        all_sum.innerHTML=s;
    }
</script>
</html>
