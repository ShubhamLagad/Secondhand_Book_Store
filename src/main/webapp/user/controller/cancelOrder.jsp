<%@page import="java.sql.*,java.util.Date, java.text.*"%>
<%@ include file="./connection.jsp"%>

<%
    String bookNo = request.getParameter("bookNo");
    String orderId = request.getParameter("orderId");
    int len = Integer.parseInt(request.getParameter("len"));
    String orderStatus = "Cancelled";
    Date date = new Date();
    SimpleDateFormat ft = new SimpleDateFormat ("00-00-0000");
    String selling_date = ft.format(date);

    String bookStatus = "";
    if(len>10){
        bookStatus = "Not Available";
    }else{
        bookStatus = "Not Sold";
    }
    

    try {
        String query = "update books set status=?, selling_date=? where bno=?";
        PreparedStatement pstat = connection.prepareStatement(query);
        pstat.setString(1,bookStatus);
        pstat.setString(2,selling_date);
        pstat.setString(3,bookNo);
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