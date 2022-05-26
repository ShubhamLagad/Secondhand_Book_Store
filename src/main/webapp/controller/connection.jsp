<%-- 
    Document   : connect
    Created on : 31-Jan-2022, 7:06:46 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
    Connection connection = null;
    try {

        //Class.forName("com.mysql.jdbc.Driver"); This is deprecated
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/secondhand_book", "root", "");
        String sql = "";

    } catch (Exception e) {
        System.out.println(e);
    }
%>
