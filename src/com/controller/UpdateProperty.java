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
 * Servlet implementation class UpdateProperty
 */
@WebServlet("/UpdateProperty")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 100, // 10MB
maxRequestSize = 1024 * 1024 * 500)
public class UpdateProperty extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SAV_DIR = "D://FinalPro/OnlineRealEstate/PropertyServiceProject/PropertyServiceProject/WebContent/propertyimg";
	
	BLManager bl=new BLManager();
	Property p=new Property();
	Register reg=new Register();
	Category c=new Category();
	City ci=new City();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String pid1 = request.getParameter("pid");
		int pid=Integer.parseInt(pid1);
		
		p=bl.searchpropertyid(pid);
		
		session.setAttribute("pro",p);
		
		response.sendRedirect("editproperty.jsp");
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
		String cityname=request.getParameter("cityname");
		String address = request.getParameter("address");
		String des=request.getParameter("description");
		Date d=new Date();
		
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
		p.setUdatedDate(d);
		p.getPdate();
		
		bl.updateproperty(p);
		
		String m = "Update Property Successfully";
		session.setAttribute("MsgFile", m);
		response.sendRedirect("viewproperty.jsp");
		
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


