<%@ include file="./connection.jsp" %>
<%@page import="java.sql.*"%>

<%
    try {
        String email = request.getParameter("email");
        String answer = request.getParameter("answer");
        String password = request.getParameter("forgetCpassword");

        String sql = "update users set password=? where email=? and answer=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1,password);
        ps.setString(2,email);
        ps.setString(3,answer);
        int result = ps.executeUpdate();
        if(result==1){
            if(session.getAttribute("email")==null){
                response.sendRedirect("../../index.jsp?passMsg=success");
            }else{
                response.sendRedirect("../index.jsp?passMsg=success");
            }
        }else{
            if(session.getAttribute("email")==null){
                response.sendRedirect("../../index.jsp?passFailedMsg=failed");
            }else{
                response.sendRedirect("../changePassword.jsp?passMsg=failed");
            }
           
        }
        out.println("success");
    } catch (Exception e) {
        out.println(e);
    }
%>