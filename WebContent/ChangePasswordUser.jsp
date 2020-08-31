<%@ include file="Header.jsp"%>
<br /> <br />
		
		<!-- Page top section -->

		<div class="container text-white">
			<h2>Change Password</h2>
		</div>
	</section>
<div class="site-breadcrumb">
		<div class="container">
			<a href="index.jsp"><i class="fa fa-home"></i>Home</a>
			<span><i class="fa fa-angle-right"></i>Change My Password</span>
		</div>
	</div>
	<!--/.row-->



	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<center><form class="form-horizontal" action="EditUserPassword" method="post" >
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Enter Old Password </label>
								<div class="col-md-6">
									<input id="name" name="oldPass" type="password"
										placeholder="****" class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">New Password </label>
								<div class="col-md-6">
									<input id="name" name="newPass" type="password"
										placeholder="****" class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Confirm Password </label>
								<div class="col-md-6">
									<input id="name" name="confrmPass" type="password"
										placeholder="****" class="form-control">
								</div>
							</div>
							
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<button type="submit"
											class="btn btn-default btn-md pull-right">Save Password</button>
									</div>
								</div>
							</div>

						</fieldset>
					</form></center>
				</div>
			</div>
		</div>
	


	</div>
	<!--/.row-->
</div>
<%@ include file="Footer.jsp"%>