<%@ include file="./connection.jsp" %>
<%@page import="java.sql.*"%>

<%
    try {
        String email = (String)session.getAttribute("adminEmail");
        String password = request.getParameter("forgetCpassword");

        String sql = "update admin set password=? where email=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1,password);
        ps.setString(2,email);
        int result = ps.executeUpdate();
        if(session.getAttribute("adminEmail")==null){
            response.sendRedirect("../../index.jsp?passMsg=success");
        }else{
            response.sendRedirect("../index.jsp?passMsg=success");
        }
        
    } catch (Exception e) {
        out.println(e);
    }
%>