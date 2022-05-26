<%@page import="java.sql.*"%>
<%@ include file="./connection.jsp"%>

<%
    String bookNo = request.getParameter("bookNo");
    String orderId = request.getParameter("orderId");
    int len = Integer.parseInt(request.getParameter("len"));
    String orderStatus = "Cancelled";
    String bookStatus = "";
    if(len>10){
        bookStatus = "Not Available";
    }else{
        bookStatus = "Pending";
    }
    

    try {
        String query = "update books set status=? where bno=?";
        PreparedStatement pstat = connection.prepareStatement(query);
        pstat.setString(1,bookStatus);
        pstat.setString(2,bookNo);
        pstat.executeUpdate();

        String sql = "update orders set status=? where order_id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1,orderStatus);
        ps.setString(2,orderId);
        ps.executeUpdate();

        response.sendRedirect("../myOrders.jsp");
    } catch (Exception e) {
       out.println(e);
    }
%>