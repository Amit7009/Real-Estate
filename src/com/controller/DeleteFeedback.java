package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Postfeedback;

@WebServlet("/DeleteFeedback")
public class DeleteFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   BLManager blm=new BLManager();
   Postfeedback fb=new Postfeedback();
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String id = request.getParameter("ffid");
		int fid=Integer.parseInt(id);
		
		fb=blm.searchfid(fid);
		
		blm.deleteFeedbackFromTable(fb);
		
		String m = "Feedback Deleted Successfully";
		session.setAttribute("MsgFile", m);
		response.sendRedirect("viewFeedback.jsp");
   	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}