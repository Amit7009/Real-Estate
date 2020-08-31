package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Category;
import com.pojo.Property;
import com.pojo.Register;

/**
 * Servlet implementation class DeleteProperty
 */
@WebServlet("/DeleteProperty")
public class DeleteProperty extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	BLManager bl=new BLManager();
	Property p=new Property();
	Register reg=new Register();
	Category c=new Category();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String pid1 = request.getParameter("pid");
		int pid=Integer.parseInt(pid1);
		
		p=bl.searchpropertyid(pid);
		
		bl.deleteproperty(p);
		
		String m = "Property Deleted Successfully";
		session.setAttribute("MsgFile", m);
		response.sendRedirect("viewproperty.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
