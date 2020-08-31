package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Enquiry;
import com.pojo.Property;
import com.pojo.Register;
import com.sun.corba.se.spi.legacy.connection.GetEndPointInfoAgainException;

/**
 * Servlet implementation class SendEnquiryController
 */
@WebServlet("/SendEnquiryController")
public class SendEnquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	BLManager bl=new BLManager();
	Register reg= new Register();
	Property p=new Property();
	Enquiry e=new Enquiry();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	response.setContentType("text/html");
		
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		Register reg1=bl.serachbyemail(email);
		
		String pid=request.getParameter("pid");
	      int id=Integer.parseInt(pid);
	      p=bl.searchpropertyid(id);
	      
	      
	      String m=request.getParameter("desc");
	      System.out.println(m);
	      
	      Date date=new Date();
	      
	      e.setRegisterByRegid(reg1);
	      e.setProperty(p);
	      e.setMessage(m);
	      e.setEdate(date);
	      e.setRegisterByRid(p.getRegister());
	      
	      
	      bl.saveEnq(e);
	      response.sendRedirect("index.jsp");
	}

}
