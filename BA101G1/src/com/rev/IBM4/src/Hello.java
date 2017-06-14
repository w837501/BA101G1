//package servlet_examples;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Hello extends HttpServlet {

  public void doGet(HttpServletRequest req, HttpServletResponse res)
                               throws ServletException, IOException {
   	req.setCharacterEncoding("Big5");
    res.setContentType("text/html; charset=Big5");
    PrintWriter out = res.getWriter();

    String name = req.getParameter("name");
    String name2=new String(name.getBytes("ISO-8859-1"), "Big5");  
    out.println("<HTML>");
    out.println("<HEAD><TITLE>Hello, " + name2 + "</TITLE></HEAD>");
    out.println("<BODY>");
    out.println("Hello, §A¦n: " + name2);
    
    out.println("<br><img src=\""+req.getContextPath()+"/images/tomcat.gif\">");
    
    out.println("</BODY></HTML>");
  }
  public String getServletInfo() {
    return "A servlet that knows the name of the person to whom it's" + 
           "saying hello";
  }
}
