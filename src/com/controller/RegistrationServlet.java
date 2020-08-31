package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BLManager;
import com.pojo.Register;
import com.pojo.Role;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BLManager bl = new BLManager();
	Register reg = new Register();
	Role r = new Role();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String phone = request.getParameter("contact");
		String address = request.getParameter("address");
		String rollname = request.getParameter("role");
		
		List<Register> n=bl.searchbyreg(email);
		System.out.println(r);
		Date d =new Date(0);
		if(n.isEmpty())
		{
		
		
		r = bl.serachchbyroll(rollname);

		if (r.getRolename().equals("Seller")) {
			reg.setRole(r);
			reg.setFname(fname);
			reg.setLname(lname);
			reg.setEmail(email);
			reg.setPassword(pass);
			reg.setContact(phone);
			reg.setStatus("Deactivate");
			reg.setAddress(address);
			reg.setDate(d);

			bl.savereg(reg);

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Registration Successfully...');");
			out.println("location='index.jsp';");
			out.println("</script>");

		} else {
			reg.setRole(r);
			reg.setFname(fname);
			reg.setLname(lname);
			reg.setEmail(email);
			reg.setPassword(pass);
			reg.setContact(phone);
			reg.setStatus("Activate");
			reg.setAddress(address);
			reg.setDate(d);

			bl.savereg(reg);

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Registration Successfully...');");
			out.println("location='index.jsp';");
			out.println("</script>");
		}
	}else
	{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Email id already exist...');");
		out.println("location='registration.jsp';");
		out.println("</script>");
	}
	}

}
