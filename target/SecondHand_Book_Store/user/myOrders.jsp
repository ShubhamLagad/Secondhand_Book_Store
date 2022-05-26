<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@page import="java.sql.*"%>
<%@ include file="./controller/connection.jsp"%>
<%
    String userEmail = (String)session.getAttribute("email");

    String sql3 = "select * from cart where user = '"+userEmail+"'";
    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql3);
    int count = 0;
    while(rs3.next()){
        count++;
    }

    String sql = "select * from orders where buyer_email='"+userEmail+"'";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    int orderCount=0;
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>Your Orders</title>
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
            font-size: 4.5px;
        }

        .table td,
        .table th {
            padding: .1rem;
        }

        .navbar-brand {
            font-size: large;
        }

        img {
            width: 100%;
            height: 50%;
        }
        .container-sm{
            display:inline;
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

    <section>
        <div class="jumbotron text-capitalize text-center m-4">
            <h2 class="head-shadow text-dark">Orders</h2>
            <hr>
            <table class="table bg-light rounded shadow-lg">
                <thead class="bg-dark text-white shadow">
                    <tr>
                        <th scope="col">Sr.No.</th>
                        <th scope="col">Order ID</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Date</th>
                        <th scope="col">Shipping Address</th>
                        <th scope="col">Total Amount</th>
                        <th scope="col">Mode of Payment</th>
                        <th scope="col">Status</th>
                        <th scope="col">Cancel Order</th>
                    </tr>
                </thead>
                <tbody class="">
                <%
                    while(rs.next()){
                        String sql2 = "select * from books where bno='"+rs.getString("book_no")+"'";
                        Statement st2 = connection.createStatement();
                        ResultSet rs2 = st2.executeQuery(sql2);
                        rs2.next(); 
                        orderCount++;
                %>
                    <tr>
                        <td><% out.print(orderCount); %></td>
                        <td><% out.print(rs.getString("order_id")); %></td>
                        <td><% out.print(rs2.getString("book_name")); %></td>
                        <td><% out.print(rs.getString("selling_date")); %></td>
                        <td><% out.print(rs.getString("address")); %><br>Mob No. <% out.print(rs.getString("mobile_no")); %></td>
                        <td><% out.print(rs.getString("price")); %></td>
                        <td><% out.print(rs.getString("payment_mode")); %></td>
                        <td><% if(rs.getString("status").length()==7){ 
                                    %><span class="text-success"><%out.print(rs.getString("status"));%></span><%
                            } else{%><span class="text-danger"><%out.print(rs.getString("status"));%></span><%}
                            %>
                        </td>
                        <td><a href="./controller/cancelOrder.jsp?orderId=<% out.print(rs.getString("order_id")); %>&bookNo=<%out.print(rs.getString("book_no"));%>&len=<%out.print(rs.getString("status").length());%>" class="btn btn-danger text-white <% if(rs.getString("status").length()==7||rs.getString("status").length()>10){ 
                                out.print("");
                            } else{out.print("disabled");}
                            %>"  onclick="return confirm('Are you sure, you want to cancel this order?')">Cancel</a></td>
                    </tr>
                   <% }%>
                </tbody>
            </table>


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