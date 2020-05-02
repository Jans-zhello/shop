<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request" />
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body  style="background-color:#FAFAD2">
  <jsp:include page="head.txt"></jsp:include>
  <div align="center">
  <form action="registerServlet" method="post" name="form">
   <table>
   <h3>用户名由数字、字母、下划线构成。*注释的项必须填写</h3>
   <tr>
    <td>*用户名称:</td><td><input type="text" name="logname"></td>
    <td>*用户密码:</td><td><input type="password" name="password"></td>
   </tr>
   <tr>
    <td>*重复密码:</td><td><input type="password" name="again_password"></td>
    <td>联系电话:</td><td><input type="text" name="phone"></td>
   </tr>   
   <tr>
    <td>邮寄地址:</td><td><input type="text" name="address"></td>
    <td>真实姓名:</td><td><input type="text" name="realname"></td>
    <td><input type="submit" name="g" value="注册"></td>
   </tr>
   </table>
  </form>
  </div>
  <div align="center">
  <p>注册反馈:
  <jsp:getProperty property="backNews" name="userBean"/>
  <table border=3>
  <tr>
   <td>会员名称:</td>
   <td><jsp:getProperty name="userBean" property="logname"/></td>
  </tr>
  <tr>
   <td>姓名:</td>
   <td><jsp:getProperty name="userBean" property="realname"/></td>
  </tr>
  <tr>
   <td>地址:</td>
   <td><jsp:getProperty name="userBean" property="address"/></td>
  </tr>
  <tr>
   <td>电话:</td>
   <td><jsp:getProperty name="userBean" property="phone"/></td>
  </tr>
  </table>
  </div>
  </body>
</html>
