<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@ page import="java.sql.*"%>
<%@ include file="./controller/connection.jsp" %>

<%
    String userEmail = (String)session.getAttribute("email");
   
    
    String sql3 = "select * from cart where user = '"+userEmail+"'";
    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql3);
    int countCart = 0;
    while(rs3.next()){
        countCart++;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <title>Books for sell</title>
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
                                        <% out.print(countCart); %>
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

    <!-- CONTACT -->
    <section class="" id="contact">
        <div class="jumbotron m-4 text-capitalize">
            <h2 class="text-center head-shadow text-dark">Books for Selling</h2>
            <hr>
            <div class="row">
            <%
                String sql = "Select * from books where user!='"+userEmail+"' and status!='Sold' and status!='Not Available' and status!='Pending'";
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
            %>
                <div class="col-sm-3 mt-4">
                    <div class="card text-capitalize shadow-lg rounded" style="width:18rem;">
                        <img src="../images/Book/<%out.print(rs.getString("image")); %>" class="card-img-top shadow p-2" alt="..." width="50px"
                        height="200px">
                        <a href="./singleBookView.jsp?book=<% out.print(rs.getString("bno")); %>">
                            <div class="card-body">
                                <h5 class="card-title"><Strong>
                                        <%out.print(rs.getString("book_name")); %>
                                    </Strong></h5>
                                <p class="card-text"><small>Auther : <%out.print(rs.getString("auther_name")); %></small></p>
                                <p class="card-text "><strong class="text-dark"><i class="fa fa-rupee"></i>
                                        <%out.print(rs.getString("selling_price")); %>
                                    </strong>&nbsp;
                                    <small>
                                        <i class="fa fa-rupee"></i>
                                        <s class="text-secondary">
                                            <%out.print(rs.getString("original_price")); %>
                                        </s> &nbsp;&nbsp;<span class="text-success"> <i class="fa fa-rupee"></i>
                                            <%out.print(Integer.parseInt(rs.getString("original_price"))-Integer.parseInt(rs.getString("selling_price")));
                                                %> off
                                        </span>
                                    </small>
                                </p>
                                <p class="card-text">
                                    <small>Free delivery</small>
                                </p>
                                <p class="card-text">
                                    <small class="text-left">Condition : <%out.print(rs.getString("book_condition")); %> </small>
                                </p>
                                <%
                                    if((Integer.parseInt(rs.getString("original_price"))-Integer.parseInt(rs.getString("selling_price")))>Integer.parseInt(rs.getString("original_price"))/2){
                                        %>
                                        <small class="card-text text-success">
                                            <strong>Deal of the Day</strong>
                                        </small>
                                        <%
                                    }
                                %>
                            </div>
                        </a>
                    </div>
                </div>
                <%}%>
            </div>
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
 <!-- wallet model -->
    <%
    String sql4 = "select wallet from users where email = '"+userEmail+"'";
    Statement st4 = connection.createStatement();
    ResultSet rs4 = st4.executeQuery(sql4);
    rs4.next();

    String sql5 = "select * from bankaccounts where email = '"+userEmail+"'";
    Statement st5 = connection.createStatement();
    ResultSet rs5 = st5.executeQuery(sql5);
    int flag=1;
    
    %>
    <!-- Button trigger modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div class="card shadow-lg m-2">
                <div class="card-body text-dark text-center head-shadow">
                    <h2 class="card-title"><strong>Your Wallet</strong></h2>
                    <hr>
                    <h4 class="card-title">Current Balance</h4>
                    <h3 class="card-text text-danger"><i class="fa fa-rupee fa-1x"> </i> <strong><%out.println(rs4.getString(1));%></strong></h3>
                    <hr>
                    <button class="btn btn-outline-secondary" data-toggle="modal" data-target="#withdrafundmodel">Withdraw Balance</button>
                </div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

    <!-- Withdraw balance module -->
  <div class="modal fade" id="withdrafundmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
         <form action="./controller/withdrawBalance.jsp" method="post">
                <h4 class="text-success"><strong>Withdrawable ammount : <i class="fa fa-rupee fa-1x"> </i> <%out.println(rs4.getString(1));%></strong></h4>
                <div class="form-group">
                  <label for="recipient-name" class="col-form-label">Enter amount : </label>
                  <input type="number" class="form-control" name="amount" placeholder="Enter amount to withdraw" min="1" max="<%out.print(Integer.parseInt(rs4.getString(1)));%>" required>
                </div>
                <label for="recipient-name" class="col-form-label">Choose Bank Account : </label>
                <div class="form-group">
                <% while(rs5.next()){
                    flag=0;
                    %>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="bankName" value="<%out.print(rs5.getString("bank_name"));%>" id="inlineRadio1" value="" required>
                    <label class="form-check-label" for="inlineRadio1"><%out.print(rs5.getString("bank_name"));%></label>
                  </div>
                </div>
                <%}%>
                <div class="form-group text-right">
                    <a href="./bankAccount.jsp"><i class="fa fa-plus"></i> Add new bank account</a>
                </div>
                <%if(flag==1){
                    %>
                <div class="form-group">
                  <button type="button" onclick="alert('Please add your bank account.')" class="btn btn-outline-primary">Withdraw</button>
                </div>
                <%}else{%>
                <div class="form-group">
                  <button type="submit" class="btn btn-outline-primary">Withdraw</button>
                </div>
                <%}%>
         </form>
        </div>
      </div>
    </div>
  </div>

    <!-- SCRIPTS -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>

</body>

</html>