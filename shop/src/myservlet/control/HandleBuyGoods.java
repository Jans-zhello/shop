package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.LinkedList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.Authenticator.Success;

import mybean.data.Login;

public class HandleBuyGoods extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
       super.init(config);  
	   try
		{
	     Class.forName("com.mysql.jdbc.Driver");	 
		}catch (Exception e) {    
		}
	}
   public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		   request.setCharacterEncoding("gb2312");
	       String buyGoodsMess = request.getParameter("buy");
	       if(buyGoodsMess==null||buyGoodsMess.length()==0)
	       {
	    	   fail(request,response,"���ﳵû����Ʒ,�޷����ɶ���");
	    	   return;
	       }
	      String price = request.getParameter("price");
	      if(price==null||price.length()==0)
	      {
	    	  fail(request,response,"û�м���۸�,�޷����ɶ���");
	    	  return;
	    	  
	      }
	      float sum = Float.parseFloat(price);
	      Login loginBean = null;
	      HttpSession  session = request.getSession(true);
	      try {
			 loginBean = (Login)session.getAttribute("loginBean");
	    	 if(loginBean.getLogname()==null || loginBean.getLogname().length()==0)
	    	   response.sendRedirect("login.jsp");//�ض����¼ҳ��
		} catch (Exception e) {
			response.sendRedirect("login.jsp");//�ض����¼ҳ��
		}
	     String uri = "jdbc:mysql://127.0.0.1/shop?"+"user=root&password=648042475&characterEncoding=gb2312";
	 	 Connection con;
	 	 PreparedStatement sql; 
         try {
			con = DriverManager.getConnection(uri);
			String inserCondition = "INSERT INTO orderform values(?,?,?,?)";
			sql = con.prepareStatement(inserCondition);
			sql.setInt(1,0);//�������Զ�����
			sql.setString(2,loginBean.getLogname());
			sql.setString(3,buyGoodsMess);
			sql.setFloat(4,sum);
			sql.executeUpdate();
			LinkedList<String> car = loginBean.getCar();
			car.clear();//��չ��ﳵ
			success(request,response,"���ɶ����ɹ�");
		} catch (Exception e) {
           fail(request,response,"���ɶ���ʧ��"+e);			
		}	      
	 }
   public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request, response);  
	 }
   public void success(HttpServletRequest request,HttpServletResponse response,String backNews){
	   response.setContentType("text/html;charset=gb2312");
	   try {
		PrintWriter out = response.getWriter();
		out.println("<html><body>"); 
		out.println("<h2>"+backNews+"</h2>");
		out.println("������ҳ");
		out.println("<a href = 'index.jsp'>��ҳ</a>");
		out.println("<br>�鿴����");
		out.println("<a href='lookOrderForm.jsp'>�鿴����</a>");
		out.println("</body></html>");
	} catch (Exception e) {
		// TODO: handle exception
	}	   
   }
public void fail(HttpServletRequest request,HttpServletResponse response,String backNews){
	 response.setContentType("text/html;charset=gb2312");  
	 try {
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h2>"+backNews+"</h2>");
		out.println("������ҳ");
		out.println("<a href = 'index.jsp'>��ҳ</a>");
		out.println("</body></html>");		 
	} catch (Exception e) {
		// TODO: handle exception
	}  
	   
   }
}
