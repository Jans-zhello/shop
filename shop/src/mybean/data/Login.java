package mybean.data;
import java.util.LinkedList;
public class Login {
   String logname = "";
   String backNews = "δ��¼";
   LinkedList<String> car;//�û��Ĺ��ﳵ
   public Login()
   {
	   car = new LinkedList<String>();
   }
public String getLogname() {
	return logname;
}
public void setLogname(String logname) {
	this.logname = logname;
}
public String getBackNews() {
	return backNews;
}
public void setBackNews(String backNew) {
	this.backNews = backNew;
}
public LinkedList<String> getCar()
{
  return car;	
}
}
