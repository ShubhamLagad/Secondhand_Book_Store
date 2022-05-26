<%@ page import="java.io.*" %>
<%@ page import="java.util.*,java.util.Date, java.text.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="./connection.jsp"%>

<%
    String book_no = request.getParameter("book_no");
    String[] book_arr = book_no.split("_");

    String buyerName = request.getParameter("buyerName");
    String buyerEmail = (String)session.getAttribute("email");
    String mobileNo = request.getParameter("mobileNo");

    String district = request.getParameter("district");
    String pinCode = request.getParameter("pinCode");
    String address = request.getParameter("address") +","+district+""+pinCode;
    String status = "Success";

    

    String paymentMode = request.getParameter("paymentMode");
    String orderId = (int)(Math.random() * 100) + mobileNo;
    Date date = new Date();
    SimpleDateFormat uft = new SimpleDateFormat ("dd-MM-YYYY");
    String sellingDate = uft.format(date);

    try{

        for(int i=0; i<book_arr.length; i++){
            String bno = book_arr[i];
            
            String sql3 = "Select * from books where bno='"+bno+"'";
            Statement st3 = connection.createStatement();
            ResultSet rs3 = st3.executeQuery(sql3);
            rs3.next();
            int price = Integer.parseInt(rs3.getString("selling_price"))+40;

            String sql = "insert into orders(order_no,order_id,buyer_name,buyer_email,mobile_no,address,book_no,price,payment_mode,selling_date,status) values(?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,null);
            ps.setString(2,orderId);
            ps.setString(3,buyerName);
            ps.setString(4,buyerEmail);
            ps.setString(5,mobileNo);
            ps.setString(6,address);
            ps.setString(7,bno);
            ps.setInt(8,price);
            ps.setString(9,paymentMode);
            ps.setString(10,sellingDate);
            ps.setString(11,status);
            ps.executeUpdate();

            String sql2 = "update books set status=?,selling_date=? where bno=?";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setString(1,"Sold");
            ps2.setString(2,sellingDate);
            ps2.setString(3,bno);
            ps2.executeUpdate();
        }
        //out.print("success");
        response.sendRedirect("../orderConfirm.jsp?orderId="+orderId+"");
    }catch(Exception e){
        out.print(e);
    }
%>