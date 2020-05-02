<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>查询化妆品</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body  style="background-color:#FAFAD2">
  <jsp:include page="head.txt"></jsp:include>
   <center>
    <br>查询时可以输入化妆品的产品号或化妆品名称及价格<br>
    化妆品名称支持模糊查询
    <br>输入价格是在2个值之间的价格，格式是：价格1-价格2 &nbsp;&nbsp;&nbsp;&nbsp;例如258-689<br>
    <form action="searchByConditionServlet" method="post">
    <br>输入查询信息:<input type="text" name="searchMess"><br>
     <input type="radio" name = "radio" value="cosmetic_number">化妆品版本号
     <input type="radio" name = "radio" value="cosmetic_name" checked="ok">化妆品名称
     <input type="radio" name = "radio" value="cosmetic_price" >化妆品价格
     <br><input type="submit" name="g" value="提交">
    </form>
   </center>
  </body>
</html>
