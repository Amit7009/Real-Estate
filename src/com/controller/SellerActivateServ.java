package com.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.model.Emailutil;
import com.pojo.Register;
import com.pojo.Role;


@WebServlet("/SellerActivateServ")
public class SellerActivateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BLManager bl = new BLManager();
	Register reg = new Register();
	Role r = new Role();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();

		String id = request.getParameter("regid");
		int regid=Integer.parseInt(id);
		
		Register reg1=bl.serachbyregid(regid);
		
		String m="Your Account will be Activated";
		String email=reg1.getEmail();
		

		
		ServletContext context = getServletContext();
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		System.out.println(host + " " + port + "  " + user + " " + pass + " " + email + "  " + m);

		try {
			Emailutil.sendEmail1(host, port, user, pass, email,m);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		
		
		reg.setRole(reg1.getRole());
		reg.setRegid(reg1.getRegid());
		reg.setFname(reg1.getFname());
		reg.setLname(reg1.getLname());
		reg.setEmail(reg1.getEmail());
		reg.setPassword(reg1.getPassword());
		reg.setContact(reg1.getContact());
		reg.setAddress(reg1.getAddress());
		reg.setStatus("Activate");
		
		bl.updatesellerdata(reg);
		
		
		session.setAttribute("MsgFile", m);
		
		response.sendRedirect("sellerRequest.jsp");
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
