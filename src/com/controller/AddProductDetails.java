package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.model.BLManager;
import com.pojo.Category;
import com.pojo.City;
import com.pojo.Property;
import com.pojo.Register;

/**
 * Servlet implementation class AddProductDetails
 */
@WebServlet("/AddProductDetails")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 100, // 10MB
maxRequestSize = 1024 * 1024 * 500)
public class AddProductDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SAV_DIR = "D://FinalPro/OnlineRealEstate/PropertyServiceProject/PropertyServiceProject/WebContent/propertyimg";
   
	BLManager bl=new BLManager();
	Property p=new Property();
	Register reg=new Register();
	Category c=new Category();
	City ci=new City();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.setContentType("text/html");
		
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		reg=bl.serachbyemail(email);

		String cname = request.getParameter("cname");
		String pname = request.getParameter("pname");
		String psize = request.getParameter("psize");
		String bedroom=request.getParameter("bedroom");
		String bathroom=request.getParameter("bathroom");
		String pvalue = request.getParameter("pvalue");
		double price=Double.parseDouble(pvalue);
		String address = request.getParameter("address");
		String cityname=request.getParameter("cityname");
		String des=request.getParameter("description");
		Date date=new Date();
		
		Part img = request.getPart("pimage");
		
		try 
		{
			String Image1 = extractFileName(img);
			p.setPimage(Image1);
			img.write(SAV_DIR + File.separator + Image1);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
		c=bl.searchcategory(cname);
		ci=bl.searchcity(cityname);
		p.setRegister(reg);
		p.setCategory(c);
		p.setPropertyname(pname);
		p.setSize(psize);
		p.setBathroom(bathroom);
		p.setBedroom(bedroom);
		p.setPrice(price);
		p.setAddress(address);
		p.setCity(ci);
		p.setDescription(des);
		p.setPdate(date);
		
		bl.saveproperty(p);
		
		String m = "Add Property Successfully";
		session.setAttribute("MsgFile", m);
		response.sendRedirect("addproperty.jsp");
		
	}
	private String extractFileName(Part img)
	{
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
