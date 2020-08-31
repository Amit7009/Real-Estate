<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="login/css/style.css">
</head>
<body>
<script>

function validateform()
{ 
	var role=document.getElementById('rolename').value;

	if (role==""){
		document.getElementById('rolename').innerHTML=" * * Please fill the Role field"; 
		document.myForm.role.focus();
		return false
	}
	if (role=null)
	{
		document.getElementById('rolename').innerHTML=" * * Please fill the Role field"; 
		document.myForm.role.focus();
		return false
	}
}

function name_valid()
{
  var name= document.myForm.fname.value;
  var x = /^[a-z A-Z]+$/;

  if(name == "")
    {
    document.getElementById('name_error').innerHTML = "*  Fill the Name!";
    document.myForm.fname.focus();
    return false;
    }
    
    if(document.myForm.fname.value.match(x))
    {
      document.getElementById('name_error').innerHTML="";
      return true;
    }
    else
    {
      document.getElementById('name_error').innerHTML = "  Enter only Alphabets !";
      document.myForm.fname.focus();
      //document.signup.phone.value="";
      return false;
    } 
}
function name1_valid()
{
  var name= document.myForm.lname.value;
  var x = /^[a-z A-Z]+$/;

  if(name == "")
    {
    document.getElementById('name1_error').innerHTML = "*  Fill the Name!";
    document.myForm.lname.focus();
    return false;
    }
    
    if(document.myForm.lname.value.match(x))
    {
      document.getElementById('name1_error').innerHTML="";
      return true;
    }
    else
    {
      document.getElementById('name1_error').innerHTML = "  Enter only Alphabets !";
      document.myForm.lname.focus();
      //document.signup.phone.value="";
      return false;
    } 
}

function phone_valid()
{
  var mob_no= document.myForm.contact.value.length;
  var x = /^[0-9]+$/;

  if(mob_no == "")
    {
    document.getElementById('phone_error').innerHTML = "*  Fill the Number!!";
    document.myForm.contact.focus();
    return false;
    }
    
  if(document.myForm.contact.value.match(x))
    {
    	if(mob_no<10 ||  mob_no>10)
    	{
   		   document.getElementById('phone_error').innerHTML="Enter 10 digits!!";
   		   document.myForm.contact.focus();
   		   return false;
    	}
    	else
    	{
    	  document.getElementById('phone_error').innerHTML ="";
    	  return true;
    	}
    	document.getElementById('phone_error').innerHTML="";
    	return true;
   } 
   	else
    	{
    	document.getElementById('phone_error').innerHTML="* *Enter Only Digits";
    	document.myForm.contact.focus();
    	}
}

</script>
    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="post" name="myForm" class="register-form" id="register-form" action="RegistrationServlet">
                        
                            <div class="form-group">
                                <label for="role"><i class="zmdi zmdi-account material-icons-name"></i></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <select name="role" onBlur="validateform()" id="role" style="width:80px;" required>
                                	<option value=""disabled selected>Role</option>
                                    <option value="Seller">Seller</option>
                                    <option value="User">User</option>
                                </select>
                                <span id="rolename" class="text-danger font-weight-bold"></span>
                            </div>
                        
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="fname" onBlur="name_valid()" id="fname" placeholder="First Name" required/><span id="name_error"></span>
                            </div>
                              <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="lname" onBlur="name1_valid()" id="lname" placeholder="Last Name" required/><span id="name1_error"></span>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email" required/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password" required/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="address" id="re_pass" placeholder="Address" required/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="contact" onBlur="phone_valid()" id="re_pass" placeholder="contact" required/><span id="phone_error"></span>
                                
                            </div>
                          
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="login/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="login1.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="login/vendor/jquery/jquery.min.js"></script>
    <script src="login/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>