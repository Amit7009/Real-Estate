<%@include file="userheader.jsp" %>



	<!-- Hero section -->
	<section class="hero-section set-bg" data-setbg="userdash/img/bg.jpg">
		<div class="container hero-text text-white">
			<h2>find your place with our local life style</h2>
			<p>Search real estate property records, houses, condos, land and more on leramiz.com®.<br>Find property info from the most comprehensive source data.</p>
			
		</div>		<br/>
		<br/>
		
		<br/>
	<%
	BLManager bl=new BLManager();
	List<City> l=bl.searchbycity();
	session.setAttribute("ci", l);
	%>
			
			
			 <form class="site-btn " style="margin-left: 450px;" action="searchcity" >
				<select name="city" style="width: 250px; height:35px; color: black;" class="fa fa-angle-down">
					<c:forEach items="${sessionScope.ci}" var="c">
					<option >${c.cityname}</option>
					</c:forEach>
				</select>
				<button type="submit" class="fa fa-search site-btn" style="margin-top:0px;">SEARCH</button>
						</form>
	 </section>
	<!-- Filter form section end -->
	
	

	<!-- Services section -->
		<section class="services-section spad set-bg" data-setbg="userdash/img/service-bg.jpg" alt="">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<img src="userdash/img/service.jpg" alt="">
				</div>
				<div class="col-lg-5 offset-lg-1 pl-lg-0">
					<div class="section-title text-white">
						<h3>OUR SERVICES</h3>
						<p>We provide the perfect service for </p>
					</div>
					<div class="services">
						<div class="service-item">
							<i class="fa fa-comments"></i>
							<div class="service-text">
								<h5>Consultant Service</h5>
								<p>We can give proper guidance on how to invest in real real estate and make a fortune.</p>
							</div>
						</div>
						<div class="service-item">
							<i class="fa fa-home"></i>
							<div class="service-text">
								<h5>Properties Management</h5>
								<p>We manages residential, commercial and/or industrial real estate, including apartments, houses, office buildings, villas.</p>
							</div>
						</div>
						<div class="service-item">
							<i class="fa fa-briefcase"></i>
							<div class="service-text">
								<h5>Selling</h5>
								<p>To make a profit on a property investment, home owners can sell the property. We look at the factors to consider, to arrive at the right decision in the present market.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	<!-- feature category section -->
	<section class="feature-category-section spad">
		<div class="container">
			<div class="section-title text-center">
				<h3>LOOKING PROPERTY</h3>
				<p>What kind of property are you looking for? We will help you</p>
			</div>
			<div class="row">
			<%
	  List<Category> c=bl.searchcategory1();
	  session.setAttribute("cat",c);
	  
	  String  h="Home";
	  String  a="Appartment";
	  String  v="Villas";
	  String  o="Office Buildings";
	  
	  List<Property> pro=bl.searchbyhome(h);
	  session.setAttribute("home",pro);
	  
	  List<Property> p=bl.searchbyapp(a);
	  session.setAttribute("app",p);
	  
	  List<Property> pr=bl.searchbyvilla(v);
	  session.setAttribute("villa",pr);
	  
	  List<Property> po=bl.searchbyoffice(o);
	  session.setAttribute("off",po);
	  
	  List<Property> of=bl.searchbypro();
	  session.setAttribute("pr",of);
	  
	  HttpSession session2 = request.getSession(true);
	  response.setContentType("text/html");
	  
	  Integer hitsCount = (Integer)session2.getAttribute("hitCounter");
      if( hitsCount ==null || hitsCount == 0 ) {
         /* First visit */
         hitsCount = 1;
      } else {
         /* return visit */
         hitsCount += 1;
      }
      session2.setAttribute("hitCounter", hitsCount);
	  
	%>
			
				<div class="col-lg-3 col-md-6 f-cata">
					<a href="session?cname=Home">
					<img src="userdash/img/feature-cate/2.jpg" width="FULL" height="200">
					<h5>Home</h5><h5>${home}</h5></a>
				</div>
				<div class="col-lg-3 col-md-6 f-cata">
					<a href="session?cname=Appartment">
					<img src="userdash/img/feature-cate/1.jpg" width="FULL" height="200">
					<h5>Appartment</h5><h5>${app}</h5>
					</a>
				</div>
				
				<div class="col-lg-3 col-md-6 f-cata">
					<a href="session?cname=Villas">
					<img src="userdash/img/feature/1.jpg" width="FULL" height="200">
					<h5>Villas</h5><h5>${villa}</h5></a>
				</div>
				<div class="col-lg-3 col-md-6 f-cata">
					<a href="session?cname=Office Buildings">
					<img src="userdash/img/feature-cate/4.jpg" width="FULL" height="200">
					<h5>Office Buildings</h5><h5>${off}</h5>
					 </a>
				</div>
				
			</div> 
			
		</div>
		<br>
		<br>
		<a href="allsession" style="margin-left: 560px;" class="site-btn">VIEW ALL PROPERTY <pi>${pr}</pi></a>
	</section>
	<!-- feature category section end-->
	
	
	
<%@include file="Footer.jsp" %>


	