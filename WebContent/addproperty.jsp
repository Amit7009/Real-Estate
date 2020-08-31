<%@page import="com.pojo.City"%>
<%@page import="com.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="SellerHeader.jsp"%>
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
<script>
	
	function name_valid()
	{
		var name= document.myForm.pname.value;
		var x = /^[a-z A-Z]+$/;

  		if(name == "")
    	{
    		document.getElementById('name_error').innerHTML = "*  Fill the Property Name!";
    		document.myForm.pname.focus();
    		return false;
    	}
    
    	if(document.myForm.pname.value.match(x))
    	{
    	  document.getElementById('name_error').innerHTML="";
    	  return true;
    	}
    	else
    	{    		  document.getElementById('name_error').innerHTML = "  Enter only Alphabets !";
    		  document.myForm.pname.focus();
    		  //document.signup.phone.value="";
    		  return false;
    	} 
	}
	
	function size_valid()
	{
	  var mob_no= document.myForm.psize.value.length;
	  var x = /^[0-9]+$/;

	  if(mob_no == " ")
	    {
	    document.getElementById('size_error').innerHTML = "*  Fill the Number!!";
	    document.myForm.psize.focus();
	    return false;
	    }
	  if(document.myForm.psize.value.match(x))
	  {
  		document.getElementById('size_error').innerHTML=" ";
  	//	document.myForm.psize.focus();
  	return true;
	  }
	  else{
		  document.getElementById('size_error').innerHTML="* Enter only Digits ";
		  document.myForm.psize.focus();
	  }
	}
	
	
	function bed_valid()
	{
	  var mob_no= document.myForm.bedroom.value.length;
	  var x = /^[0-9]+$/;
			
			  if(document.myForm.bedroom.value.match(x))
			    {
			    	document.getElementById('phone1_error').innerHTML="";
			    	return true;
			   } 
			  else
				  {
	    	document.getElementById('phone1_error').innerHTML="* *Enter Only Digits";
	    	document.myForm.bedroom.focus();
	    	
				  }
	}
	function bath_valid()
	{
	  var mob_no= document.myForm.bathroom.value.length;
	  var x = /^[0-9]+$/;

	  if(mob_no == "")
	    {
	    document.getElementById('phone2_error').innerHTML = "*  *Fill the Number!!";
	    document.myForm.bathroom.focus();
	    return false;
	    }
	    
	  if(document.myForm.bathroom.value.match(x))
	    {
	    	document.getElementById('phone2_error').innerHTML="";
	    	return true;
	   } 
	   	else
	    	{
	    	document.getElementById('phone2_error').innerHTML="* *Enter Only Digits";
	    	document.myForm.bathroom.focus();
	    	}
	}

	function price_valid()
	{
		var mob_no= document.myForm.pvalue.value.length;
		  var x = /^[0-9]+$/;

		  if(mob_no == "")
		    {
		    document.getElementById('price_error').innerHTML = "*  *Fill the Number!!";
		    document.myForm.pvalue.focus();
		    return false;
		    }
		    
		  if(document.myForm.pvalue.value.match(x))
		    {
		    	document.getElementById('price_error').innerHTML="";
		    	return true;
		   } 
		   	else
		    	{
		    	document.getElementById('price_error').innerHTML="* *Enter Only Digits";
		    	document.myForm.pvalue.focus();
		    	}
	}
</script>
	 	

        <%
		   BLManager bl=new BLManager();
		   List<Category> l=bl.searchcategory1();
		   session.setAttribute("li",l);
		   
		   List<City> city=bl.searchcity();
		   session.setAttribute("ci",city);

		%>

	<div class="row">
		<div class="col-md-12">
		
		<div style="color: #00b300; text-align: center; font-size: 15px;">${MsgFile}</div>
			<%
				session.removeAttribute("MsgFile");
			%>
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Add Property Details</b>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" name="myForm" action="AddProductDetails" method="post" enctype="multipart/form-data">
						<fieldset>
							<!-- Name input-->
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select Category</label>
								<div class="col-md-4">
									<!-- <input id="name" name="category" type="text"
										placeholder="Home,Apartment etc" class="form-control"> -->
								    <select name="cname" class="form-control" required>
								    		<option value=""disabled selected>Select Category</option>
								     <c:forEach items="${sessionScope.li}" var="l">
								         <option>${l.cname}</option>
								     </c:forEach>
								    </select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Property Name </label>
								<div class="col-md-4">
									<input id="name" name="pname" type="text" onBlur="name_valid()"
										placeholder="Property Name" class="form-control" required><span id="name_error"></span>
								</div>
							</div>
							
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Property Size </label>
								<div class="col-md-4">
									<input id="name" onBlur="size_valid()" name="psize" type="text"
										placeholder="1024 sq-feet" class="form-control" required><span id="size_error"></span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Bedroom</label>
								<div class="col-md-4">
									<input id="name" name="bedroom" type="text" onBlur="bed_valid()"
										placeholder="Bedrooms" class="form-control" ><span id="phone1_error"></span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name"> Bathroom </label>
								<div class="col-md-4">
									<input id="name" name="bathroom" onBlur="bath_valid()" type="text"
										placeholder="Bathrooms" class="form-control" required><span id="phone2_error"></span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Property Values </label>
								<div class="col-md-4">
									<input id="name" onBlur="price_valid()" name="pvalue" type="text"
										placeholder="25,000/-" class="form-control" required><span id="price_error"></span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Property Image </label>
								<div class="col-md-4">
									<input id="name" name="pimage" type="file"
										class="form-control" required>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Property Address </label>
								<div class="col-md-4">
									<input id="name" name="address" type="text"
										placeholder="Swargate pune" class="form-control" required>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select City</label>
								<div class="col-md-4">
								     <select name="cityname" class="form-control" required>
								     
								     <c:forEach items="${sessionScope.ci}" var="c">
								         <option>${c.cityname}</option>
								     </c:forEach>
								    </select>
								</div>
							</div>
							
							
								<div class="form-group">
								<label class="col-md-3 control-label" for="name">Property Description </label>
								<div class="col-md-4">
									<input type="text"	class="form-control" name="description"
													placeholder="project description"
													style="width: 100%; height: 100px;" required>
								</div>
							</div>
							
						
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<input type="submit" value="Add Property" name="flag" class="btn btn-default btn-md pull-right" style="color: black;">
											
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