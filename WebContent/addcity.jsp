<%@ include file="AdminHeader.jsp"%>

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
					<form class="form-horizontal" action="AddCity" method="post" >
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Add City </label>
								<div class="col-md-6">
									<input id="name" name="city" type="text"
										placeholder="Pune,Mumbai etc" class="form-control">
								</div>
							</div>
							
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<input type="submit" value="Add City" name="flag" class="btn btn-default btn-md pull-right" style="color: black;">
											<input type="submit" value="View City" name="flag" class="btn btn-default btn-md pull-right" style="color: black;">
											
									</div>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</div>
	


	</div>
	<!--/.row-->
</div>
<!--/.main-->