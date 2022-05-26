<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@page import="java.sql.*"%>
<%@ include file="./controller/connection.jsp"%>
<%

    String userEmail = (String)session.getAttribute("email");

    String sql = "select * from cart where user = '"+userEmail+"'";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    int totalPrice = 0;

    String sql3 = "select * from cart where user = '"+userEmail+"'";
    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql3);
    int count = 0;
    while(rs3.next()){
        count++;
    }
    String book_no="";
    int flag=1;
%>


<!DOCTYPE html>
<html lang="en">

<head>

    <title>Your Cart</title>
    <link rel="icon" href="../images/icon.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="../css/style.css">
</head>
<style>
    .cart-basket {
        font-size: 12px;
        position: absolute;
        top: -6px;
        right: -5px;
        width: 18px;
        height: 22px;
        color: #fff;
        background-color: red;
        border-radius: 40%;
    }

    @media screen and (max-width:481px) {
        table {
            font-size: 10px;
        }

        .table td,
        .table th {
            padding: .3rem;
        }

        .navbar-brand {
            font-size: large;
        }

        table img {
            width: 60px;
            height: 60px;
        }

        .mainImg {
            width: 100%;
            height: 50%;
        }

        .btn-danger,.btn-dark {
            font-size:xx-small;
        }
       
    }
</style>

<body>
     <section>
        <nav class="navbar navbar-expand-sm navbar-light bg-light position-relative p-1 m-2 rounded shadow-lg">
            <a class="navbar-brand p-1 head-shadow text-danger" href="index.jsp">SECONDHAND-BOOK STORE</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse " id="navbarSupportedContent">
                <div class="navbar-nav ml-auto mr-lg-5">
                    <ul class="navbar-nav">
                        <li class="nav-link nav-item mr-lg-2 dropdown" id="navbarSupportedContent">
                            <a class="dropdown-toggle text-dark" href="#" role="button" id="dropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user-circle fa-2x" style="font-size:x-large;"> <span class="text-capitalize">Hi, <%
                                        out.print(session.getAttribute("name"));%></span></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                               <a class="dropdown-item" href="./yourProfile.jsp"><i class="fa fa-user"></i> Your
                                    Profile</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="./myOrders.jsp"><i class="fa fa-shopping-bag"></i> Your
                                    Orders</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="./changePassword.jsp"><i class="fas fa fa-key"></i>
                                    Change
                                    Password</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="./bankAccount.jsp"><i class="fas fa fa-plus"></i> Add
                                    Bank
                                    Account</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" data-toggle="modal" href="#exampleModalCenter"><i class="fa fa-bank"></i> Your Wallet</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-center" href="./controller/logout.jsp"><button
                                        class=" btn btn-danger"><i class="fas fa fa-sign-out"></i> Logout</button></a>
                            </div>
                        </li>
                        <li class="nav-link nav-item">
                            <a href="myCart.jsp" class="cart position-relative d-inline-flex">
                                <i class="fa fa-shopping-cart fa-2x"></i>
                                <span class="cart-basket d-flex align-items-center justify-content-center">
                                    <strong>
                                        <% out.print(count); %>
                                    </strong>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <nav class="nav nav-justified bg-dark p-2 m-2 rounded shadow ">
            
            <a class="nav-item nav-link rounded text-white" href="uploadBook.jsp">Upload
                Books</a>
            <a class="nav-item nav-link rounded text-white" href="myBooks.jsp">Your Books</a>
            <a class="nav-item nav-link rounded text-white" href="viewBooks.jsp">View Books</a>
        </nav>
    </section>

    <section class="" id="contact">
        <div class="jumbotron m-4 text-capitalize">
            <h2 class="text-center m-4 head-shadow text-dark">Your Cart</h2>

            <table class="table table-dark rounded shadow-lg text-center">
                <thead>
                    <tr>
                        <th scope="col">Items</th>
                        <th scope="col">Details</th>
                        <th scope="col">Cost</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody class="bg-light text-dark">
                <%
                while( rs.next()){
                   
                    
                    String sql2 = "select * from books where bno = '"+rs.getString("book_no")+"'";
                    Statement st2 = connection.createStatement();
                    ResultSet rs2 = st2.executeQuery(sql2);
                     
                    while(rs2.next()){
                        if(book_no==""){
                        book_no =rs2.getString("bno");
                    }else{
                        book_no = book_no + "_" + rs2.getString("bno");
                    }
                        totalPrice = totalPrice + Integer.parseInt(rs2.getString("selling_price"));
                %>
                    <tr>
                        <td><img src="../images/Book/<% out.print(rs2.getString("image")); %>" class="shadow" alt="" width="100px" height="150px"></td>
                        <td>
                            <div class="row">
                                <div class="col-6 text-right"><b>Auther Name <br>Category <br>Purchase Date
                                        <br>Language <br>Book Condition <br>Description</b></div>
                                <div class="col-6 text-left"><% out.print(rs2.getString("auther_name")); %><br> <% out.print(rs2.getString("category")); %> <br> <% out.print(rs2.getString("purchase_date")); %> <br> <% out.print(rs2.getString("book_language")); %>
                                    <br> <% out.print(rs2.getString("book_condition")); %> <br> <% out.print(rs2.getString("description")); %></div>
                            </div>
                        </td>
                        <td><i class="fa fa-rupee fa-1x"></i><% out.print(rs2.getString("selling_price")); %></td>
                        <td><%
                            if(rs2.getString("status").length()==4 || rs2.getString("status").length()>8){
                                flag=0;
                               %>
                                    <span class="text-danger">Not Available</span>
                               <% 
                            }else{
                                 %>
                                    <span class="text-success">Available</span>
                               <% 
                            }
                        %></td>
                        <td><a href="./controller/deleteCart.jsp?cno=<% out.print(rs.getString("cno")); %>" class="btn btn-danger">Delete</a></td>
                        
                    </tr>
                <% }
                }%>
                </tbody>
            </table>

            <div class="my-4">
                Total Price : Rs. <% out.print(totalPrice); %>
            </div>
            
            <a href="<%if(book_no==""||flag==0){
                            out.println("");
                        }else{%>./orderAddress.jsp?book_no=<% out.print(book_no); %>&&price=<% out.print(totalPrice); }%>"><button
                    type="button" id="buyBtn" class="btn btn-dark px-5 my-4 shadow-lg" 
                    onclick="<% if(book_no==""||flag==0){%>alert('Books are not available?');<%
                        }%>">Buy Now</button></a>
        </div>
    </section>


    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
            <div class="row">

                <div class="ml-auto col-lg-4 col-md-5">
                    <p class="copyright-text">Copyright &copy; 2022 SecondHand Book-Store

                        <br>Design By: <a href="#">Shubham Lagad</a>
                    </p>
                </div>

                <div class="d-flex justify-content-center mx-auto col-lg-5 col-md-7 col-12">
                    <p class="mr-4">
                        <i class="fa fa-envelope-o mr-1"></i>
                        <a href="#">shubhamlagad2000@gmail.com</a>
                    </p>
                    <p><i class="fa fa-phone mr-1"></i> +91 8007878524</p>
                </div>
            </div>
        </div>
    </footer>


    <!-- SCRIPTS -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>
    

</body>

</html>