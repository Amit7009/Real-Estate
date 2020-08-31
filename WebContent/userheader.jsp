<%@page import="com.pojo.City"%>
<%@page import="com.pojo.Property"%>
<%@page import="com.pojo.Category"%>
<%@page import="com.pojo.Register"%>
<%@page import="com.pojo.Postfeedback"%>
<%@page import="com.pojo.Contactus"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Amit Property</title>
<meta charset="UTF-8">
<meta name="description" content="LERAMIZ Landing Page Template">
<meta name="keywords" content="LERAMIZ, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="userdash/img/favicon.ico" rel="shortcut icon" />

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="userdash/css/bootstrap.min.css" />
<link rel="stylesheet" href="userdash/css/font-awesome.min.css" />
<link rel="stylesheet" href="userdash/css/animate.css" />
<link rel="stylesheet" href="userdash/css/owl.carousel.css" />
<link rel="stylesheet" href="userdash/css/style.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body >


<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 header-top-left">
					<div class="top-info">
						<i class="fa fa-phone"></i> +91 99701 13773
					</div>
					<div class="top-info">
						<i class="fa fa-envelope"></i> amit.property@gmail.com
					</div>
				</div>
				<div class="col-lg-6 text-lg-right header-top-right">
					<div class="top-social">
						<a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a>
						<a href="https://twitter.com/login?lang=en"><i class="fa fa-twitter"></i></a>
						<a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
						<a href="https://in.linkedin.com"><i class="fa fa-linkedin"></i></a>
						
						
							<c:if test="${sessionScope.email eq null}">
			    			<!-- Not login: show login button  -->
			    			<div class="user-panel">
			    		   		<a href="registration.jsp"><i class="fa fa-user-circle-o"></i>Register</a>
			    		   		<a href="login1.jsp"><i class="fa fa-sign-in Login"></i>Login</a>
							</div>
							</c:if>
			
							<c:if test="${sessionScope.email ne null}">
			   				 <!-- already login: show logout button -->
			  				<div class="user-panel">
			    				<div class="dropdown">
									<label class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><a href="#"><i class="fa fa-user">&nbsp;&nbsp;${name}</i></a></label>
									    <ul class="dropdown-menu">
			      							<li><a href="UserPro.jsp">My Profile</a></li>
			      							<li><a href="userFeedback.jsp">Feedback</a></li>
			      							<li><a href="userEnquiryView.jsp">My Enquiry</a>
			      							<li><a href="ChangePasswordUser.jsp">Change Password</a></li>
			      							<li><a href="LogoutServlet">Logout</a></li>
			    						</ul>
			  					</div>
			    			</div>
							</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="site-navbar">
						<a href="#" class="site-logo"><img src="img/logo.png" alt=""></a>
						<div class="nav-switch">
							<i class="fa fa-bars"></i>
						</div>
						<ul class="main-menu">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="allsession">Property </a></li>
							<li><a href="about.jsp">About Us</a></li>
							<li><a href="contact.jsp">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	
	</header>