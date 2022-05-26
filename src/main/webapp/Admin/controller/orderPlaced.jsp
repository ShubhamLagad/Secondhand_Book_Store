<%@ include file="./connection.jsp" %>
<%@page import="java.sql.*"%>

<%
    try {
        String bno = request.getParameter("bno");

        String sql = "update books set status='Sold' where bno='"+bno+"'";
        PreparedStatement ps = connection.prepareStatement(sql);
        int result = ps.executeUpdate();

        String sql2 = "update orders set status='Placed' where book_no='"+bno+"'";
        PreparedStatement ps2 = connection.prepareStatement(sql2);
        int result2 = ps2.executeUpdate();

        String sql4 = "select selling_price,user from books where bno='"+bno+"'";
        PreparedStatement ps4 = connection.prepareStatement(sql4);
        ResultSet rs = ps4.executeQuery();
        rs.next();
        int wallet = Integer.parseInt(rs.getString(1))-40;
        String sql3 = "update users set wallet=wallet + '"+wallet+"' where email='"+rs.getString(2)+"'";
        PreparedStatement ps3 = connection.prepareStatement(sql3);
        int result3 = ps3.executeUpdate();

        response.sendRedirect("../viewOrders.jsp");

    } catch (Exception e) {
        out.println(e);
    }
%>