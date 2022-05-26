<%@page import="java.sql.*,java.util.*" %>
<%@ include file="./connection.jsp" %>
<%
    try {
        String email = (String)session.getAttribute("email");
        String name = (String)session.getAttribute("name");
        String comment = request.getParameter("comment");
        String sql = "insert into feedback(srno,email,name,comment) values(?,?,?,?)";
        PreparedStatement ps =connection.prepareStatement(sql);
        ps.setString(1,null);
        ps.setString(2,email);
        ps.setString(3,name);
        ps.setString(4,comment);
        ps.executeUpdate();
        // if(page!=null){
        //     response.sendRedirect("../myBooks.jsp");
        // }else{
        //     response.sendRedirect("../orderConfirm.jsp");
        // }
    } catch (Exception e) {
        out.println(e);
    }
%>