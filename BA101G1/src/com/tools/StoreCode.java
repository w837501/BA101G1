package com.tools;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "StoreCode", urlPatterns = { "/storecode" }, initParams = {
  @WebInitParam(name = "width", value = "80"),
  @WebInitParam(name = "height", value = "30"),
  @WebInitParam(name = "codeCount", value = "4") })
public class StoreCode extends HttpServlet {
 private static final long serialVersionUID = 1L;
 private int width = 80; 
 private int height = 30; 
 private int codeCount = 4;
 private int x = 16;
 private int fontHeight=22;
 private int codeY=22;
 private final char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G',
   'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
   'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6',
   '7', '8', '9' };
 
 protected void doGet(HttpServletRequest request,
   HttpServletResponse response) throws ServletException,
   java.io.IOException {
  BufferedImage Img = new BufferedImage(width, height,
    BufferedImage.TYPE_INT_RGB);
  
  Graphics g = Img.getGraphics();
  
  Random random = new Random();
  g.setColor(Color.WHITE);
  g.fillRect(0, 0, width, height);
  Font font = new Font("Times new Roman", Font.PLAIN, fontHeight);
  g.setColor(Color.black);
  g.setFont(font);
  Color juneFont = new Color(153, 204, 102);
  g.setColor( juneFont );
  for (int i = 0; i < 130; i++) {
   
   int x= random.nextInt(width);
   int y = random.nextInt(height);
   int xl = random.nextInt(16);  //80/5=16
   int yl = random.nextInt(16);
   g.drawLine(x, y, x + xl, y + yl);
   
  }
  StringBuffer randomCode = new StringBuffer();
  for (int i = 0; i < codeCount; i++) {
   String strRand = String.valueOf(codeSequence[random.nextInt(36)]);
   
   g.setColor(new Color(20 + random.nextInt(110), 20 + random
     .nextInt(110), 20 + random.nextInt(110)));
   
   g.drawString(strRand, (i + 1) * x-4, codeY);
   randomCode.append(strRand);
  }
  HttpSession session = request.getSession(); 
  session.setAttribute("realcode", randomCode.toString());
  response.setHeader("Pragma", "no-cache");    
  response.setHeader("Cache-Control", "no-cache");
  response.setDateHeader("Expires", 0);      
  response.setContentType("image/gif");      
  
  ServletOutputStream sos = response.getOutputStream();
  ImageIO.write(Img, "gif", sos);          
  sos.flush();    
  sos.close();
 }
}