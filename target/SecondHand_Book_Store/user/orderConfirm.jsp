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

    String order_id = request.getParameter("orderId");
    String sql = "select * from orders where order_id='"+order_id+"'";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    rs.next();
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>Payment Success</title>
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

    <section class="" id="contact">
        <div class="jumbotron m-4 text-center">
            <i class="fa fa-check-circle text-success fa-4x"></i>
            <h4>Order Confirmed..!</h4>

            <span>Order id : <strong><%out.print(order_id);%></strong></span>
            <hr>
                <div class="border-dark m-3">
                    <h5 class="card-title text-danger"><strong>Shipping Address</strong></h5>
                    <p class="card-text"><%out.print(rs.getString("address"));%></p>
              </div>

            <div class="my-4 ">
                <a href="./viewBooks.jsp" class="text-info mx-4"><i class="fa fa-arrow-left"></i> View Books</a>
                <a data-toggle="modal" href="#adminLoginModel" class="text-info">Change Address <i class="fa fa-arrow-right"></i> </a>
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

    <!-- Change address -->
    <div class="modal fade" id="adminLoginModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalCenterTitle">Change Shipping Address</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <hr>
            <div class="modal-body">
                <form action="./controller/changeAddress.jsp" method="post">
                    <div class="form-group">
                        <label >Order Id : </label>
                        <span><strong><%out.print(order_id);%></strong></span>
                    </div>
                    <hr>
                    <div class="row" id="addressRow">
                        <div class="form-group col-sm-6">
                            <label >District</label>
                            <input type="text" class="form-control" name="district" id="district" placeholder="District">
                        </div>
                        <div class="form-group col-sm-6">
                            <label >Pin Code</label>
                            <input type="text" class="form-control" name="pincode" id="pincode" placeholder="Pin code">
                        </div>
                        <div class="form-group col-sm-12">
                            <label >Address</label>
                            <textarea class="form-control" name="address" id="address" placeholder="Enter address"></textarea>
                        </div>
                        <input type="hidden" name="orderId" value="<%out.print(order_id);%>" id="orderId">
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
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