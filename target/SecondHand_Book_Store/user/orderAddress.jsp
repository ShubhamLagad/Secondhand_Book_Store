<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@page import="java.sql.*"%>
<%@ include file="./controller/connection.jsp"%>
<%
    //Cart counter code
    String userEmail = (String)session.getAttribute("email");
    String sql3 = "select * from cart where user = '"+userEmail+"'";
    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql3);
    int count = 0;
    while(rs3.next()){
        count++;
    }

    //url variables
    String price = request.getParameter("price");
    String book_no = request.getParameter("book_no");
   
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>Address</title>
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

    <section  id="contact">
        <div class="jumbotron m-4">
            <div class="container-sm bg-light shadow-lg rounded">
                <form action="./makePayment.jsp" method="post" class="border p-3 rounded">
                    <h3 class="mb-4 head-shadow text-dark p-3">Shipping Address</h3>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label for="inputBookName4">Name:</label>
                            <input type="text" class="form-control" name="buyerName" id="inputBookName4" placeholder="Enter Name" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="inputAutherName1">Mobile No:</label>
                            <input type="text" class="form-control" name="mobileNo" minlength="10" maxlength="10" id="inputAutherName1" placeholder="Enter Mobile No" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="inputAutherName4">Email:</label>
                            <input type="email" class="form-control" id="inputAutherName4" placeholder="<%out.print(session.getAttribute("email"));%>" readonly>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="inputState">Pin Code:</label>
                            <input type="text" class="form-control" name="pinCode" minlength="6" maxlength="6" id="inputBookName4" placeholder="Enter Pin" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="inputState">State:</label>
                            <input type="text" class="form-control" name="state" id="inputBookName4" placeholder="Enter State" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="formFile">District:</label><br>
                            <input type="text" class="form-control" name="district" id="inputBookName4" placeholder="Enter District" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="formFile">Address:</label><br>
                            <input type="text" name="address" class="form-control" id="inputBookName4"
                                placeholder="Enter Postal address" required>
                        </div>
                        <input type="hidden" name="price" value="<%out.print(price);%>">
                        <input type="hidden" name="book_no" value="<%out.print(book_no);%>">
                        <input type="hidden" name="totalBook" value="<% out.print(request.getParameter("totalBook")); %>">

                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-danger col-sm-4 shadow">Submit</button>
                    </div>
                </form>
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