	

<script>
function name_valid()
{
  var name= document.myForm.name.value;
  var x = /^[a-z A-Z]+$/;

  if(name == "")
    {
    document.getElementById('name_error').innerHTML = "*  Fill the Name!";
    document.myForm.name.focus();
    return false;
    }
    
    if(document.myForm.name.value.match(x))
    {
      document.getElementById('name_error').innerHTML="";
      return true;
    }
    else
    {
      document.getElementById('name_error').innerHTML = "  Enter only Alphabets !";
      document.myForm.name.focus();
      //document.signup.phone.value="";
      return false;
    } 
}
</script>

<%@include file="Header.jsp" %>
	<!-- Page top section -->
		<div class="container text-white">
			<h2>Feedback</h2>
		</div>
	<!--  Page top end -->

	<!-- Breadcrumb -->
	<div class="site-breadcrumb">
		<div class="container">
			<a href="index.jsp"><i class="fa fa-home"></i>Home</a>
			<span><i class="fa fa-angle-right"></i>Feedback</span>
		</div>
	</div>

	<!-- page -->
	<section class="page-section blog-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<img src="userdash/images/image15.jpg" alt="">
				</div>
				<div class="col-lg-6">
					<div class="contact-right">
						<div class="section-title">
							<h3>Share your Feedback</h3>
							<p>Help us to serve you better</p>
						</div>
						<form class="contact-form" name="myForm" action="UserFeedbackServ" method="post">
							<div class="row">
								<div class="col-md-6">
									<input type="text" onBlur="name_valid()" name="name" placeholder="Your name" required><span id="name_error"></span>
								</div>
								<div class="col-md-6">
									<input type="email" name="email" placeholder="Your email" required>
								</div>
								<div class="col-md-12">
									<textarea  name="msg" placeholder="Your message" required></textarea>
									<button class="site-btn">POST</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- page end -->

<%@include file="Footer.jsp" %>
                                        
