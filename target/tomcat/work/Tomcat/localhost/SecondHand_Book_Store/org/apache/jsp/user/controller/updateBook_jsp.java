/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2022-04-28 06:17:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.user.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.util.Date;
import java.text.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;

public final class updateBook_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/user/controller/./connection.jsp", Long.valueOf(1648636637019L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Connection connection = null;
    try {

        //Class.forName("com.mysql.jdbc.Driver"); This is deprecated
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/secondhand_book", "root", "");
        String sql = "";

    } catch (Exception e) {
        System.out.println(e);
    }

      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");

    String bno = request.getParameter("bno");
    String bookName = request.getParameter("bookName");
    String autherName = request.getParameter("autherName");
    String category = request.getParameter("category");
    String bookLanguage = request.getParameter("bookLanguage");
    String purchaseDate = request.getParameter("purchaseDate");
    String bookCondition = request.getParameter("bookCondition");

    int oprice = Integer.parseInt(request.getParameter("originalPrice"))+40;
    String originalPrice = ""+oprice;
    //String originalPrice = request.getParameter("originalPrice");
    int price = Integer.parseInt(request.getParameter("sellingPrice"))+40;
    String sellingPrice = ""+price;
    //String originalPrice = request.getParameter("originalPrice");

    String description = request.getParameter("description");
    String imageFile = request.getParameter("imageFile");
    String userEmail = (String)session.getAttribute("email");
    String status = "Pending";

    Date date = new Date();

    SimpleDateFormat ft = new SimpleDateFormat ("00-00-0000");
    String selling_date = ft.format(date);

    SimpleDateFormat uft = new SimpleDateFormat ("dd-MM-YYYY");
    String upload_date = uft.format(date);

    try{
    
        String sql = "update books set book_name=?,auther_name=?,category=?,book_language=?,purchase_date=?,book_condition=?,original_price=?,selling_price=?,description=?,image=? where user=? and bno=?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, bookName);
            ps.setString(2, autherName);
            ps.setString(3, category);
            ps.setString(4, bookLanguage);
            ps.setString(5, purchaseDate);
            ps.setString(6, bookCondition);
            ps.setString(7, originalPrice);
            ps.setString(8, sellingPrice);
            ps.setString(9, description);
            ps.setString(10, imageFile);
            ps.setString(11, userEmail);
            ps.setString(12, bno);
            ps.executeUpdate();
            response.sendRedirect("../myBooks.jsp?updatemsg=success");
    
    }catch(Exception e){
        out.print(e);
    }

  

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
