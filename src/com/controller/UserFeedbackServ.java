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
import com.pojo.Postfeedback;

/**
 * Servlet implementation class UserFeedbackServ
 */
@WebServlet("/UserFeedbackServ")
public class UserFeedbackServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    BLManager bl=new BLManager();
    Postfeedback feed=new Postfeedback();
    public UserFeedbackServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String feedname = request.getParameter("name");
		String feedemail = request.getParameter("email");
		String feedmsg = request.getParameter("msg");
		Date feeddate = new Date();

		feed.setFeedname(feedname);
		feed.setFeedemail(feedemail);
		feed.setFeedmsg(feedmsg);
		feed.setFeeddate(feeddate);
		
		bl.savefeedback(feed);
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Thank you for your Feedback!!!');");
		out.println("location='index.jsp';");
		out.println("</script>");
	}

}
