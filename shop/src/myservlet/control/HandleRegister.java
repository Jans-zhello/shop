package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleRegister extends HttpServlet {
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
	 PreparedStatement sql;
 	 Register userBean = new Register(); //创建的javabean模型
	 request.setAttribute("userBean",userBean); 
	 String logname = request.getParameter("logname").trim();
	 String password = request.getParameter("password").trim();
	 String again_password = request.getParameter("again_password").trim();
	 String phone = request.getParameter("phone").trim();
	 String address = request.getParameter("address").trim();
	 String realname = request.getParameter("realname").trim();
	 if(logname==null)
	 {
		 logname="";
	 }
	 if(password==null)
	 {
		 password="";
	 }
	 if(!password.equals(again_password))
	 {
		 userBean.setBackNews("两次密码不同，注册失败");
		 RequestDispatcher dispatcher = request.getRequestDispatcher("inputRegisterMess.jsp");
		 dispatcher.forward(request,response);
		 return;
	 }
	 boolean isLD = true;
	 for(int i=0;i<logname.length();i++)
	 {
		 char c = logname.charAt(i);
         if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
         {
        	isLD = false; 
         }
	 }
	 boolean boo = logname.length()>0 &&password.length()>0 && isLD;
	 String backNew="";
	 try{
		 con = DriverManager.getConnection(uri);
		 String inserCondition = "INSERT INTO user VALUES(?,?,?,?,?)";
		 sql = con.prepareStatement(inserCondition);
		 if(boo)
		 { 
			 sql.setString(1,handleString(logname));
			 sql.setString(2,handleString(password));
			 sql.setString(3,handleString(phone));
			 sql.setString(4,handleString(address));
			 sql.setString(5,handleString(realname));
			 int m = sql.executeUpdate();
			 if(m!=0)
			 {
				 backNew = "注册成功";
				 userBean.setBackNews(backNew);
				 userBean.setLogname(logname);
				 userBean.setPhone(handleString(phone));
				 userBean.setAddress(handleString(address));
				 userBean.setRealname(handleString(realname));
			 }
		 }else
		 {
			 backNew = "信息填写不完整或者名字中由非法字符";
			 userBean.setBackNews(backNew);
		 }
		 con.close();
	 }catch (Exception e) {
		backNew = "该会员名已被使用，请您更换名字";
		userBean.setBackNews(backNew);
	}
	 RequestDispatcher dispatcher = request.getRequestDispatcher("inputRegisterMess.jsp");//转发
	 dispatcher.forward(request,response);
   }
   public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
   {
	   doPost(request,response);
   }
}
