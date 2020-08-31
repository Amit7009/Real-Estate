package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.model.BLManager;
import com.pojo.Register;

/**
 * Servlet implementation class UserPro
 */
@WebServlet("/UserPro")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 100, // 10MB
maxRequestSize = 1024 * 1024 * 500)
public class UserPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAV_DIR = "C://Users/Akash Pawar/Downloads/PropertyServiceProject/PropertyServiceProject/WebContent/userdash/images";
	
	BLManager bl=new BLManager();
	Register reg=new Register();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		reg=bl.serachbyemail1(email);
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email1 = request.getParameter("email");
		String add=request.getParameter("address");
		String contact=request.getParameter("contact");
		String des=request.getParameter("description");
		
		Part img = request.getPart("rimage");
		
		try 
		{
			String Image1 = extractFileName1(img);
			reg.setRimage(Image1);
			img.write(SAV_DIR + File.separator + Image1);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		

		
		System.out.println(fname+"   "+lname);
		reg.setFname(fname);
		reg.setLname(lname);
		reg.setAddress(add);
		reg.setEmail(email1);
		reg.setContact(contact);
		reg.setDescription(des);
		reg.getDate();
		bl.SellerProfileUpdate(reg);
		

    out.println("<script type=\"text/javascript\">");
	out.println("alert('Profile update successfully...');");
	out.println("location='UserPro.jsp';");
	out.println("</script>");




		}
private String extractFileName1(Part img) {
	String contentDisp = img.getHeader("content-disposition");
	String[] items = contentDisp.split(";");
	for (String s : items) {
		if (s.trim().startsWith("filename")) {
			return s.substring(s.indexOf("=") + 2, s.length() - 1);
		}
	}
	return "";

}
}
