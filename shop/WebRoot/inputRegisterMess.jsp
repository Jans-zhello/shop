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
    <title>ע��ҳ��</title>
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
   <h3>�û��������֡���ĸ���»��߹��ɡ�*ע�͵��������д</h3>
   <tr>
    <td>*�û�����:</td><td><input type="text" name="logname"></td>
    <td>*�û�����:</td><td><input type="password" name="password"></td>
   </tr>
   <tr>
    <td>*�ظ�����:</td><td><input type="password" name="again_password"></td>
    <td>��ϵ�绰:</td><td><input type="text" name="phone"></td>
   </tr>   
   <tr>
    <td>�ʼĵ�ַ:</td><td><input type="text" name="address"></td>
    <td>��ʵ����:</td><td><input type="text" name="realname"></td>
    <td><input type="submit" name="g" value="ע��"></td>
   </tr>
   </table>
  </form>
  </div>
  <div align="center">
  <p>ע�ᷴ��:
  <jsp:getProperty property="backNews" name="userBean"/>
  <table border=3>
  <tr>
   <td>��Ա����:</td>
   <td><jsp:getProperty name="userBean" property="logname"/></td>
  </tr>
  <tr>
   <td>����:</td>
   <td><jsp:getProperty name="userBean" property="realname"/></td>
  </tr>
  <tr>
   <td>��ַ:</td>
   <td><jsp:getProperty name="userBean" property="address"/></td>
  </tr>
  <tr>
   <td>�绰:</td>
   <td><jsp:getProperty name="userBean" property="phone"/></td>
  </tr>
  </table>
  </div>
  </body>
</html>
