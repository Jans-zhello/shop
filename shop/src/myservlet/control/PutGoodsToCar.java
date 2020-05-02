package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.jms.Session;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;

public class PutGoodsToCar extends HttpServlet {
   public void init(ServletConfig config) throws ServletException{
		   super.init(config);
	 }
   public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	request.setCharacterEncoding("gb2312");
	String goods = request.getParameter("java");
	System.out.println(goods);
	Login loginBean = null;
	HttpSession session = request.getSession(true);
	try {
		loginBean = (Login)session.getAttribute("loginBean");
		//session.setAttribute("loginBean",loginBean);
		boolean b = loginBean.getLogname()==null||loginBean.getLogname().length()==0;
		if(b)
		{
		  response.sendRedirect("login.jsp");	
		}
		LinkedList<String> car = loginBean.getCar();
		car.add(goods);
		speakSomeMess(request,response,goods);
	} catch (Exception e) {
		// TODO: handle exception
		response.sendRedirect("login.jsp");//�ض���
	}
   }
   public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request, response);  
	  }
   public void speakSomeMess(HttpServletRequest request,HttpServletResponse response,String goods){
	response.setContentType("text/html;charset=gb2312");   
	try {
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.print("<jsp:include page='head.txt'/>");
		out.print("<h2>"+goods+"���빺�ﳵ</h2>");
		out.print("�鿴���ﳵ�򷵻������ױƷ<br>");
		out.print("<a href='lookShoppingCar.jsp'>�鿴���ﳵ</a>");
		out.print("<br><a href='byPageShow.jsp'>�����ױƷ</a>");
		out.print("</body></html>");
	} catch (Exception e) {
		// TODO: handle exception
	}   
	   
	   
   }
}
