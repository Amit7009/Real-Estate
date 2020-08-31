<%@page import="com.pojo.Register"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@page import="com.pojo.Enquiry"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<%
	BLManager bl=new BLManager();
HttpSession session3=request.getSession();
	String email=(String)session3.getAttribute("email");
	Register r=bl.serachbyemail(email);

	int regid=(Integer)session3.getAttribute("regid");
	System.out.println(regid);


	List<Enquiry> l=bl.searchenquiryList1(regid);
	System.out.println(l);
	session.setAttribute("li",l);
%>
	
		
		
		<br /> <br />
		
		<!-- Page top section -->

		<div class="container text-white">
			<h2>All Type Properties</h2>
		</div>
	</section>
	<!--  Page top end -->



	<br />
	
	<div img src="userdash/img/service-bg.jpg">
		<section class="feature-section spad">
			<div class="container">
				<div class="row">
					<c:forEach  items="${sessionScope.li}" var="c">
				<div class="col-lg-4 col-md-5">
					<!-- feature -->
					<div class="feature-item" style="background-color: white" >
						<div class="feature-pic "> <p><img src="propertyimg/${c.property.pimage}" width="100%" height="250"></p>
							<div class="sale-notic">FOR SALE</div>
						</div>
						<div class="feature-text">
							<div class="text-center feature-title">
								<h5>${c.property.propertyname}</h5>
								<p><i class="fa fa-map-marker"></i>${c.property.address}</p>
							</div>
							<div class="room-info-warp">
								<div class="room-info">
									<div class="rf-left">
										<p><i class="fa fa-th-large"></i>${c.property.size}</p>
										<p><i class="fa fa-bed"></i>${c.property.bedroom}</p>
									</div>
									<div class="rf-right">
										<p><i class="fa fa-car"></i></p>
										<p><i class="fa fa-bath"></i>${c.property.bathroom}</p>
									</div>	
								</div>
								<div class="room-info">
 									<div class="rf-left">
										<p><i class="fa fa-user"></i>${c.registerByRid.fname} ${c.registerByRid.lname}</p>
									</div>
									<div class="rf-right">
										<p><i class="fa fa-clock-o"></i>${c.property.pdate}</p>
									</div>	
								</div>
							</div>
							<a href="viewSingleProperty.jsp?pid=${c.property.pid}" class="room-price">Rs: ${c.property.price} /-</a>
							<h5>${c.message}</h5>
							<p><i class="fa fa-clock-o"></i>${c.edate}</p>
						</div>
						
					</div>
				</div>
				</c:forEach>	
					
					
				</div>

			</div>
		</section>
	</div>
<%@include file="Footer.jsp" %>