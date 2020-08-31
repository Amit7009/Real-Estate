package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.City;

/**
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/DeleteCity")
public class DeleteCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BLManager bl=new BLManager(); 
	City c=new City();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String id = request.getParameter("cityid");
		int cid=Integer.parseInt(id);
		
		c=bl.searchCid(cid);
		
		bl.deletecity(c);
		
		String m = "City Deleted Successfully";
		session.setAttribute("MsgFile", m);
		response.sendRedirect("viewCity.jsp");
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
