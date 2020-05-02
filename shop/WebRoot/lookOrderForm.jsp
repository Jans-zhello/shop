<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>查看订单</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body  style="background-color:#FAFAD2">
  <jsp:include page="head.txt"></jsp:include>
  <div align="center">
   <%
     if(loginBean == null)
     {
      response.sendRedirect("login.jsp");
     }
     else{
        boolean b = loginBean.getLogname()==null || loginBean.getLogname().length()==0;
        if(b)
         response.sendRedirect("login.jsp");
     }
     Connection con;
     Statement sql;
     ResultSet rs;
     try{
      Class.forName("com.mysql.jdbc.Driver");
     }catch(Exception e){
     }
     try{
       String uri = "jdbc:mysql://127.0.0.1/shop";
       String user = "root";
       String password = "648042475";
       con = DriverManager.getConnection(uri,user,password);
       sql = con.createStatement();
       String cdn = "select id,mess,sum from orderForm where logname='"+loginBean.getLogname()+"'";
       rs = sql.executeQuery(cdn);
       out.print("<table border=2>");
       out.print("<tr>");
       out.print("<td width=100>"+"订单号</td>");
       out.print("<td width=100>"+"信息</td>");
       out.print("<td width=100>"+"价格</td>");
       out.print("</tr>");
       while(rs.next())
       {
       out.print("<tr>");
       out.print("<td width=100>"+rs.getString(1)+"</td>");
       out.print("<td width=100>"+rs.getString(2)+"</td>");
       out.print("<td width=100>"+rs.getString(3)+"</td>");
       out.print("</tr>");     
       }
     }catch(Exception e)
     {
        out.print(e);
     }
    %>
  </div>
  </body>
</html>
