<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
     <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <title>关于我们</title>
   
<style>

 .font{
            font-size: large;
            color: #000;
            padding-left: 80px;
            padding-right: 80px;
            padding-top:40px;
            padding-bottom:40px;
            background-color: #CCCCCC;
            font-style: normal;
        }
</style>
</head>

<body>
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

<div>
<div class="main">
    <div class="font">
        <p><strong><i>- - - - - - -关于我们 </i></strong></p><br>


        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;千里行 ，一家只售正品鞋子的网站，由华软学校学生创立于2016年。在这里，
        你不用担心会买到假货，我们网站有最权威的鞋子鉴定师，以及一套严格的筛
        选伪劣产品的规章流程，绝对让消费者放心。并且，千里行网站购买方便，所合作的都是正
        规的快递公司- - - - - - - - - - - -<br>

        <p><strong>千里行网上商城</strong></p><br>


        <p>现货优势</p><br>

        千里行所有商品为实库现货销售，绝非代理或代销。现货销售才能更好的保证商品的质量及订单处
        理速度，千里行以最快的速度打包发货，并为客户选择速度最快服务最好的快递公司来承运货物。
        正常情况下17点之前的订单当天发货。

        <p>品质优势</p><br>

        　　所销售的高档商品均由国内权威珠宝检测机构检测并出具证书，证书可网上查询真伪，具有法
        律效力，检验结果国内国际认可，最大限度的杜绝假冒伪劣商品。没有出具珠宝鉴定证书的产品同
        样保证为正品，不出具鉴定证书，只是出于成本的考虑，通常较高档的产品一律都有出具权威鉴定
        证书。每件商品从采购到销售至客户手中，须经过不少于五重的公司内部质检人员的检测和等级划
        分，并拍照留底。<br>

        <p>价格优势</p><br>

        　　千里行自产自销，品质与价格极具优势，再直接以电子商务平台进行销售，省去诸多中间环节，
        省去高昂的门店费用，最大限度的降低成本，把实惠献给客户。我们网站上商品所售价格大概是传
        统商场里同等级同类商品的２０％至６０％。<br>

        <p>服务优势</p><br>

            千里行与顺丰快递签约合作，所售商品由顺丰快递提供高品质的物流配送服务（顺丰快递不可送达
        区域可选择其它快递公司）。开通全国一千多个城镇货到付款服务，支持先验货，满意再付款。千
        里行还是支付宝、财付通的签约商户。<br>

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
