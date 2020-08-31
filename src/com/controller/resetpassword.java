package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;

import com.model.BLManager;
import com.model.Emailutil;
import com.pojo.Register;

/**
 * Servlet implementation class resetpassword
 */
@WebServlet("/resetpassword")
public class resetpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    BLManager bl= new BLManager();
    Register r= new Register();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String email = request.getParameter("email");

		String newPassword = resetCustomerPassword(email);

		String m = "Hi, this is your new password: " + newPassword;
		m += "\nNote: for security reason, " + "you must change your password after logging in.";
		
		
		ServletContext context = getServletContext();
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		System.out.println(host + " " + port + "  " + user + " " + pass + " " + email + " "+m);

		try {
			Emailutil.sendEmail1(host, port, user, pass, email,m);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Password sent successfully to your email ...');");
		out.println("location='login1.jsp';");
		out.println("</script>");

	}
	public String resetCustomerPassword(String email) {
	    Register r = bl.serachbyemail1(email);
	     
	    String randomPassword = RandomStringUtils.randomAlphanumeric(10);
	     
	    
	    
	    
	    r.setPassword(randomPassword);
	    bl.updateRegistration(r);
	     
	    return randomPassword;
	}
	

}

