<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>浏览页面</title>
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
  <%
   try{
     Class.forName("com.mysql.jdbc.Driver");
   }catch(Exception e){}
    String uri = "jdbc:mysql://127.0.0.1/shop?"+"user=root&password=648042475&characterEncoding=gb2312";
	Connection con;
	Statement sql;
    ResultSet rs;
    try{
     con = DriverManager.getConnection(uri);
     sql = con.createStatement();
     //读取classfy表
     rs = sql.executeQuery("select * from classify");
     out.print("<form action='queryServlet' method='post'>");
     out.print("<select name ='fenleiNumber'>");
     while(rs.next())
     {
       int id = rs.getInt(1);
       String name = rs.getString(2);
       out.print("<option value="+id+">"+name+"</option>");
     }
     out.print("</select>");
     out.print("<input type='submit' value= '提交' >");
     out.print("</form>");
     con.close();
    }catch (SQLException e)
    {
      out.print(e);
    }
   %>
  </div>
  </body>
</html>
