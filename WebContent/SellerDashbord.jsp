<%@page import="com.pojo.Enquiry"%>
<%@page import="com.pojo.Property"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@include file="SellerHeader.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Icons</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Dashboard</h2>
			</div>
		</div><!--/.row-->
		
		<%
		BLManager bl=new BLManager(); 
		String em=(String)session.getAttribute("email");
		List<Property> p=bl.countsellerproperty(em);
		session.setAttribute("epro", p);
		
		int regid=(Integer)session.getAttribute("regid");
		List<Enquiry> pi=bl.countEnquiryproperty(regid);
		session.setAttribute("ep", pi);
		%>
		
		<div class="row">
			<div class="col-lg-12">
				
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>My Properties</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="${epro}%" ><span class="percent">${epro}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Property Enquiry</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="${ep}%" ><span class="percent">${ep}</span>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>New Users</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="56" ><span class="percent">56%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Visitors</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="27" ><span class="percent">27%</span>
						</div>
					</div>
				</div>
			</div> -->
		</div><!--/.row-->
								
		
	</div>	<!--/.main-->