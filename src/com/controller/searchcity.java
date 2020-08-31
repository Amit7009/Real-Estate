package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Property;
import com.pojo.Register;

/**
 * Servlet implementation class searchcity
 */
@WebServlet("/searchcity")
public class searchcity extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	BLManager bl=new BLManager();
	Register reg=new Register();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		reg=bl.serachbyemail(email);
		
		if(email==null){
			response.sendRedirect("login1.jsp");
			
		}
		else{
			String city=request.getParameter("city");
			List<Property> p=bl.searchcity1(city);
			session.setAttribute("cat", p);
			response.sendRedirect("searchcity.jsp");
			
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	

}
