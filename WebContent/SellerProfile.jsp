<%@page import="com.model.BLManager"%>
<%@page import="com.pojo.Register"%>
<%@page import="java.util.List"%>
<%@ include file="SellerHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
BLManager bl=new BLManager();
String email=(String)session.getAttribute("email");
Register reg=bl.serachbyemail(email);
session.setAttribute("li",reg);


%>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-7">
                        <div class="card">
                            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Profile</h1>
                    </div>
                </div>
            </div>
            
                            <div class="content">
                                                               <form action="ProfileUpdate" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>First Name</label>
                                                <input type="text" name="fname" class="form-control"  value="${li.fname}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Last Name</label>
                                                <input type="text" name="lname" class="form-control" placeholder="Last Name" value="${li.lname}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
									<div class="col-md-12">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Email address</label>
                                                <input type="email" name="email" class="form-control" placeholder="${li.email}" value="${li.email}">
                                            </div>
                                        </div>
                                       </div>
									<div class="row">
									<div class="col-md-12">
                                            <div class="form-group">
                                                <label >Address</label>
                                                <input type="text" name="address" class="form-control" placeholder="${li.address}" value="${li.address}">
                                            </div>
                                        </div>
                                       </div>
									
                                    
                                    <div class="row">
                                    <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Contact No.</label>
                                                <input type="number" name="contact" class="form-control" placeholder="${li.contact}" value="${li.contact}">
                                            </div>
                                        </div>
                                    
                                    <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Profile Image</label>
                                                <input type="file" name="rimage" class="form-control" placeholder="${li.rimage}" value="${li.rimage}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>About Me</label>
                                                <textarea rows="5" class="form-control" name="description" placeholder="${li.description}" value="${description}"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-info btn-fill pull-right">Update
									Profile</button>

                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div> <br><br><br><br>
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

                </div>
            </div>
</div>