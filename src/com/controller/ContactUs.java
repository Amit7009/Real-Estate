package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BLManager;
import com.pojo.Contactus;

@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BLManager bl=new BLManager();
	Contactus conn=new Contactus();
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String msg = request.getParameter("msg");
		Date date = new Date();

		conn.setName(name);
		conn.setEmail(email);
		conn.setMsg(msg);
		conn.setDate(date);
		
		bl.savecontact(conn);
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Thank you for connecting with us!!!');");
		out.println("location='index.jsp';");
		out.println("</script>");


	}

}
