package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Register;

/**
 * Servlet implementation class sellerDeleteServ
 */
@WebServlet("/sellerDeleteServ")
public class sellerDeleteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	BLManager bl=new BLManager(); 
	Register reg=new Register();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String rid = request.getParameter("regidd");
		int regid=Integer.parseInt(rid);
		
		reg=bl.searchid(regid);
		
		bl.deleteproperty(reg);
		
		String m = "Seller Deleted Successfully";
		session.setAttribute("MsgFile", m);
		response.sendRedirect("viewSeller.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
