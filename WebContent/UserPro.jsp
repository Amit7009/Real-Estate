<%@page import="com.model.BLManager"%>
<%@page import="com.pojo.Register"%>
<%@page import="java.util.List"%>
<%@ include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
BLManager bl=new BLManager();
String email=(String)session.getAttribute("email");
Register reg=bl.serachbyemail(email);
session.setAttribute("li",reg);


%>

		<br /> <br />
		
		<!-- Page top section -->

		<div class="container text-white">
			<h2>Profile</h2>
		</div>
	</section>
<div class="site-breadcrumb">
		<div class="container">
			<a href="index.jsp"><i class="fa fa-home"></i>Home</a>
			<span><i class="fa fa-angle-right"></i>My Profile</span>
		</div>
	</div>

	<!-- page -->
	<section class="page-section blog-page">
		<div class="container">
			<div class="row">
				<div class="col-md-4" >
                        <div class="card card-user">
                            <div class="image" style="background-color:grey;" >
                               <center> <img class="avatar border-gray" src="userdash/images/${li.rimage}" style="width:full;" ></center>
                            </div>
                            <div class="content" style="background-color:white; width:full;">
                                <div class="author">
                                     <a href="#">
                                    
                                    <br>

                                      <h4 class="title text-center" style=" margin-left: 0px;">${name}&nbsp;${lname}<br />
                                         <small>${email}</small><br/>
                                         <small>${address}</small>
                                      </h4>
                                    </a>
                                </div>
                                <p class="description text-center" style=" margin-left: 0px;"> "${li.description}"</p>
                            </div>
                         </div>
				




				</div>
				<div class="col-lg-6">
					<div class="contact-right">
						
						<form class="contact-form" name="myForm" action="UserPro" method="post" enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-6">
									<label>First Name</label>
                                    <input type="text" name="fname" class="form-control"  value="${li.fname}">
								</div>
								<div class="col-md-6">
									<label>Last Name</label>
                                    <input type="text" name="lname" class="form-control" placeholder="Last Name" value="${li.lname}">
								</div>
								<div class="col-md-6">
									<label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" placeholder="${li.email}" value="${li.email}">
								</div>
								<div class="col-md-6">
									<label >Address</label>
                                    <input type="text" name="address" class="form-control" placeholder="${li.address}" value="${li.address}">
								</div>
								<div class="col-md-6">
									<label>Contact No.</label>
                                    <input type="number" name="contact" class="form-control" placeholder="${li.contact}" value="${li.contact}">
								</div>
								<div class="col-md-6">
									<label>Profile Image</label>
                                    <input type="file" name="rimage" class="form-control" placeholder="${li.rimage}" value="${li.rimage}">
								</div>
								
								<div class="col-md-12">
									<label>About Me</label>
                                    <textarea class="form-control" name="description" placeholder="${li.description }" value="${li.description }"></textarea>
									
									<button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

<%@include file="Footer.jsp"%>