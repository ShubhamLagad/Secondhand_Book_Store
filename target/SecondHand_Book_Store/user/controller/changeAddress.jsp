<%@page import="java.sql.*,java.util.*" %>
<%@ include file="./connection.jsp" %>
<%
    try {
        String address = request.getParameter("address")+" "+request.getParameter("district")+" "+request.getParameter("pincode");
        String orderId = request.getParameter("orderId");
        String sql = "update orders set address=? where order_id=?";
        PreparedStatement ps =connection.prepareStatement(sql);
        ps.setString(1,address);
        ps.setString(2,orderId);
        ps.executeUpdate();
        response.sendRedirect("../orderConfirm.jsp?orderId="+orderId);
        
    } catch (Exception e) {
        out.println(e);
    }
%>