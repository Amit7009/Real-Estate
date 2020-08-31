<%@page import="com.pojo.Postfeedback"%>
<%@page import="java.util.List"%>
<%@page import="com.pojo.Register"%>
<%@page import="com.model.BLManager"%>
<%@include file="AdminHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	BLManager bl=new BLManager(); 
	List<Postfeedback> feedbacklist=bl.searchFeedback();
	session.setAttribute("fblist",feedbacklist);
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
		
		<div style="color: #00b300; text-align: center; font-size: 15px;">${MsgFile}</div>
			<%
				session.removeAttribute("MsgFile");
			%>

			<div class="panel panel-default">
				<div class="panel-heading">View Feedback</div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true">Id</th>
								<th data-field="id1" data-sortable="true">Name</th>
								<th data-field="id2" data-sortable="true">Email Id</th>
								<th data-field="id3" data-sortable="true">Message</th>
								<th data-field="id4" data-sortable="true">Feedback date</th>
								<th data-field="id5" data-sortable="true">Action</th>
							</tr>
						</thead>
						<c:forEach items="${sessionScope.fblist}" var="li">
							<tr>
								<td data-field="id" data-sortable="true"><c:out
										value="${li.feedid}"></c:out></td>
								<td data-field="id1" data-sortable="true"><c:out
										value="${li.feedname}"></c:out></td>
								<td data-field="id2" data-sortable="true"><c:out
										value="${li.feedemail}"></c:out></td>
								<td data-field="id3" data-sortable="true"><c:out
										value="${li.feedmsg}"></c:out></td>
								<td data-field="id4" data-sortable="true"><c:out
										value="${li.feeddate}"></c:out></td>
								<td data-field="id5" data-sortable="true">
								<a href="DeleteFeedback?ffid=${li.feedid}" style="color: #30a5ff;">Delete</a></td>
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
