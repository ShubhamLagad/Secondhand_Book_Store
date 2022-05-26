<%@page import="java.sql.*" %>
<%@ include file="./connection.jsp" %>
<%
   try{
        String email = request.getParameter("adminEmail");
        String password = request.getParameter("adminPassword");
        String sql = "select * from admin where email='"+email+"' and password='"+password+"'";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(sql);
        if(rs.next()){
            session.setAttribute("adminEmail",rs.getString("email"));
            response.sendRedirect("../Admin/index.jsp?loginMsg=success");
        }else{
             response.sendRedirect("../index.jsp?adminmsg=failed");
        }
   }catch(Exception e){
       out.println(e);
   }
%>