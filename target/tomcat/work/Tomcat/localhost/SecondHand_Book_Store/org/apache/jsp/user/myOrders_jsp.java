/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2022-05-06 08:51:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;
import java.util.*;

public final class myOrders_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/user/./controller/connection.jsp", Long.valueOf(1648636637019L));
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


    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }

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
      out.write('\r');
      out.write('\n');

    String userEmail = (String)session.getAttribute("email");

    String sql3 = "select * from cart where user = '"+userEmail+"'";
    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql3);
    int count = 0;
    while(rs3.next()){
        count++;
    }

    String sql = "select * from orders where buyer_email='"+userEmail+"'";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    int orderCount=0;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("    <title>Your Orders</title>\r\n");
      out.write("    <link rel=\"icon\" href=\"../images/icon.png\">\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\">\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"keywords\" content=\"\">\r\n");
      out.write("    <meta name=\"author\" content=\"\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/bootstrap.min.css\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/font-awesome.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/aos.css\">\r\n");
      out.write("\r\n");
      out.write("    <!-- MAIN CSS -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/style.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<style>\r\n");
      out.write("    .cart-basket {\r\n");
      out.write("        font-size: 12px;\r\n");
      out.write("        position: absolute;\r\n");
      out.write("        top: -6px;\r\n");
      out.write("        right: -5px;\r\n");
      out.write("        width: 18px;\r\n");
      out.write("        height: 22px;\r\n");
      out.write("        color: #fff;\r\n");
      out.write("        background-color: red;\r\n");
      out.write("        border-radius: 40%;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @media screen and (max-width:481px) {\r\n");
      out.write("        table {\r\n");
      out.write("            font-size: 4.5px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .table td,\r\n");
      out.write("        .table th {\r\n");
      out.write("            padding: .1rem;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .navbar-brand {\r\n");
      out.write("            font-size: large;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        img {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 50%;\r\n");
      out.write("        }\r\n");
      out.write("        .container-sm{\r\n");
      out.write("            display:inline;\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("     <section>\r\n");
      out.write("        <nav class=\"navbar navbar-expand-sm navbar-light bg-light position-relative p-1 m-2 rounded shadow-lg\">\r\n");
      out.write("            <a class=\"navbar-brand p-1 head-shadow text-danger\" href=\"index.jsp\">SECONDHAND-BOOK STORE</a>\r\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\"\r\n");
      out.write("                aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("            </button>\r\n");
      out.write("            <div class=\"navbar-collapse \" id=\"navbarSupportedContent\">\r\n");
      out.write("                <div class=\"navbar-nav ml-auto mr-lg-5\">\r\n");
      out.write("                    <ul class=\"navbar-nav\">\r\n");
      out.write("                        <li class=\"nav-link nav-item mr-lg-2 dropdown\" id=\"navbarSupportedContent\">\r\n");
      out.write("                            <a class=\"dropdown-toggle text-dark\" href=\"#\" role=\"button\" id=\"dropdownMenuLink\"\r\n");
      out.write("                                data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("                                <i class=\"fa fa-user-circle fa-2x\" style=\"font-size:x-large;\"> <span class=\"text-capitalize\">Hi, ");

                                        out.print(session.getAttribute("name"));
      out.write("</span></i>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuLink\">\r\n");
      out.write("                               <a class=\"dropdown-item\" href=\"./yourProfile.jsp\"><i class=\"fa fa-user\"></i> Your\r\n");
      out.write("                                    Profile</a>\r\n");
      out.write("                                <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                                <a class=\"dropdown-item\" href=\"./myOrders.jsp\"><i class=\"fa fa-shopping-bag\"></i> Your\r\n");
      out.write("                                    Orders</a>\r\n");
      out.write("                                <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                                <a class=\"dropdown-item\" href=\"./changePassword.jsp\"><i class=\"fas fa fa-key\"></i>\r\n");
      out.write("                                    Change\r\n");
      out.write("                                    Password</a>\r\n");
      out.write("                                <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                                <a class=\"dropdown-item\" href=\"./bankAccount.jsp\"><i class=\"fas fa fa-plus\"></i> Add\r\n");
      out.write("                                    Bank\r\n");
      out.write("                                    Account</a>\r\n");
      out.write("                                <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                                <a class=\"dropdown-item\" data-toggle=\"modal\" href=\"#exampleModalCenter\"><i class=\"fa fa-bank\"></i> Your Wallet</a>\r\n");
      out.write("                                <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                                <a class=\"dropdown-item text-center\" href=\"./controller/logout.jsp\"><button\r\n");
      out.write("                                        class=\" btn btn-danger\"><i class=\"fas fa fa-sign-out\"></i> Logout</button></a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-link nav-item\">\r\n");
      out.write("                            <a href=\"myCart.jsp\" class=\"cart position-relative d-inline-flex\">\r\n");
      out.write("                                <i class=\"fa fa-shopping-cart fa-2x\"></i>\r\n");
      out.write("                                <span class=\"cart-basket d-flex align-items-center justify-content-center\">\r\n");
      out.write("                                    <strong>\r\n");
      out.write("                                        ");
 out.print(count); 
      out.write("\r\n");
      out.write("                                    </strong>\r\n");
      out.write("                                </span>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <nav class=\"nav nav-justified bg-dark p-2 m-2 rounded shadow \">\r\n");
      out.write("            \r\n");
      out.write("            <a class=\"nav-item nav-link rounded text-white\" href=\"uploadBook.jsp\">Upload\r\n");
      out.write("                Books</a>\r\n");
      out.write("            <a class=\"nav-item nav-link rounded text-white\" href=\"myBooks.jsp\">Your Books</a>\r\n");
      out.write("            <a class=\"nav-item nav-link rounded text-white\" href=\"viewBooks.jsp\">View Books</a>\r\n");
      out.write("        </nav>\r\n");
      out.write("    </section>\r\n");
      out.write("\r\n");
      out.write("    <section>\r\n");
      out.write("        <div class=\"jumbotron text-capitalize text-center m-4\">\r\n");
      out.write("            <h2 class=\"head-shadow text-dark\">Orders</h2>\r\n");
      out.write("            <hr>\r\n");
      out.write("            <table class=\"table bg-light rounded shadow-lg\">\r\n");
      out.write("                <thead class=\"bg-dark text-white shadow\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th scope=\"col\">Sr.No.</th>\r\n");
      out.write("                        <th scope=\"col\">Order ID</th>\r\n");
      out.write("                        <th scope=\"col\">Book Name</th>\r\n");
      out.write("                        <th scope=\"col\">Book Image</th>\r\n");
      out.write("                        <th scope=\"col\">Order Date</th>\r\n");
      out.write("                        <th scope=\"col\">Shipping Address</th>\r\n");
      out.write("                        <th scope=\"col\">Total Amount</th>\r\n");
      out.write("                        <th scope=\"col\">Mode of Payment</th>\r\n");
      out.write("                        <th scope=\"col\">Status</th>\r\n");
      out.write("                        <th scope=\"col\">Cancel Order</th>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                <tbody class=\"\">\r\n");
      out.write("                ");

                    while(rs.next()){
                        String sql2 = "select * from books where bno='"+rs.getString("book_no")+"'";
                        Statement st2 = connection.createStatement();
                        ResultSet rs2 = st2.executeQuery(sql2);
                        rs2.next(); 
                        orderCount++;
                
      out.write("\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>");
 out.print(orderCount); 
      out.write("</td>\r\n");
      out.write("                        <td>");
 out.print(rs.getString("order_id")); 
      out.write("</td>\r\n");
      out.write("                        <td>");
 out.print(rs2.getString("book_name")); 
      out.write("</td>\r\n");
      out.write("                        <td><img class=\"shadow\" src=\"../images/Book/");
 out.print(rs2.getString("image")); 
      out.write("\" width=\"100px\" height=\"120px\"></td>\r\n");
      out.write("                        <td>");
 out.print(rs.getString("selling_date")); 
      out.write("</td>\r\n");
      out.write("                        <td>");
 out.print(rs.getString("address")); 
      out.write("<br>Mob No. ");
 out.print(rs.getString("mobile_no")); 
      out.write("</td>\r\n");
      out.write("                        <td>");
 out.print(rs.getString("price")); 
      out.write("</td>\r\n");
      out.write("                        <td>");
 out.print(rs.getString("payment_mode")); 
      out.write("</td>\r\n");
      out.write("                        <td>");
 if(rs.getString("status").length()==7){ 
                                    
      out.write("<span class=\"text-success\">");
out.print(rs.getString("status"));
      out.write("</span>");

                            } else{
      out.write("<span class=\"text-danger\">");
out.print(rs.getString("status"));
      out.write("</span>");
}
                            
      out.write("\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td><a href=\"./controller/cancelOrder.jsp?orderId=");
 out.print(rs.getString("order_id")); 
      out.write("&bookNo=");
out.print(rs.getString("book_no"));
      out.write("&len=");
out.print(rs.getString("status").length());
      out.write("\" class=\"btn btn-danger text-white ");
 if(rs.getString("status").length()==7||rs.getString("status").length()>10){ 
                                out.print("");
                            } else{out.print("disabled");}
                            
      out.write("\"  onclick=\"return confirm('Are you sure, you want to cancel this order?')\">Cancel</a></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                   ");
 }
      out.write("\r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </section>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- FOOTER -->\r\n");
      out.write("    <footer class=\"site-footer\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"ml-auto col-lg-4 col-md-5\">\r\n");
      out.write("                    <p class=\"copyright-text\">Copyright &copy; 2022 SecondHand Book-Store\r\n");
      out.write("\r\n");
      out.write("                        <br>Design By: <a href=\"#\">Shubham Lagad</a>\r\n");
      out.write("                    </p>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"d-flex justify-content-center mx-auto col-lg-5 col-md-7 col-12\">\r\n");
      out.write("                    <p class=\"mr-4\">\r\n");
      out.write("                        <i class=\"fa fa-envelope-o mr-1\"></i>\r\n");
      out.write("                        <a href=\"#\">shubhamlagad2000@gmail.com</a>\r\n");
      out.write("                    </p>\r\n");
      out.write("                    <p><i class=\"fa fa-phone mr-1\"></i> +91 8007878524</p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </footer>\r\n");
      out.write("\r\n");
      out.write(" <!-- wallet model -->\r\n");
      out.write("    ");

    String sql4 = "select wallet from users where email = '"+userEmail+"'";
    Statement st4 = connection.createStatement();
    ResultSet rs4 = st4.executeQuery(sql4);
    rs4.next();

    String sql5 = "select * from bankaccounts where email = '"+userEmail+"'";
    Statement st5 = connection.createStatement();
    ResultSet rs5 = st5.executeQuery(sql5);
    int flag=1;
    
    
      out.write("\r\n");
      out.write("    <!-- Button trigger modal -->\r\n");
      out.write("  <div class=\"modal fade\" id=\"exampleModalCenter\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\r\n");
      out.write("    <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\r\n");
      out.write("      <div class=\"modal-content\">\r\n");
      out.write("        <div class=\"modal-header\">\r\n");
      out.write("          <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("            <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("          </button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"modal-body\">\r\n");
      out.write("            <div class=\"card shadow-lg m-2\">\r\n");
      out.write("                <div class=\"card-body text-dark text-center head-shadow\">\r\n");
      out.write("                    <h2 class=\"card-title\"><strong>Your Wallet</strong></h2>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    <h4 class=\"card-title\">Current Balance</h4>\r\n");
      out.write("                    <h3 class=\"card-text text-danger\"><i class=\"fa fa-rupee fa-1x\"> </i> <strong>");
out.println(rs4.getString(1));
      out.write("</strong></h3>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    <button class=\"btn btn-outline-secondary\" data-toggle=\"modal\" data-target=\"#withdrafundmodel\">Withdraw Balance</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"modal-footer\">\r\n");
      out.write("          <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("    <!-- Withdraw balance module -->\r\n");
      out.write("  <div class=\"modal fade\" id=\"withdrafundmodel\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\r\n");
      out.write("    <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\r\n");
      out.write("      <div class=\"modal-content\">\r\n");
      out.write("        <div class=\"modal-header\">\r\n");
      out.write("          <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("            <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("          </button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"modal-body\">\r\n");
      out.write("         <form action=\"./controller/withdrawBalance.jsp\" method=\"post\">\r\n");
      out.write("                <h4 class=\"text-success\"><strong>Withdrawable ammount : <i class=\"fa fa-rupee fa-1x\"> </i> ");
out.println(rs4.getString(1));
      out.write("</strong></h4>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                  <label for=\"recipient-name\" class=\"col-form-label\">Enter amount : </label>\r\n");
      out.write("                  <input type=\"number\" class=\"form-control\" name=\"amount\" placeholder=\"Enter amount to withdraw\" min=\"1\" max=\"");
out.print(Integer.parseInt(rs4.getString(1)));
      out.write("\" required>\r\n");
      out.write("                </div>\r\n");
      out.write("                <label for=\"recipient-name\" class=\"col-form-label\">Choose Bank Account : </label>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                ");
 while(rs5.next()){
                    flag=0;
                    
      out.write("\r\n");
      out.write("                <div class=\"form-check\">\r\n");
      out.write("                    <input class=\"form-check-input\" type=\"radio\" name=\"bankName\" value=\"");
out.print(rs5.getString("bank_name"));
      out.write("\" id=\"inlineRadio1\" value=\"\" required>\r\n");
      out.write("                    <label class=\"form-check-label\" for=\"inlineRadio1\">");
out.print(rs5.getString("bank_name"));
      out.write("</label>\r\n");
      out.write("                  </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");
}
      out.write("\r\n");
      out.write("                <div class=\"form-group text-right\">\r\n");
      out.write("                    <a href=\"./bankAccount.jsp\"><i class=\"fa fa-plus\"></i> Add new bank account</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");
if(flag==1){
                    
      out.write("\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                  <button type=\"button\" onclick=\"alert('Please add your bank account.')\" class=\"btn btn-outline-primary\">Withdraw</button>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");
}else{
      out.write("\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                  <button type=\"submit\" class=\"btn btn-outline-primary\">Withdraw</button>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");
}
      out.write("\r\n");
      out.write("         </form>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("    <!-- SCRIPTS -->\r\n");
      out.write("    <script src=\"../js/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"../js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"../js/aos.js\"></script>\r\n");
      out.write("    <script src=\"../js/smoothscroll.js\"></script>\r\n");
      out.write("    <script src=\"../js/custom.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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
