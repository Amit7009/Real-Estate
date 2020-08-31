package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Contactus;

@WebServlet("/DeleteConnectedPeople")
public class DeleteConnectedPeople extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   BLManager blm=new BLManager();
   Contactus id=new Contactus();
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String ccid = request.getParameter("ccid");
		int cid=Integer.parseInt(ccid);
		
		id=blm.searchcid(cid);
		
		blm.deletepeople(id);
		
		String m = "Connected People Deleted Successfully";
		session.setAttribute("MsgFile", m);
		response.sendRedirect("connectedPeople.jsp");
   	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
