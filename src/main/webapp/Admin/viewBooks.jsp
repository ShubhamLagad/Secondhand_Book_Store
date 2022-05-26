<%
    if(session.getAttribute("adminEmail")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@page import="java.sql.*"%>
<%@ include file="./controller/connection.jsp"%>
<%
    String sql = "select * from books";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);

    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql);
    int bookcount = 0;
    while(rs3.next()){
        bookcount++;
    }

    String sql4 = "select * from books where status='Sold'";
    Statement st4 = connection.createStatement();
    ResultSet rs4 = st4.executeQuery(sql4);
    int soldbookcount = 0;
    while(rs4.next()){
        soldbookcount++;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <title>Books</title>
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
    .head-shadow {
        color: white;
        text-shadow: 1px 1px 2px black, 0 0 25px rgb(146, 146, 175), 0 0 5px rgb(140, 140, 151);
    }
    .text-shadow {
    color: white;
    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px blue;
    }

    @media screen and (max-width:481px) {
        table {
            font-size: 5px;
        }

        .table td,
        .table th {
            padding: .1rem;
        }

        .navbar-brand {
            font-size: large;
        }

        img {
            width: 20px;
            height: 20px;
        }

        .container-sm {
            display: inline;
        }

        .btn-danger,
        .btn-secondary,
        .btn-primary,
        .btn-dark {
            font-size: xx-small;
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
            <h2 class="text-center head-shadow text-dark">Uploaded Books</h2>
            <hr>
            <table class="table text-center shadow-lg rounded">
                <thead>
                    <tr class="text-warning head-shadow shadow-lg rounded">
                        <td colspan="6">
                            <h3 class="rounded shadow p-2">
                                <strong>Total Books Uploaded : <% out.print(bookcount);%></strong>
                            </h3>
                        </td>
                        <td colspan="7">
                            <h3 class="rounded shadow p-2">
                                <strong>Total Books Sold : <% out.print(soldbookcount);%></strong>
                            </h3>
                        </td>
                    </tr>
                    <tr class="bg-dark text-white shadow-lg rounded">
                        <%-- <th scope="col">Sr.No.</th> --%>
                        <th scope="col">Owner Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Auther Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Language</th>
                        <th scope="col">Purchase Date</th>
                        <th scope="col">Book Condition</th>
                        <th scope="col">Original Price</th>
                        <th scope="col">Selling Price</th>
                        <th scope="col">Upload Date</th>
                        <th scope="col">Book Status</th>
                        <th scope="col">Selling Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while(rs.next()){
                           String sql2 = "select * from users where email = '"+rs.getString("user")+"'";
                           Statement st2 = connection.createStatement();
                           ResultSet rs2 = st2.executeQuery(sql2);
                           rs2.next();
                    %>
                        <tr class="rounded">
                        <td><% out.print(rs2.getString("name")); %></td>
                        <td><img src="../images/Book/<% out.print(rs.getString("image")); %>" width="100px" height="100px" class="shadow rounded"></td>
                        <td><% out.print(rs.getString("book_name")); %></td>
                        <td><% out.print(rs.getString("auther_name")); %></td>
                        <td><% out.print(rs.getString("category")); %></td>
                        <td><% out.print(rs.getString("book_language")); %></td>
                        <td><% out.print(rs.getString("purchase_date")); %></td>
                        <td><% out.print(rs.getString("book_condition")); %></td>
                        <td><% out.print(rs.getString("original_price")); %></td>
                        <td><% out.print(rs.getString("selling_price"));%></td>
                        <td><% out.print(rs.getString("upload_date")); %></td>
                        <td><% out.print(rs.getString("status")); 
                            if(rs.getString("status").length()>10){
                               %>
                                <a href="./controller/deleteBooks.jsp?bno=<%out.print(rs.getString("bno"));%>&email=<%out.print(rs2.getString("email"));%>" class="btn btn-danger text-white mt-2"><i class="fa fa-trash"></i></a>
                               <%
                            }
                        %></td>
                        <td><% if(rs.getString("status").length()==4){
                                out.print(rs.getString("selling_date"));
                                }else{
                                    out.print("-");
                                } %></td>
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

    <!-- View books Model -->
    <div class="modal fade bd-example-modal-lg" id="viewBookModel" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title m-2" id="exampleModalCenterTitle">Book Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <ul class="list-group">
                                <li class="list-group-item"><strong>User Name : <span id="muserName"></span></strong>
                                </li>
                                <li class="list-group-item"><strong>User Email : <span
                                            id="muserEmail"></span></strong></span></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <li class="list-group-item text-center"><span id="mimage"></span></li>
                        </div>
                    </div>
                    <hr>

                    <div class="row">
                        <div class="col-sm-6">
                            <ul class="list-group">
                                <li class="list-group-item">Book Name : <span id="mbookName"></span></li>
                                <li class="list-group-item">Auther Name : <span id="mautherName"></span></li>
                                <li class="list-group-item">Language : <span id="mlanguage"></span></li>
                                <li class="list-group-item">Description : <span id="mdescription"></span></li>
                                <li class="list-group-item">Category : <span id="mcategory"></span></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-group">

                                <li class="list-group-item">Price : <span id="mprice"></span></li>
                                <li class="list-group-item">Condition : <span id="mbookCondition"></span></li>
                                <li class="list-group-item">Purchase Date : <span id="mpurchaseDate"></span></li>
                                <li class="list-group-item">Selling Date : <span id="msellingDate"></span></li>
                                <li class="list-group-item">Book Status : <span id="mbookStatus"></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="modal-footer mt-2">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- View books Model -->


    <!-- SCRIPTS -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>
</body>

</html>