<%@page import="java.sql.*"%>
<%@ include file="./connection.jsp"%>
<%

    String cno = request.getParameter("cno");
   try{
        String sql = "delete from cart where cno = '"+cno+"'";
        PreparedStatement ps = connection.prepareStatement(sql);
        int rs = ps.executeUpdate();
        response.sendRedirect("../myCart.jsp");

   }catch(Exception e){
       out.print(e);
   }
%>