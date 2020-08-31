package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Register;
import com.pojo.Role;

/**
 * Servlet implementation class EditUserPassword
 */
@WebServlet("/EditUserPassword")
public class EditUserPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BLManager bl = new BLManager();
	Register reg = new Register();
	Role r = new Role();
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String confrmPass = request.getParameter("confrmPass");
		String Email = (String) session.getAttribute("email");
		System.out.println("oldPass=" + oldPass + "  newPass=" + newPass + "  confrmPass=" + confrmPass);

		boolean val = bl.ValidPassword(oldPass, Email);
		System.out.println("val=" + val);

		if (val == true) {
			System.out.println("valid pass");
			boolean newVal = valNewConfrm(newPass, confrmPass);

			System.out.println(newVal);
			
			
			
			if (newVal == true) {

				Register rg = bl.serachbyemail(Email);

				reg.setRegid(rg.getRegid());
				reg.setFname(rg.getFname());
				reg.setLname(rg.getLname());
				reg.setEmail(rg.getEmail());
				reg.setPassword(newPass);
				reg.setAddress(rg.getAddress());
				reg.setStatus(rg.getStatus());
				reg.setRole(rg.getRole());

				bl.updateRegistration(reg);

				out.println("<script type=\"text/javascript\">");
				out.println("alert('Password change successfully!');");
				out.println("location='index.jsp';");
				out.println("</script>");

			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Sorry!! New and Confirm Password Mismatch');");
				out.println("location='changePasswordUser.jsp';");
				out.println("</script>");

			}

		}

		else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Sorry!! old password incorrect');");
			out.println("location='changePasswordUser.jsp';");
			out.println("</script>");
		}

	}

	public boolean valNewConfrm(String n, String c) {
		if (n.equals(c)) {
			return true;
		} else {
			return false;
		}


	
	}

}
