<%@page import="com.pojo.Property"%>
<%@page import="com.pojo.Enquiry"%>
<%@page import="com.pojo.Register"%>
<%@page import="com.model.BLManager"%>
<%@include file="SellerHeader.jsp"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	BLManager bl=new BLManager(); 
response.setContentType("text/html");

HttpSession session2=request.getSession();
String email=(String)session2.getAttribute("email");
Register r=bl.serachbyemail(email);

int regid=(Integer)session2.getAttribute("regid");
System.out.println(regid);

List<Enquiry> l=bl.searchenquiryList(regid);
System.out.println(l);
session.setAttribute("List1",l);
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
				<div class="panel-heading">View  Enquiry</div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true">Id</th>
								<th data-field="id0" data-sortable="true">Enquiry Date</th>
								<th data-field="id1" data-sortable="true">Customer Name</th>
								<th data-field="id3" data-sortable="true">Email Id</th>
								<th data-field="id4" data-sortable="true">Customer Contact</th>
								<th data-field="id5" data-sortable="true">Message</th>
								<th data-field="id6" data-sortable="true">Property Name</th>
								<th data-field="id7" data-sortable="true">Property Address</th>
							</tr>
						</thead>
						<c:forEach items="${sessionScope.List1}" var="l">
							<tr>
								<td data-field="id" data-sortable="true"><c:out
										value="${l.eid}"></c:out></td>
								<td data-field="id0" data-sortable="true"><c:out
										value="${l.edate}"></c:out></td>
								<td data-field="id1" data-sortable="true"><c:out
										value="${l.registerByRegid.fname} ${l.registerByRegid.lname}"></c:out></td>
								<td data-field="id3" data-sortable="true"><c:out
										value="${l.registerByRegid.email}"></c:out></td>
								<td data-field="id4" data-sortable="true"><c:out
										value="${l.registerByRegid.contact}"></c:out></td>
								<td data-field="id5" data-sortable="true"><c:out
										value="${l.message}"></c:out></td>
								<td data-field="id6" data-sortable="true"><c:out
										value="${l.property.propertyname}"></c:out></td>
								<td data-field="id7" data-sortable="true"><c:out
										value="${l.property.address}"></c:out></td>
							</tr>
						</c:forEach>
					</table>
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
