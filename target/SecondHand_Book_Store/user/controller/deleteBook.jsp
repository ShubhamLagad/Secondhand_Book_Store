<%@page import="java.sql.*"%>
<%@ include file="./connection.jsp"%>

<%
    String bookNo = request.getParameter("bno");
    String bookStatus = "Not Available";
    String orderStatus = "Sorry! Currently not available this book?";

    try {
        String query = "update books set status=? where bno=?";
        PreparedStatement pstat = connection.prepareStatement(query);
        pstat.setString(1,bookStatus);
        pstat.setString(2,bookNo);
        pstat.executeUpdate();

        String sql = "update orders set status=? where book_no=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1,orderStatus);
        ps.setString(2,bookNo);
        ps.executeUpdate();

        response.sendRedirect("../myBooks.jsp");
    } catch (Exception e) {
       out.println(e);
    }
%>