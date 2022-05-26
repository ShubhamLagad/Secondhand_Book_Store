<%@page import="java.sql.*"%>
<%@ include file="./connection.jsp"%>
<%
    String bno = request.getParameter("bno");
    String email = request.getParameter("email");
    try{
        String sql = "delete from cart where book_no='"+bno+"'";
        PreparedStatement st = connection.prepareStatement(sql);
        st.executeUpdate();

        String sql1 = "delete from books where bno='"+bno+"'";
        PreparedStatement st1 = connection.prepareStatement(sql1);
        st1.executeUpdate();

        response.sendRedirect("../viewBooks.jsp");
    }catch(Exception e){
        out.print(e);
    }
%>