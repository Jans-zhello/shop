package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;

import javax.security.auth.login.FailedLoginException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.sun.net.httpserver.Authenticator.Success;
public class HandleLogin extends HttpServlet {
   public void init(ServletConfig config) throws ServletException
   {
	 super.init(config);  
	 try
	 {
		Class.forName("com.mysql.jdbc.Driver");	 
	 }catch (Exception e) {
	    
	}
   }
   public String handleString(String s)
   {
	   try{
		   byte bb[] = s.getBytes("ISO-8859-1"); 
	   s = new String(bb);
   }catch (Exception e) {
	// TODO: handle exception
	}
	    return s;
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
  {
	 String uri = "jdbc:mysql://127.0.0.1/shop?"+"user=root&password=648042475&characterEncoding=gb2312";
	 Connection con;
	 Statement sql;
	 String logname = request.getParameter("logname").trim();
	 String password = request.getParameter("password").trim();
	 logname = handleString(logname);
	 password = handleString(password);
	 boolean boo = (logname.length()>0) && (password.length()>0);
	 try{
		 con = DriverManager.getConnection(uri);
		 String condition = "select * from user where logname='"+logname+"' and password='"+password+"'";
		 sql = con.createStatement();
		 if(boo)
		 { 
			 ResultSet rs = sql.executeQuery(condition);
			 boolean m = rs.next();
			 if(m==true)
			 {
				//调用登录成功的方法 
				success(request,response,logname,password);
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");//转发
				dispatcher.forward(request, response);
			 }else {
			     String backNews = "您输入的用户名不存在或者密码不匹配";
			     //调用登录失败的方法 
			     fail(request,response,logname,backNews);
			}
			
	   }else {
		      String backNews = "请输入用户名和密码";
		      fail(request,response,logname,backNews);
	   }
		 con.close();
	 }catch (Exception exp) {
		String backNews = ""+exp;
		fail(request,response,logname,backNews); 
	}
   }
   public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
   {
	   doPost(request,response);
   }
   public void success(HttpServletRequest request,HttpServletResponse response,String logname,String password)
   {
	  Login loginBean = null;
	  HttpSession session = request.getSession(true);
	  try {
		 loginBean = (Login)session.getAttribute("loginBean");
		 if(loginBean==null)
		 {
			 loginBean = new Login();
			 session.setAttribute("loginBean",loginBean);
			 loginBean = (Login)session.getAttribute("loginBean");
		 }
		 String name = loginBean.getLogname();
		 if(name.equals(logname))
		 {
			 loginBean.setBackNews(logname+"已经登录了");
			 loginBean.setLogname(logname);
		 }
		 else {
			loginBean.setBackNews(logname+"登录成功");//数据模型存储新的登录用户
			loginBean.setLogname(logname);
		}
	} catch (Exception e) {
		loginBean = new Login();
		session.setAttribute("loginBean",loginBean);
		loginBean.setBackNews(logname+"登录成功");
		loginBean.setLogname(logname);
	}
   }
   public void fail(HttpServletRequest request,HttpServletResponse response,String logname,String backNews){
	response.setContentType("text/html;charset=gb2312");
	try {
		PrintWriter out = response.getWriter(); 
		out.println("<html><body>");
		out.println("<h2>"+logname+"登录反馈结果<br>"+backNews+"</h2>");
		out.println("返回登录页面或主页<br>");
		out.println("<a href='login.jsp'>登录页面</a>");
		out.println("<br><a href='index.jsp'>主页</a>");
		out.println("<body><html>");
	} catch (Exception e) {
	}
   }
}
