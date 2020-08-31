<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin- Dashboard</title>
<link href="css1/bootstrap-table.css" rel="stylesheet">
<link href="css1/bootstrap.min.css" rel="stylesheet">
<link href="css1/datepicker3.css" rel="stylesheet">
<link href="css1/styles.css" rel="stylesheet">
<link rel="stylesheet" href="userdash/css/font-awesome.min.css" />

<!--Icons-->
<script src="js1/lumino.glyphs.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="AdminDashboard.jsp"> <img alt=""
					src="images/logo.jpg" width="200" height="80"></a>
				<center>
					<strong style="font-size: 30px; color: white;"><b>Admin Management</b></strong>
				</center>

				<ul class="user-menu">
					<li class="dropdown pull-right"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><svg
								class="glyph stroked male-user">
								<use xlink:href="#stroked-male-user"></use></svg> ${name} <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="Profile.jsp"><svg class="glyph stroked male-user">
										<use xlink:href="#stroked-male-user"></use></svg> Profile</a></li>
							<!-- <li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Settings</a></li> -->
							<li><a href="LogoutServlet">
							<svg class="glyph stroked cancel">
										<use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul></li>
				</ul>
			</div>

		</div>
		<!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<table class="Responsive">
			<form role="search">
				<div id="search_manage">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
				</div>
			</form>
		</table>
		<ul class="nav menu">
			<li class="active"><a href="AdminDashboard.jsp"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg>Admin Dashboard</a></li>
				<li><a href="Profile.jsp" class="fa fa-vcard"> &nbsp;&nbsp;&nbsp;&nbsp;Admin Profile</a></li>
			    <li><a href="addcity.jsp" class="fa fa-home">&nbsp;&nbsp;&nbsp;&nbsp;Add City</a></li>
			    <li><a href="sellerRequest.jsp" class="fa fa-user-plus">&nbsp;&nbsp;&nbsp;&nbsp;Seller Request</a></li>
				<li><a href="viewSeller.jsp" class="fa fa-users">&nbsp;&nbsp;&nbsp;&nbsp;View Seller</a></li>
				<li><a href="viewUser.jsp" class=" fa fa-users">&nbsp;&nbsp;&nbsp;&nbsp;View User</a></li>
				<li><a href="AdminProperty.jsp" class=" fa fa-building-o">&nbsp;&nbsp;&nbsp;&nbsp;View Property</a></li>
				<li><a href="connectedPeople.jsp" class="menu-icon fa fa-users">&nbsp;&nbsp;&nbsp;&nbsp;Connected People </a></li>
				<li><a href="viewFeedback.jsp" class="menu-icon fa fa-envelope">&nbsp;&nbsp;&nbsp;&nbsp;Feedback </a></li>
				<li><a href="changePasswordAdmin.jsp" class="fa fa-key">&nbsp;&nbsp;&nbsp;&nbsp;Change Password</a></li>
   		</ul>
		
	</div>
	
	<!--/.sidebar-->



	<script src="js1/jquery-1.11.1.min.js"></script>
	<script src="js1/bootstrap.min.js"></script>
	<script src="js1/chart.min.js"></script>
	<script src="js1/chart-data.js"></script>
	<script src="js1/easypiechart.js"></script>
	<script src="js1/easypiechart-data.js"></script>
	<script src="js1/bootstrap-datepicker.js"></script>
	<script src="js1/bootstrap-table.js"></script>
	<script>
		$('#calendar').datepicker({});

		!function($) {
			$(document)
					.on(
							"click",
							"ul.nav li.parent > a > span.icon",
							function() {
								$(this).find('em:first').toggleClass(
										"glyphicon-minus");
							});
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function() {
			if ($(window).width() > 768)
				$('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function() {
			if ($(window).width() <= 767)
				$('#sidebar-collapse').collapse('hide')
		})
	</script>
</body>

</html>
