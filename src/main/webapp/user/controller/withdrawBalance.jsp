<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="./connection.jsp"%>

<%
    String userEmail = (String)session.getAttribute("email");
    String amount = request.getParameter("amount");
    String sql = "update users set wallet=wallet-'"+amount+"' where email='"+userEmail+"'";
    PreparedStatement ps = connection.prepareStatement(sql);
    int result = ps.executeUpdate();

    response.sendRedirect("../index.jsp");

%>