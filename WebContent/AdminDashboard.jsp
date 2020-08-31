<%@page import="java.util.List"%>
<%@page import="com.pojo.Register"%>
<%@page import="com.model.BLManager"%>
<%@include file="AdminHeader.jsp" %>
<%@page isELIgnored="false" %>
<%
	BLManager bl=new BLManager(); 
	String sel="Seller";
	String us="User";
	String act="Activate";
	String dea="Deactivate";
	List<Register> l=bl.CountsellerList(act,sel);
	session.setAttribute("count1",l);
	List<Register> r=bl.Countsellerreq(dea,sel);
	session.setAttribute("count2",r);
	List<Register> reg=bl.CountUser(us);
	session.setAttribute("count3",reg);
%>


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
		
		
		
		<div class="row">
			<div class="col-lg-12">
				
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Users</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="${count3}%" ><span class="percent">${count3}%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>New Request</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="${count2}%" ><span class="percent">${count2}%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Comments</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="65" ><span class="percent">65%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Activated Seller</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="${count1}" ><span class="percent">${count1}%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Visitors</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="${hitCounter}" ><span class="percent">${hitCounter}%</span>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
								
		
	</div>	<!--/.main-->