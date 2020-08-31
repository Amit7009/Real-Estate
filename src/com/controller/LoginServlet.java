package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Register;
import com.pojo.Role;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	BLManager bl = new BLManager();
	Register reg = new Register();
	Role r = new Role();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
PrintWriter out = response.getWriter();
		
	    String email=request.getParameter("email");
	    String pass=request.getParameter("pass");
	    
	    System.out.println(email+"---"+pass);
	    
	    boolean b=bl.serachbyep(email,pass);
	    
	    System.out.println(b);
	    
	    if(b==true)
	    {
	    	reg=bl.serachbyemail(email);
	    	Integer regid=reg.getRegid();
	    	String fname=reg.getFname();
	    	String roll=reg.getRole().getRolename();
	    	String lname=reg.getLname();
	    	String password=reg.getPassword();
	    	String mob=reg.getContact();
	    	String address=reg.getAddress();
	    	String rimage=reg.getRimage();
	    	String description=reg.getDescription();
	    	
	    	System.out.println("------------>>> "+roll);
	    	
	    	if(roll.equals("Admin"))
	    	{
	    		
	    		HttpSession session=request.getSession();
	    		session.setAttribute("regid",regid);
	    		session.setAttribute("name",fname);
	    		session.setAttribute("email",email);
	    		session.setAttribute("lname",lname);
	    		session.setAttribute("password",password);
	    		session.setAttribute("mob",mob);
	    		session.setAttribute("address",address);
	    		session.setAttribute("rimage",rimage);
	    		session.setAttribute("description", description);
	    		
	    		out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome To Admin Dash');");
				out.println("location='AdminHeader.jsp';");
				out.println("</script>");
				
				
	    	}else if(roll.equals("Seller"))
	    	{
	    		
	    		if(reg.getStatus().equals("Activate"))
	    		{
	    		
	    		HttpSession session=request.getSession();
	    		session.setAttribute("regid",regid);
	    		session.setAttribute("name",fname);
	    		session.setAttribute("email",email);
	    		session.setAttribute("lname",lname);
	    		session.setAttribute("password",password);
	    		session.setAttribute("mob",mob);
	    		session.setAttribute("address",address);
	    		session.setAttribute("rimage",rimage);
	    		session.setAttribute("description", description);
	    		
	    		out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome Seller Dash');");
				out.println("location='SellerHeader.jsp';");
				out.println("</script>");
	    		}else
	    		{
	    			out.println("<script type=\"text/javascript\">");
					out.println("alert('User Account Is Not Activate..');");
					out.println("location='index.jsp';");
					out.println("</script>");
	    		}
				
	    	}else if(roll.equals("User"))
	    	{
	    		HttpSession session=request.getSession();
	    		session.setAttribute("regid",regid);
	    		session.setAttribute("name",fname);
	    		session.setAttribute("email",email);
	    		session.setAttribute("lname",lname);
	    		session.setAttribute("password",password);
	    		session.setAttribute("mob",mob);
	    		session.setAttribute("address",address);
	    		session.setAttribute("rimage",rimage);
	    		session.setAttribute("description", description);
	    		
	    		//response.sendRedirect("index.jsp");
	    		out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome to Real Estate');");
				out.println("location='index.jsp';");
				out.println("</script>");
	    	}
	    }else
	    {
	    	out.println("<script type=\"text/javascript\">");
			out.println("alert('Email & password is incorrect Plz try again');");
			out.println("location='login1.jsp';");
			out.println("</script>");
	    }
	}

}
