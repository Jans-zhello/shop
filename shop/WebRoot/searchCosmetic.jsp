<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>��ѯ��ױƷ</title>
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
    <br>��ѯʱ�������뻯ױƷ�Ĳ�Ʒ�Ż�ױƷ���Ƽ��۸�<br>
    ��ױƷ����֧��ģ����ѯ
    <br>����۸�����2��ֵ֮��ļ۸񣬸�ʽ�ǣ��۸�1-�۸�2 &nbsp;&nbsp;&nbsp;&nbsp;����258-689<br>
    <form action="searchByConditionServlet" method="post">
    <br>�����ѯ��Ϣ:<input type="text" name="searchMess"><br>
     <input type="radio" name = "radio" value="cosmetic_number">��ױƷ�汾��
     <input type="radio" name = "radio" value="cosmetic_name" checked="ok">��ױƷ����
     <input type="radio" name = "radio" value="cosmetic_price" >��ױƷ�۸�
     <br><input type="submit" name="g" value="�ύ">
    </form>
   </center>
  </body>
</html>
