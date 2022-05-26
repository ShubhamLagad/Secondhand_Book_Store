<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.util.Date, java.text.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="./connection.jsp"%>

<%
    String userEmail=(String)session.getAttribute("email");
    String name = request.getParameter("updateName");
    String email = request.getParameter("updateEmail");
    String gender = request.getParameter("updateGender");
    String conactNo = request.getParameter("updateContactNo");
    String address = request.getParameter("updateAddress");
    try{
    
        String sql = "update users set name=?,email=?,gender=?,contactNo=?,address=? where email=?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, gender);
            ps.setString(4, conactNo);
            ps.setString(5, address);
            ps.setString(6, userEmail);
            ps.executeUpdate();
            session.removeAttribute("name");
            session.setAttribute("name", name); 
            session.removeAttribute("email");
            session.setAttribute("email", email); 
            response.sendRedirect("../yourProfile.jsp?updatemsg=success");
    
    }catch(Exception e){
        out.print(e);
    }

  
%>