<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录页面</title>
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
  <div align="center">
  <form action="loginServlet" method="post" name="form">
   <table border=2>
   <h3>登录</h3>
   <tr>
    <td>*用户名称:</td><td><input type="text" name="logname"></td>
    <td>*用户密码:</td><td><input type="password" name="password"></td>
   </tr>
   </table>
  <input type="submit" name='g' value="登录">
  </form>
  </div>
  <div align="center">
  <p>登录反馈:<jsp:getProperty name="loginBean" property="backNews" /><br>
   会员名称:<jsp:getProperty name="loginBean" property="logname"/></td>
  </div>
  </body>
</html>
