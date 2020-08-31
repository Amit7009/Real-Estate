<%@page import="com.pojo.Property"%>
<%@page import="com.pojo.Register"%>
<%@page import="com.model.BLManager"%>
<%@include file="AdminHeader.jsp"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
BLManager bl=new BLManager();
List<Property> p=bl.searchallPropertylist();
session.setAttribute("pro", p);
%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><svg class="glyph stroked home">
							<use xlink:href="#stroked-home"></use></svg></a></li>
			<li class="active">Home</li>
		</ol>
	</div>
	<!--/.row-->
	<br>
	<div class="row"></div>
	<!--/.row-->


	<div class="row">
		<div class="col-lg-12">
	
			<div class="panel panel-default">
				<div class="panel-heading">View  Property Details</div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true">Id</th>
								<th data-field="id0" data-sortable="true">Date</th>
								<th data-field="id1" data-sortable="true">Updated Date</th>
								<th data-field="id2" data-sortable="true">Property Image</th>
								<th data-field="id3" data-sortable="true">Property Name</th>
								<th data-field="id4" data-sortable="true">Size</th>
								<th data-field="id5" data-sortable="true">Value</th>
								<th data-field="id6" data-sortable="true">Address</th>
								<th data-field="id7" data-sortable="true">Seller Name</th>
								<th data-field="id8" data-sortable="true">Seller Email</th>
								<th data-field="id9" data-sortable="true">Seller Image</th>
								<th data-field="id10" data-sortable="true">Action</th>
							</tr>
						</thead>
						<c:forEach items="${sessionScope.pro}" var="l">
							<tr>
								<td data-field="id" data-sortable="true"><c:out
										value="${l.pid}"></c:out></td>
								<td data-field="id0" data-sortable="true"><c:out
										value="${l.pdate}"></c:out></td>
								<td data-field="id1" data-sortable="true"><c:out
										value="${l.udatedDate}"></c:out></td>
								<td data-field="id2" data-sortable="true">
								<img alt="" src="propertyimg/${l.pimage}" width="80" height="80"></td>
								<td data-field="id3" data-sortable="true"><c:out
										value="${l.propertyname}"></c:out></td>
								<td data-field="id4" data-sortable="true"><c:out
										value="${l.size}"></c:out></td>
								<td data-field="id5" data-sortable="true"><c:out
										value="${l.price}"></c:out></td>
								<td data-field="id6" data-sortable="true"><c:out
										value="${l.address}"></c:out></td>
								<td data-field="id7" data-sortable="true"><c:out
										value="${l.register.fname}${l.register.lname}"></c:out></td>
								<td data-field="id8" data-sortable="true"><c:out
										value="${l.register.email}"></c:out></td>
								<td data-field="id9" data-sortable="true">
								<img alt="" src="userdash/images/${l.register.rimage}" width="80" height="80"></td>
								<td data-field="id10" data-sortable="true"><a href="ADeletePro?pid=${l.pid}" style="color: #30a5ff;">Delete</a></td>
								
							</tr>
						</c:forEach>
					</table>
					<button><a href="AdminPro.jsp" >DOWNLOAD</a></button>
				</div>
			</div>
		</div>
	</div>
	<!--/.row-->
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default"></div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">



				<script>
					$(function() {
						$('#hover, #striped, #condensed')
								.click(
										function() {
											var classes = 'table';

											if ($('#hover').prop('checked')) {
												classes += ' table-hover';
											}
											if ($('#condensed').prop('checked')) {
												classes += ' table-condensed';
											}
											$('#table-style')
													.bootstrapTable('destroy')
													.bootstrapTable(
															{
																classes : classes,
																striped : $(
																		'#striped')
																		.prop(
																				'checked')
															});
										});
					});

					function rowStyle(row, index) {
						var classes = [ 'active', 'success', 'info', 'warning',
								'danger' ];

						if (index % 2 === 0 && index / 2 < classes.length) {
							return {
								classes : classes[index / 2]
							};
						}
						return {};
					}
				</script>

			</div>
		</div>
	</div>
	<!--/.row-->


</div>
<!--/.main-->


</body>

</html>
