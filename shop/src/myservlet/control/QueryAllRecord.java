package myservlet.control;
import mybean.data.*;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class QueryAllRecord extends HttpServlet{
   CachedRowSetImpl rowSet = null;
   public void init(ServletConfig config) throws ServletException{
	   super.init(config);
	   try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (Exception e) {
		// TODO: handle exception
	}	   
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	request.setCharacterEncoding("gb2312");
	String idNumber = request.getParameter("fenleiNumber");
	if(idNumber==null)
	{
		idNumber = "0";
	}
	int id = Integer.parseInt(idNumber);
	HttpSession session = request.getSession(true);
	Connection con = null;
	DataByPage dataBean = null;
	try {
		dataBean = (DataByPage)session.getAttribute("dataBean");
		if (dataBean == null) {
		    dataBean = new DataByPage();
		    session.setAttribute("dataBean", dataBean);
		}
	} catch (Exception e) {
		dataBean = new DataByPage();
		session.setAttribute("dataBean", dataBean);
	}
	String uri = "jdbc:mysql://127.0.0.1/shop";
	try {
		con = DriverManager.getConnection(uri,"root","648042475");
		Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		ResultSet rs = sql.executeQuery("select * from cosmeticForm where id="+id);
		rowSet = new CachedRowSetImpl();//�����м�����
		rowSet.populate(rs);
		dataBean.setRowSet(rowSet);//�м����ݱ�����dataBean��
		con.close();
	} catch (Exception e) {
		// TODO: handle exception
	}
	response.sendRedirect("byPageShow.jsp");//�ض���
   } 
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	doPost(request, response);  
  }
}
