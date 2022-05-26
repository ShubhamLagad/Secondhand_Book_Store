<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%> --%>
 <%@ page import="java.sql.*"%>
<%@ include file="controller/connection.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>SecondHand Book Store</title>
    <link rel="icon" href="./images/icon.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="./css/style.css">
</head>
<body data-spy="scroll" data-target="#navbarNav" data-offset="50">
<!-- <body data-spy="scroll" data-target="#navbarNav" data-offset="50" onload="myFunction()"> -->
<% 
    if (request.getParameter("msg1") != null) {
        %>
        <script>
            alert('User already exists...?');
        </script>
        <%
    }

    if (request.getParameter("msg") !=null) {
        %>
        <script>
            alert('Registration Successfull...!');
        </script>
        <%
    }

    if (request.getParameter("loginMsg") !=null) {
        %>
        <script>
            alert('Please enter correct email and password...?');
        </script>
        <%
    }

    if(request.getParameter("passMsg")!=null){
        %>
            <script>
            alert("Password changed successfully!");
            </script>
        <%
    }

    if(request.getParameter("passFailedMsg")!=null){
        %>
        <script>
        alert("Please enter correct details?!");
        </script>
        <% 
    }
    if(request.getParameter("adminmsg")!=null){
        %>
        <script>
        alert("Login Failed? \nPlease enter correct details.");
        </script>
        <% 
    }
%>

<script>
    function myFunction() {
        $("#userLoginModel").modal()
    }
    function loginRequired(){
       alert("Login Required?")
    }
</script>

    <!-- MENU BAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">

            <a class="navbar-brand shadow text-danger" href="index.jsp">Buying and Selling Portal</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-lg-auto">
                    <li class="nav-item">
                        <a href="#home" class="nav-link smoothScroll">Home</a>
                    </li>

                    <li class="nav-item">
                        <a href="#about" class="nav-link smoothScroll">About Us</a>
                    </li>

                    <li class="nav-item">
                        <a href="#contact" class="nav-link smoothScroll">Contact</a>
                    </li>

                    <li class="nav-item">
                        <a href="#books" class="nav-link smoothScroll">Books</a>
                    </li>
                </ul>

                <ul class="navbar-nav ml-lg-auto">
                    <li class="nav-item">
                        <button type="button" class="btn btn-outline-danger bordered rounded-pill"
                            data-toggle="modal" data-target="#userLoginModel">
                            Sign in/Sign up
                        </button>
                    </li>
                </ul>

            </div>

        </div>
    </nav>


    <!-- HERO -->
    <section class="hero d-flex flex-column justify-content-center align-items-center" id="home">

        <div class="bg-overlay"></div>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto col-12">
                    <div class="hero-text mt-5 text-center">

                        <h6 data-aos="fade-up" data-aos-delay="300">a new way to help someone who needs
                            a book!</h6>

                        <h1 class="text-white" data-aos="fade-up" data-aos-delay="500">SecondHand Book-Store</h1>

                        <a href="#books" class="btn custom-btn mt-3" data-aos="fade-up"
                            data-aos-delay="600">View Books</a>
                        <button type="button" class="btn btn-outline-danger bordered mt-3 px-4 py-3 rounded-pill "
                            data-toggle="modal" data-target="#userLoginModel" data-aos="fade-up" data-aos-delay="700">
                            Sign In
                        </button>

                    </div>
                </div>
            </div>
        </div>
    </section>

<!-- View Books -->
    <section class="" id="books">
        <div class="container my-5">
            <div class="row">
               
                <div class="col-lg-12 col-12 text-center mt-lg-5">
                    <h2 class="head-shadow text-dark" data-aos="fade-up" data-aos-delay="200">Books For Sell</h2>
                </div>
                
                <div class="col-lg-12 py-5 col-md-12 col-12" data-aos="fade-up">
                    <div class="row">
                        <% String sql="Select * from books" ; Statement st=connection.createStatement(); ResultSet
                            rs=st.executeQuery(sql); int count=0; while(rs.next()){ count++; if(count==5){ break; } %>
                            <div class="col-sm-3 p-2">
                                <div class="card text-capitalize shadow-lg rounded">
                                    <img src="./images/Book/<%out.print(rs.getString("image")); %>" class="card-img-top
                                    shadow" alt="..." width="50px"
                                    height="200px">
                                    <a href="" onclick="loginRequired()">
                                        <div class="card-body">
                                            <h5 class="card-title"><Strong>
                                                    <%out.print(rs.getString("book_name")); %>
                                                </Strong></h5>
                                            <p class="card-text"><small>Auther : <%out.print(rs.getString("auther_name"));
                                                        %></small></p>
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
                                                <small class="text-left">Condition :
                                                    <%out.print(rs.getString("book_condition")); %> </small>
                                                <span class="text-right ml-5"><i class="fa fa-heart-o fa-1x"></i></span>
                                            </p>
                                            <%
                                                if((Integer.parseInt(rs.getString("original_price"))-Integer.parseInt(rs.getString("selling_price")))>
                                                Integer.parseInt(rs.getString("original_price"))/2){
                                                %>
                                                <small class="card-text text-success">
                                                    <strong>Deal of the Day</strong>
                                                </small>
                                                <% } %>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <%}%>
                    </div>
                </div>
    
                <div class="col-lg-12 col-12">
                       
                        
                      <div class="collapse" id="collapseExample">
                            <div class="row">
                                <% 
                                String sql2="Select * from books" ; 
                                Statement st2=connection.createStatement(); 
                                ResultSet rs2=st2.executeQuery(sql2); 
                                count=0;
                                while(rs2.next()){ 
                                    count++;
                                    if(count<5){
                                        continue;
                                    }
                                %>
                                    <div class="col-sm-3 p-2">
                                        <div class="card text-capitalize shadow-lg rounded">
                                            <img src="./images/Book/<%out.print(rs2.getString("image")); %>" class="card-img-top
                                            shadow" alt="..." width="50px"
                                            height="200px">
                                            <a href="" onclick="loginRequired()">
                                                <div class="card-body">
                                                    <h5 class="card-title"><Strong>
                                                            <%out.print(rs2.getString("book_name")); %>
                                                        </Strong></h5>
                                                    <p class="card-text"><small>Auther : <%out.print(rs2.getString("auther_name"));
                                                                %></small></p>
                                                    <p class="card-text "><strong class="text-dark"><i class="fa fa-rupee"></i>
                                                            <%out.print(rs2.getString("selling_price")); %>
                                                        </strong>&nbsp;
                                                        <small>
                                                            <i class="fa fa-rupee"></i>
                                                            <s class="text-secondary">
                                                                <%out.print(rs2.getString("original_price")); %>
                                                            </s> &nbsp;&nbsp;<span class="text-success"> <i class="fa fa-rupee"></i>
                                                                <%out.print(Integer.parseInt(rs2.getString("original_price"))-Integer.parseInt(rs2.getString("selling_price")));
                                                                    %> off
                                                            </span>
                                                        </small>
                                                    </p>
                                                    <p class="card-text">
                                                        <small>Free delivery</small>
                                                    </p>
                                                    <p class="card-text">
                                                        <small class="text-left">Condition :
                                                            <%out.print(rs2.getString("book_condition")); %> </small>
                                                        <span class="text-right ml-5"><i class="fa fa-heart-o fa-1x"></i></span>
                                                    </p>
                                                    <%
                                                        if((Integer.parseInt(rs2.getString("original_price"))-Integer.parseInt(rs2.getString("selling_price")))>
                                                        Integer.parseInt(rs2.getString("original_price"))/2){
                                                        %>
                                                        <small class="card-text text-success">
                                                            <strong>Deal of the Day</strong>
                                                        </small>
                                                        <% } %>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <%}%>
                            </div>
                      </div>

                     <div class="col-lg-12 text-center">
                        <button class="btn btn-secondary m-4" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                            View All
                          </button> 
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ABOUT -->
    <section class="about bg-light section" id="about">
        <div class="container">
            <div class="row">

                <div class="mt-lg-5 mb-lg-0 mb-4 col-lg-5 col-md-10 mx-auto col-12">
                    <h2 class="mb-4" data-aos="fade-up" data-aos-delay="300">Hello, we are Helpers</h2>
                
                    <p data-aos="fade-up" data-aos-delay="400">The main aim of this project is that to
                        help someone who
                        doesn't have economically stronger or who needs secondhand books.</p>
                
                    <p data-aos="fade-up" data-aos-delay="500">And the best platform for those who throw
                        away their old
                        books is to give them to someone in need without throwing them away. Thank you.
                    </p>
                
                </div>

                <div class="mt-lg-5 mb-lg-0 mb-4 col-lg-5 col-md-10 mx-auto col-12 jumbotron">
                    <h2 class="mb-4" data-aos="fade-up" data-aos-delay="300">Users Feedback</h2>
                    <div id="carouselExampleInterval" data-aos="fade-up" data-aos-delay="300" class="carousel slide "
                        data-ride="carousel">
                        <div class="carousel-inner team-info rounded px-5">
                        <div class="carousel-item active" data-interval="2000">
                                <div class="d-block w-100 text-center">
                                    <h4>Admin</h4>
                                    <hr>
                                   <strong>Excellent work!!</strong>
                                </div>
                            </div>
                            <%
                                String query = "select * from feedback";
                                Statement stat = connection.createStatement();
                                ResultSet res = stat.executeQuery(query);
                                while(res.next()){
                            %>
                            <div class="carousel-item" data-interval="2000">
                                <div class="d-block w-100 text-center">
                                    <h4><%out.println(res.getString("name"));%></h4>
                                    <hr>
                                    <strong><%out.println(res.getString("comment"));%></strong>
                                </div>
                            </div>
                            
                            <%}%>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleInterval" role="button"
                            data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleInterval" role="button"
                            data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    

    <!-- CONTACT -->
    <section class="contact section" id="contact">
        <div class="container">
            <div class="row">
                <div class="ml-auto col-lg-5 col-md-6 col-12">
                    <h2 class="mb-4 pb-2" data-aos="fade-up" data-aos-delay="200">Contact Us</h2>

                    <div class="contact-form webform" data-aos="fade-up" data-aos-delay="400">
                        <p><strong>Shubham Lagad</strong></p>
                      <p>Sinhagad Institute of Management,<br> Wadgaon Budruk, Pune, Maharashtra</p>
                      <a href="http://www.sinhgad.edu/SinhgadManagementInstitutes/SIOM-MCA/">http://www.sinhgad.edu/SinhgadManagementInstitutes</a>
                    </div>
                </div>

                <div class="mx-auto mt-4 mt-lg-0 mt-md-0 col-lg-5 col-md-6 col-12">
                    <h2 class="mb-4" data-aos="fade-up" data-aos-delay="600">Where you can
                        <span>find us</span>
                    </h2>

                    <p data-aos="fade-up" data-aos-delay="800">
                        <i class="fa fa-map-marker mr-1"></i>
                        Sinhagad Instute of Management, Pune
                    </p>
                    <!-- How to change your own map point
                                        1. Go to Google Maps
                                        2. Click on your location point
                                        3. Click "Share" and choose "Embed map" tab
                                        4. Copy only URL and paste it within the src="" field below
                                                -->

                    <div class="google-map" data-aos="fade-up" data-aos-delay="900">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1226.4137271993452!2d73.83525014785567!3d18.46466214717668!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc295ed8144aebd%3A0xa33411c6a455191!2zMTjCsDI3JzU0LjciTiA3M8KwNTAnMDcuOCJF!5e1!3m2!1sen!2sin!4v1648048488958!5m2!1sen!2sin"
                            width="1920" height="250" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
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

                        <br>Design By:
                        <a data-toggle="modal" href="#adminLoginModel">Shubham Lagad</a>
                    </p>
                </div>

                <div class="d-flex justify-content-center mx-auto col-lg-6 col-md-8 col-12">
                    <p class="mr-4 text-center">
                        <a href="shubhamlagad2000@gmail.com">
                            <i class="fa fa-envelope-o mr-1"></i>Mail</a>
                    </p>
                    <p class="mr-4 text-center">
                        <a href="#">
                            <i class="fa fa-instagram mr-1"></i>Instagram</a>
                    </p>
                    <p class="mr-4">
                        <a href="#">
                            <i class="fa fa-whatsapp mr-1 text-center"></i>Whatsapp</a>
                    </p>
                    <p>
                        <i class="fa fa-phone mr-1"></i>
                        +91 +91 8007878524
                    </p>
                </div>

            </div>
        </div>
    </footer>
    <!-- Modal -->

    <!-- Button trigger modal -->
    <!--User Login Modal -->
    <div class="modal fade" id="userLoginModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalCenterTitle">User Login</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <hr>
                <div class="warn">
                    <span class="text-danger" id="warn"></span>
                </div>
                <div class="modal-body">
                    <form action="./controller/userLogin.jsp" method="post">
                        <div class="form-group">
                            <label >Email address</label>
                            <input type="email" class="form-control" name="loginEmail" id="loginEmail"
                                aria-describedby="emailHelp" placeholder="Enter email" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your
                                email with anyone
                                else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword2">Password</label>
                            <input type="password" class="form-control" name="loginPassword" id="loginPassword"
                                placeholder="Password" required>
                            <small><a href="userPasswordForgetModel" data-toggle="modal" data-target="#userPasswordForgetModel" data-aos="fade-up"
                                    class="text-info">Forgot password?</a></small>
                        </div>
                        <button type="submit" id="loginBtn" class="btn btn-primary">Login</button>
                    </form>
                    <div class="modal-footer text-md-right">
                        <a href="#userRegistrationModel" class="text-info" data-toggle="modal"
                            data-target="#userRegistrationModel">Create account</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--User password forget Modal -->
    <div class="modal fade" id="userPasswordForgetModel" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalCenterTitle">Forget Password</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <hr>
                <div class="warn">
                    <span class="text-danger" id="warn"></span>
                </div>
                <div class="modal-body">
                    <form action="user/controller/changePassword.jsp" method="post">
                        <div class="form-group">
                            <label >Email address</label>
                            <input type="email" class="form-control" name="email"                      aria-describedby="emailHelp" placeholder="Enter email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">New Password</label>
                            <span id="forgetpassHelp" class="text-secondary"></span>
                            <input maxlength="16" minlength="8" name="forgetPassword" type="password" class="form-control"
                                id="forgetPassword" placeholder="Password" onclick="forgetPassHelp()" pattern=".{8,16}" required>
                        </div>
                        <div class="form-group">
                            <label >Confirm Password</label>
                            <span id="forgetpassHelp2" class="text-danger"></span>
                            <input maxlength="16" minlength="8" type="password" name="forgetCpassword" class="form-control"
                                id="forgetCpassword" placeholder="Confirm password" onkeyup="forgetPassCheck()" required>
                        </div>
                        <div class="form-group">
                            <label >Password Security Question</label>
                            <select class="form-control" name="" id="passQuestion" required>
                                <option selected disabled value="">Choose...</option>
                                <option>Which is your favourite place?</option>
                                <option>What is your nick name?</option>
                                <option>Which is your birth place?</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAnswer">Answer</label>
                            <input pattern="*[A-Za-z ]" type="text" name="answer" class="form-control" id="answer"
                                placeholder="Enter Answer" required>
                        </div>
                        <input type="hidden" name="indexPass" value="page">
                        <button type="submit" id="" class="btn btn-primary">Change Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--User Registration Modal -->
    <div class="modal fade bd-example-modal-lg" id="userRegistrationModel" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalCenterTitle">User Registration</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <hr>
                <div class="modal-body">
                    <form id="regForm" action="./controller/userRegistration.jsp" method="post">
                        <div class="form-group">
                            <label >Your Name</label>
                            <input pattern="*[A-Za-z ]" type="text" class="form-control" name="regName" id="regName"
                                placeholder="Enter your name" required>
                        </div>
                        <div class="form-group">
                            <label >Email address</label>
                            <input type="email" class="form-control" name="regEmail" id="regEmail"
                                aria-describedby="emailHelp" placeholder="Enter email" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your
                                email with anyone
                                else.</small>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label >Gender</label>
                                    <select class="form-control" name="regGender" id="gender" required>
                                        <option value="">Choose...</option>
                                        <option>Male</option>
                                        <option>Female</option>
                                        <option>Other</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="contactNo">Contact No</label>
                                    <input pattern="*[0-9]" maxlength="10" minlength="10" type="text" class="form-control" id="contactNo"
                                        name="regContactNo" placeholder="Enter mobile no" required>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <input pattern="*[A-Za-z ]" type="text" name="regCity" class="form-control" id="city"
                                        placeholder="Enter City" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <span id="passHelp" class="text-secondary"></span>
                                    <input maxlength="16" minlength="8" name="regPassword" type="password"
                                        class="form-control" id="regPassword" placeholder="Password"
                                        onclick="passHelp()" pattern=".{8,16}" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label >Confirm Password</label>
                                    <span id="cpassHelp" class="text-danger"></span>
                                    <input maxlength="16" minlength="8" type="password" name="regCpassword"
                                        class="form-control" id="regCpassword" placeholder="Confirm password"
                                        onkeyup="passCheck()" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label >Password Security Question</label>
                                    <select class="form-control" required>
                                        <option selected disabled value="">Choose...</option>
                                        <option>Which is your favourite place?</option>
                                        <option>What is your nick name?</option>
                                        <option>Which is your birth place?</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="exampleInputAnswer">Answer</label>
                                    <input pattern="*[A-Za-z ]" type="text" name="regAnswer" class="form-control" id="reganswer"
                                        placeholder="Enter Answer" required>
                                </div>
                            </div>
                            <div class="col-sm-6"></div>
                        </div>
                        <div class="form-group text-center mt-3">
                            <button type="submit" class="btn btn-primary col-sm-8" id="register">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!--Admin Login Modal -->
    <div class="modal fade" id="adminLoginModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalCenterTitle">Admin Login</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <hr>
                <div class="modal-body">
                    <form action="./controller/adminLogin.jsp" method="post">
                        <div class="form-group">
                            <label >Email address</label>
                            <input type="email" class="form-control" name="adminEmail" id="adminloginEmail" aria-describedby="emailHelp"
                                placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label >Password</label>
                            <input type="password" class="form-control" name="adminPassword" id="adminloginPassword" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- SCRIPTS -->
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/aos.js"></script>
    <script src="./js/smoothscroll.js"></script>
    <script src="./js/custom.js"></script>
    <script src="./js/index.js"></script>
</body>

</html>