<%@page import="com.pojo.City"%>
<%@page import="com.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="AdminHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><svg class="glyph stroked home">
						<use xlink:href="#stroked-home"></use></svg></a></li>
			<li class="active">Home</li>
		</ol>
	</div>
	<!--/.row-->

	<div class="row" style="padding-top: 20px;">
		<div class="col-lg-12">
			<!-- <h1 class="page-header">Widgets</h1> -->
		</div>
	</div>
	<!--/.row-->



	<div class="row">
		<div class="col-md-12">
		
		<div style="color: #00b300; text-align: center; font-size: 15px;">${MsgFile}</div>
			<%
				session.removeAttribute("MsgFile");
			%>
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Add City</b>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" action="AddCity" method="post">
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Add City </label>
								<div class="col-md-6">
									<input id="name" name="city" type="text"
										placeholder="Home,Apartment etc" class="form-control">
								</div>
							</div>
							
						
							
						
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<!-- <button type="submit"
											class="btn btn-default btn-md pull-right">Save Password</button> -->
											<input type="submit" value="View City" name="flag" class="btn btn-default btn-md pull-right" style="color: aqua;">
											<input type="submit" value="Add City" name="flag" class="btn btn-default btn-md pull-right" style="color: aqua;">
											
									</div>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</div>
		
		
		<div class="row">
		<div class="col-lg-12">
		
		<%
		   BLManager bl=new BLManager();
		   List<City> l=bl.searchcity();
		   session.setAttribute("city",l);
		%>
			<div class="panel panel-default">
				<div class="panel-heading">View  City</div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true">Id</th>
								<th data-field="id1" data-sortable="true">City Name</th>
								<th data-field="id2" data-sortable="true">Update</th>
								<th data-field="id3" data-sortable="true">Delete</th>
							
							</tr>
						</thead>
						<c:forEach items="${sessionScope.city}" var="l">
							<tr>
								<td data-field="id" data-sortable="true"><c:out
										value="${l.cityid}"></c:out></td>
								<td data-field="id1" data-sortable="true"><c:out
										value="${l.cityname}"></c:out></td>
								<td data-field="id2" data-sortable="true"><a href="UpdateCity?cityid=${l.cityid}" style="color: black;">Update</a></td>
								<td data-field="id3" data-sortable="true"><a href="DeleteCity?cityid=${l.cityid}" style="color: black;">Delete</a></td>
							
								
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	


	</div>
	<!--/.row-->
</div>
<!--/.main-->