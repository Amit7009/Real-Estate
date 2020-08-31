<!DOCTYPE html>
<%@page import="com.pojo.Property"%>
<%@page import="com.pojo.Category"%>
<%@page import="com.pojo.Register"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="stylesheet" href="userdash/css/magnific-popup.css" />
<link rel="stylesheet" href="userdash/css/style.css" />


</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<section class="page-top-section set-bg"
		data-setbg="userdash/img/page-top-bg.jpg">
		<header class="header-section">
			<div class="header-top">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 header-top-left">
							<div class="top-info">
								<i class="fa fa-phone"></i> 9970113773
							</div>
							<div class="top-info">
								<i class="fa fa-envelope"></i> amit.property@gmail.com
							</div>
						</div>
						<div class="col-lg-6 text-lg-right header-top-right">
							<div class="top-social">
								<a href=""><i class="fa fa-facebook"></i></a> <a href=""><i
									class="fa fa-twitter"></i></a> <a href=""><i
									class="fa fa-instagram"></i></a> <a href=""><i
									class="fa fa-linkedin"></i></a>
								<div class="user-panel">
									<a href="registration.jsp"><i class="fa fa-user-circle-o"></i>
										Register</a> <a href="login1.jsp"><i
										class="fa fa-sign-in Login"></i> Login</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
					</header>
		<br /> <br />
		<!-- Page top section -->

		<div class="container text-white">
			<h2>Property Description</h2>
		</div>
	</section>
	<!--  Page top end -->

	<!-- Breadcrumb -->
	<div class="site-breadcrumb">
		<div class="container">
			<a href="index.jsp"><i class="fa fa-home"></i>Home</a> <span><i
				class="fa fa-angle-right"></i>Property</span>
		</div>
	</div>

   <%
   	BLManager bl=new BLManager();
      String id=request.getParameter("cid");
      int cid=Integer.parseInt(id);
      Property p=bl.searchcategory1(cid);
      session.setAttribute("pro",p);
   %>


	<section class="page-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 single-list-page">
					<div class="single-list-slider owl-carousel" id="sl-slider">
						<div class="sl-item set-bg"
							data-setbg="propertyimg/${pro.pimage }">
							<div class="sale-notic">FOR SALE</div>
						</div>

					</div>

					<div class="single-list-content">
						<div class="row">
							<div class="col-xl-8 sl-title">
								<h2>${pro.propertyname}</h2>
							
							</div>
							<div class="col-xl-4">
								<a href="#" class="price-btn"> ${pro.price}</a>
								<a href="SendEnquiryController?pid=${pro.pid}" class="price-btn">Send Enquiry</a>
							</div>
							
						</div>
						<h3 class="sl-sp-title">${pro.size}</h3>
						
						<div class="description">
							<i>${pro.address}</i>
						</div>

						<h3 class="sl-sp-title bd-no">Location</h3>
						<div class="pos-map" id="map-canvas"></div>
					</div>
				</div>

				<!-- sidebar -->
				<div class="col-lg-4 col-md-7 sidebar">
					<div class="contact-form-card">
						<h5>Contact property owner/dealer</h5>
						<form>
							<input type="text" placeholder="User name"> <input
								type="text" placeholder="Your email">
							<textarea placeholder="Any description"></textarea>
							<button>
								<a href="">SEND</a>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page end -->


	<!-- Clients section -->
	<div class="clients-section">
		<div class="container">
			<div class="clients-slider owl-carousel">
				<a href="#"> <img src="userdash/img/partner/1.png" alt="">
				</a> <a href="#"> <img src="userdash/img/partner/2.png" alt="">
				</a> <a href="#"> <img src="userdash/img/partner/3.png" alt="">
				</a> <a href="#"> <img src="userdash/img/partner/4.png" alt="">
				</a> <a href="#"> <img src="userdash/img/partner/5.png" alt="">
				</a>
			</div>
		</div>
	</div>
	<!-- Clients section end -->


	<!-- Footer section -->
	<footer class="footer-section set-bg" data-setbg="userdash/img/footer-bg.jpg">
		<div class="container">
			
			<div class="footer-bottom">
				<div class="footer-nav">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="about.jsp">About us</a></li>
						<li><a href="contact.jsp">Contact</a></li>
					</ul>
				</div>
				<div class="copyright">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i></a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>


	<!--====== Javascripts & Jquery ======-->
	<script src="userdash/js/jquery-3.2.1.min.js"></script>
	<script src="userdash/js/bootstrap.min.js"></script>
	<script src="userdash/js/owl.carousel.min.js"></script>
	<script src="userdash/js/masonry.pkgd.min.js"></script>
	<script src="userdash/js/magnific-popup.min.js"></script>
	<script src="userdash/js/main.js"></script>


	<!-- load for map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0YyDTa0qqOjIerob2VTIwo_XVMhrruxo"></script>
	<script src="userdash/js/map-2.js"></script>

</body>
</html>