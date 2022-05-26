<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="./controller/connection.jsp"%>

<%
    String userEmail = (String)session.getAttribute("email");
    String sql = "Select * from books where user = '"+userEmail+"' and status!='Not Available'";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    int count = 0;

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

    <title>Your Books</title>
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
            width: 20px;
            height: 20px;
        }
        .container-sm{
            display:inline;
        }
    }
</style>

<body>
<% 
   if (request.getParameter("loginMsg") !=null) {
       %>
            <script>
                alert('Login Successfull...!');
            </script>
       <%
    }
    if(request.getParameter("updatemsg")!=null){
        %>
            <script>
                alert("Book details Updated successfully!")
            </script>
        <%
    }
%>
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
    <section>
        <div class="jumbotron m-2 my-4 px-2 text-capitalize">
            <h2 class="text-center head-shadow text-dark">Your Uploaded Books</h2>
            <hr>
            <table class="table col-12 bg-light">
                <thead>
                    <tr class="bg-dark shadow-lg text-white rounded">
                        <th scope="col">Sr.No.</th>
                        <th scope="col">Image</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Auther Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Language</th>
                        <th scope="col">Purchase Date</th>
                        <th scope="col">Book Condition</th>
                        <th scope="col">Original Price</th>
                        <th scope="col">Selling Price</th>
                        <th scope="col">Selling Date</th>
                        <th scope="col">Upload Date</th>
                        <th scope="col">Book Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    while(rs.next()){
                    count++;
                %>
                    <tr>
                        <td><% out.print(count); %></td>
                        <td><img class="shadow" src="../images/Book/<% out.print(rs.getString("image")); %>" width="50px" height="50px"> </td>
                        <td><% out.print(rs.getString("book_name")); %></td>
                        <td><% out.print(rs.getString("description")); %></td>
                        <td><% out.print(rs.getString("auther_name")); %></td>
                        <td><% out.print(rs.getString("category")); %></td>
                        <td><% out.print(rs.getString("book_language")); %></td>
                        <td><% out.print(rs.getString("purchase_date")); %></td>
                        <td><% out.print(rs.getString("book_condition")); %></td>
                        <td><% out.print(Integer.parseInt(rs.getString("original_price"))-40); %></td>
                        <td><% out.print(Integer.parseInt(rs.getString("selling_price"))-40); %></td>
                        <td><% out.print(rs.getString("selling_date")); %></td>
                        <td><% out.print(rs.getString("upload_date")); %></td>
                        <td><% out.print(rs.getString("status")); %></td>
                        <td>
                        <a href="./updateBook.jsp?bno=<% out.print(rs.getString("bno")); %>"><i class="fa fa-edit fa-2x"></i></a>
                        <a href="./controller/deleteBook.jsp?bno=<% out.print(rs.getString("bno")); %>"><i class="fa fa-trash fa-2x" onclick="return confirm('Are you sure, you want to delete this book?')"></i></a>
                        </td>
                    </tr>
                    <%}%>
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


   <!-- Feedback section -->
   <div style="position:fixed; bottom:0; right: 0;">
    <div class="alert shadow bg-light" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="toast-header bg-dark text-white">
        <strong class="mr-auto">Feedback</strong>
        <small class="px-2">Give your feedback here</small>
        <button type="button" class="ml-2 mb-1 close text-white" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="toast-body" id="tost-body">
        <form> 
            <div class="form-group form-check">
                <label for="exampleInputPassword1">Comments</label>
                <textarea class="form-control" id="comment" name="comment" placeholder="Type here..."></textarea>
                <input type="hidden" name="page" value="last">
            </div>
            <button type="button" id="feedback" onclick="sendInfo()" class="btn btn-primary">Submit</button>
        </form>
        
      </div>
    </div>
  </div>
<script>
    var request;
    function sendInfo() {
        var str = document.getElementById("comment").value;
        var url = "./controller/feedback.jsp?comment=" + str;

        if (window.XMLHttpRequest) {
            request = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) {
            request = new ActiveXObject("Microsoft.XMLHTTP");
        }

        try {
            request.onreadystatechange = getInfo;
            request.open("GET", url, true);
            request.send();
        } catch (e) { alert("Unable to connect to server"); }
    }

    function getInfo() {
        if (request.readyState == 4) {
            var val = request.responseText;
            document.getElementById("tost-body").innerHTML = `<span class="text-success"><strong>Thank you for giving us your Feedback!</strong></span>`;
        }
    }  
</script>

    <!-- SCRIPTS -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>

</body>

</html>