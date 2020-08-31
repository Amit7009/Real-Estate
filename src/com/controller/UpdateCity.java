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
 * Servlet implementation class UpdateCategory
 */
@WebServlet("/UpdateCity")
public class UpdateCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	BLManager bl=new BLManager(); 
	City c=new City();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String id = request.getParameter("cityid");
		int cid=Integer.parseInt(id);
		
		c=bl.searchCid(cid);
		session.setAttribute("cate",c);
		response.sendRedirect("EditCity.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");
		HttpSession session = request.getSession();

		String flag = request.getParameter("flag");

		if (flag.equals("Add City")) {
			String city = request.getParameter("city");
			
			c.setCityname(city);

			bl.Updatecity(c);

			String m = "Update City Successfully";
			session.setAttribute("MsgFile", m);
			response.sendRedirect("addcity.jsp");

		} else if (flag.equals("View City")) 
		{
			
			response.sendRedirect("viewCity.jsp");

		}

	}

		}


