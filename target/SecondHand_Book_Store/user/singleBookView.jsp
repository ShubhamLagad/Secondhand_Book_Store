<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.lang.String.*"%>
<%@ include file="./controller/connection.jsp" %>

<%
    String book_no = request.getParameter("book");
    String userEmail = (String)session.getAttribute("email");
    String sql = "Select * from books where bno= '"+book_no+"'";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    rs.next();

    String sql2 = "Select * from users where email= '"+userEmail+"'";
    Statement st2 = connection.createStatement();
    ResultSet rs2 = st2.executeQuery(sql2);
    rs2.next();

    String sql3 = "Select * from cart where user = '"+userEmail+"' and book_no= '"+book_no+"'";
    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql3);

    String sql4 = "select * from cart where user = '"+userEmail+"'";
    Statement st4 = connection.createStatement();
    ResultSet rs4 = st4.executeQuery(sql4);
    int countCart = 0;
    while(rs4.next()){
        countCart++;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <title>View Book</title>
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
        .navbar-brand {
            font-size: large;
        }

        .btn-secondary,.btn-dark {
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
        <div class="jumbotron m-4">
           <div class="row text-capitalize">
               <div class="col-sm-6">
                   <div class="text-center">
                        <img class="shadow-lg rounded" src="../images/Book/<% out.print(rs.getString("image")); %>" alt="..." width="300px" height="400px">
                   </div>
                   <div class="text-center my-4">
                    <a href="./orderAddress.jsp?book_no=<% out.print(book_no); %>&&price=<% out.print(Integer.parseInt(rs.getString("selling_price"))); %>" class="btn btn-danger col-4 shadow" id="buynow">Buy Now</a>
                    
                    <% if(request.getParameter("status2")!=null || rs3.next()){
                       %>
                        <a href="./myCart.jsp" id="cartBtn" class="btn btn-warning col-4 shadow">
                        <i class="fa fa-shopping-cart mr-1"></i>Go to Cart
                        </a>
                       <%
                       }else{
                           %>
                            <a href="./controller/addToCart.jsp?book=<%out.print(book_no);%>" id="cartBtn" class="btn btn-warning col-4">
                            <i class="fa fa-shopping-cart mr-1"></i>Add to Cart
                        </a>
                       <%
                       }%>
                    </div>
               </div>
              
               <div class="col-sm-6">
                <div class="card shadow-lg rounded">
                    <div class="card-header">
                    <h3><strong><%out.print(rs.getString("book_name")); %></strong></h3>
                    </div>
                    <div class="card-body">
                         <p class="card-text "><strong class="text-dark"><i class="fa fa-rupee"></i>
                                        <%out.print(Integer.parseInt(rs.getString("selling_price"))); %>
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
                         <p class="card-text"><small>Free delivery</small></p>
                        <p class="text-danger">Original Price : <i class="fa fa-rupee"></i> <%out.print(rs.getString("original_price")); %></p>
                       
                        <p class="card-title"></p>
                      <p class="card-title">Auther : <%out.print(rs.getString("auther_name")); %></p>
                      <p class="card-text">Category : <%out.print(rs.getString("category")); %></p>
                      <p class="card-text">Language : <%out.print(rs.getString("book_language")); %></p>
                      <p class="card-text">Purchase Date : <%out.print(rs.getString("purchase_date")); %></p>
                      <p class="card-text">Upload Date : <%out.print(rs.getString("upload_date")); %></p>
                      <p class="card-text">Condition :<%out.print(rs.getString("book_condition")); %></p>
                      <p class="card-text"><%out.print(rs.getString("description")); %></p>
                        <%
                            
                            String query = "select * from users where email=(select user from books where bno='"+book_no+"')";
                            Statement stat = connection.createStatement();
                            ResultSet res = stat.executeQuery(query);
                            res.next();
                        %>
                        <p class="card-text"><Strong>Owner Details : </Strong><p>Name : <%out.print(res.getString("name")); %></p><p>Email : <span  class="text-lowercase"><%out.print(res.getString("email")); %></span></p><p>Mobile No : <%out.print(res.getString("contactno")); %></p></p>
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
                  </div>
               </div>
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


    <!-- SCRIPTS -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>

</body>

</html>