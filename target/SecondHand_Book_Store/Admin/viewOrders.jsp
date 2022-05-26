<%
    if(session.getAttribute("adminEmail")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@page import="java.sql.*"%>
<%@ include file="./controller/connection.jsp"%>
<%
    String userEmail = (String)session.getAttribute("email");

    String sql = "select order_no,order_id,buyer_name,selling_date,address,sum(price),payment_mode,book_no from orders GROUP BY order_id ORDER BY order_no";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    int count = 0;
    
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <title>Orders</title>
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
            font-size: 5px;
            display: inline-block;
            color: red;
        }


        .table td,
        .table th {
            padding: .20rem;
            vertical-align: top; 
            border-top: 1px solid #dee2e6
        }
        .navbar-brand{
            font-size:large;
        }

    }

    @media screen and (max-width:1481px) {
        table {
            font-size: 10px;
            display: inline-block;
            color: red;
        }


        .table td,
        .table th {
            padding: .50rem;
            vertical-align: top; 
            border-top: 1px solid #dee2e6
        }
        .navbar-brand{
            font-size:large;
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
                                <i class="fa fa-user-circle fa-2x" style="font-size:x-large;"> Hi, <%
                                        out.print(session.getAttribute("adminEmail"));%></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="./changePassword.jsp"><i class="fas fa fa-key"></i>
                                    Change
                                    Password</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href=""><i class="fas fa fa-gear"></i> Setting</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" data-toggle="modal" href="#exampleModalCenter"><i class="fa fa-bank"></i> Your Wallet</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-center" href="./controller/logout.jsp"><button
                                        class=" btn btn-danger"><i class="fas fa fa-sign-out"></i> Logout</button></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <nav class="nav nav-justified bg-dark p-2 m-2 rounded shadow ">
            
              <a class="nav-item nav-link text-white active" href="viewBooks.jsp">View Books</a>
        <a class="nav-item nav-link rounded text-white" href="viewOrders.jsp">View Orders</a>
        <a class="nav-item nav-link rounded text-white" href="viewUsers.jsp">View Users</a>
        </nav>
    </section>

    <section>
        <div class="jumbotron m-4 text-capitalize">
            <h2 class="text-center head-shadow text-dark">Orders</h2>
            <hr>
            <table class="table text-center rounded shadow bg-light">
                <thead class="thead-dark shadow-lg">
                    <tr>
                        <th scope="col">Sr.No.</th>
                        <th scope="col">Username</th>
                        <th scope="col">Order ID</th>
                        <th scope="col">Date</th>
                        <th scope="col">Shipping Address</th>
                        <th scope="col">Total Amount</th>
                        <th scope="col">Mode of Payment</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    while(rs.next()){
                        count++;
                    String sql2 = "select * from books where bno = '"+rs.getString("book_no")+"'";
                    Statement st2 = connection.createStatement();
                    ResultSet rs2 = st2.executeQuery(sql2);
                    rs2.next();
                %>
                    <tr>
                        <td><% out.print(count); %></td>
                        <td><% out.print(rs.getString("buyer_name")); %></td>
                        <td><% out.print(rs.getString("order_id")); %></td>
                        <td><% out.print(rs.getString("selling_date")); %></td>
                        <td><% out.print(rs.getString("address")); %></td>
                        <td><% out.print(rs.getString(6)); %></td>
                        <td><% out.print(rs.getString("payment_mode")); %></td>
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