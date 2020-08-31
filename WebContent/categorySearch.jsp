<%@include file="Header.jsp" %>



		<br /> <br />
		<!-- Page top section -->

		<div class="container text-white">
			<h2>Property Description</h2>
		</div>
	</section>
	<!--  Page top end -->



	<br />
	<div img src="userdash/img/service-bg.jpg">
		<section class="feature-section spad">
			<div class="container">
				<div class="row">
					<c:forEach items="${sessionScope.cat}" var="c">
				<div class="col-lg-4 col-md-5">
					<!-- feature -->
					<div class="feature-item" style="background-color: white" >
						<div class="feature-pic "> <p><img src="propertyimg/${c.pimage}" width="100%" height="250"></p>
							<div class="sale-notic">FOR SALE</div>
						</div>
						<div class="feature-text">
							<div class="text-center feature-title">
								<h5>${c.propertyname}</h5>
								<p><i class="fa fa-map-marker"></i>${c.address}</p>
							</div>
							<div class="room-info-warp">
								<div class="room-info">
									<div class="rf-left">
										<p><i class="fa fa-th-large"></i>${c.size}</p>
										<p><i class="fa fa-bed"></i>${c.bedroom}</p>
									</div>
									<div class="rf-right">
										<p><i class="fa fa-car"></i></p>
										<p><i class="fa fa-bath"></i>${c.bathroom}</p>
									</div>	
								</div>
								<div class="room-info">
 									<div class="rf-left">
										<p><i class="fa fa-user"></i>${c.register.fname} ${c.register.lname}</p>
									</div>
									<div class="rf-right">
										<p><i class="fa fa-clock-o"></i>${c.pdate }</p>
									</div>	
								</div>
							</div>
							<a href="viewSingleProperty.jsp?pid=${c.pid}" class="room-price">Rs: ${c.price} /-</a>
						</div>
					</div>
				</div>
				</c:forEach>	
					
					
				</div>

			</div>
		</section>
	</div>
	
<%@include file="Footer.jsp" %>