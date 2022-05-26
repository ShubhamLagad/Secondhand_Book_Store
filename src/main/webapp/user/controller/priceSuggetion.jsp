<%@page import="java.sql.*" %>
<%@ include file="./connection.jsp" %>
<script>console.log("hello")</script>
<%
    String bno = request.getParameter("bno");
    String owner = request.getParameter("owner");
    String price = request.getParameter("price");
    String userName = (String)session.getAttribute("name");


    try{
        String sql = "Insert into pricesuggetion(srno,book_no,Owner,suggestedUser,price) values(?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1,null);
        ps.setString(2,bno);
        ps.setString(3,owner);
        ps.setString(4,userName);
        ps.setString(5,price);
        ps.executeUpdate();
    }catch(Exception e){
        out.print(e);
    }

    

%>