<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%@ page import="mybean.data.Login" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>���ҳ��</title>
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
     response.sendRedirect("login.jsp");//�ض���
   }
   else{
      boolean b = loginBean.getLogname()==null||loginBean.getLogname().length()==0;
      if(b)
      {
        response.sendRedirect("login.jsp");
      }
   }
  String numberID = request.getParameter("xijie");
  out.print("<td>��Ʒ��:"+numberID); 
  if(numberID == null){
    out.print("û�в�Ʒ��,�޷��鿴ϸ��");
    return ;
  }
  Connection con;
  Statement sql;
  ResultSet rs;
   try{
     Class.forName("com.mysql.jdbc.Driver");
   }catch(Exception e){}
   String uri = "jdbc:mysql://127.0.0.1/shop?"+"user=root&password=648042475&characterEncoding=gb2312";
   try{
    con = DriverManager.getConnection(uri);
    sql = con.createStatement();
    String cdn = "select * from cosmeticForm where cosmetic_number= '"+numberID+"'";
    rs = sql.executeQuery(cdn);
    out.print("<table border=2>");
    out.print("<tr>");
    out.print("<th>��Ʒ��");
    out.print("<th>����");
    out.print("<th>������");
    out.print("<th>�۸�");
    out.print("<th><font color=blue>���빺�ﳵ</font>");
    out.print("</tr>");    
    String picture = "welcome.jpg";
    String detailMess = "";
    while(rs.next())
    {
     String number = rs.getString(1);
     String name = rs.getString(2);
     String maker = rs.getString(3);
     String price = rs.getString(4);
     detailMess = rs.getString(5);
     picture = rs.getString(6);
     String goods = "("+number+","+name+","+maker+","+price+")#"+price;//����۸�
     goods = goods.replaceAll("\\p{Blank}","");
     String button = "<form action='putGoodsServlet' method='post' >"+"<input type='hidden' name='java' value="+goods+">"+"<input type='submit' value='���빺�ﳵ'></form>";   
     out.print("<tr>");
     out.print("<td>"+number+"</td>");
     out.print("<td>"+name+"</td>");
     out.print("<td>"+maker+"</td>");
     out.print("<td>"+price+"</td>");
     out.print("<td>"+button+"</td>");
     out.print("</tr>"); 
    }
    out.print("</table>");
    out.print("��Ʒ����:<br>");
    out.print("<div align='center'>"+detailMess+"</div>");
    String pic = "<img src = 'image/"+picture+"' width=260 height=200/>";
    out.print(pic);
    con.close();
   }catch(SQLException exp)
   {
   }
   %>
  </div>
  </body>
</html>
