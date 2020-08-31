package com.model;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.controller.session;
import com.pojo.Category;
import com.pojo.City;
import com.pojo.Contactus;
import com.pojo.Enquiry;
import com.pojo.Postfeedback;
import com.pojo.Property;
import com.pojo.Register;
import com.pojo.Role;

public class BLManager 
{
	SessionFactory con = new Configuration().configure().buildSessionFactory();
	
	
	public Role serachchbyroll(String rollname) 
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Role.class);
		cr.add(Restrictions.eq("rolename", rollname));
		Role r = (Role) cr.uniqueResult();
		return r;
	}

	public void savereg(Register reg) 
	{
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.save(reg);
		t1.commit();
		s1.close();
	}

	public boolean serachbyep(String email, String pass)
	{
		Register reg = serachbyemailpass(email, pass);

		if (reg != null && reg.getEmail().equals(email) && reg.getPassword().equals(pass)) {
			return true;
		} else {
			return false;
		}
	}

	private Register serachbyemailpass(String email, String pass) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class);
		cr.add(Restrictions.eq("email", email));
		cr.add(Restrictions.eq("password", pass));
		Register r = (Register) cr.uniqueResult();
		return r;
	}

	public Register serachbyemail1(String email) {
		Session ss = con.openSession();
		Criteria cr = ss.createCriteria(Register.class);
		cr.add(Restrictions.eq("email", email));
		Register r = (Register) cr.uniqueResult();
		ss.close();
		return r;
	}

	
	public Register serachbyemail(String email) {
		Session ss = con.openSession();
		Criteria cr = ss.createCriteria(Register.class);
		cr.add(Restrictions.eq("email", email));
		Register r = (Register) cr.uniqueResult();
		return r;
	}
	
	
	

	public boolean ValidPassword(String oldPass, String email) 
	{
		Session ss=con.openSession();
	
		String hql="From Register r Where r.password=? and r.email=?";
		Query q=ss.createQuery(hql);
		q.setString(0, oldPass);
		q.setString(1, email);
		Register r=(Register) q.uniqueResult();
	
		if(r!=null)
		{
			return true;
		}else
		{
			return false;
		}
	}

	public void updateRegistration(Register reg) {
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.update(reg);
		t1.commit();
		s1.close();
	}
	
	public List<Register> searchDeactivesellerList(String sts)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class);
		cr.add(Restrictions.eq("status", sts));
		List<Register> l=cr.list();
		return l;
	}
	
	public List<Property> searchpropertyList(String email)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class,"reg");
		cr.createAlias("reg.register","ro");
		cr.add(Restrictions.eq("ro.email", email));
		List<Property> l=cr.list();
		return l;
	}
	
	public List<Enquiry> searchenquiryList(int regid )
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Enquiry.class,"ro");
		cr.createAlias("ro.registerByRid","r");
		cr.add(Restrictions.eq("r.regid", regid));
		List<Enquiry> l=cr.list();
		return l;
	}
	public List<Enquiry> searchenquiryList1(int regid )
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Enquiry.class,"ro");
		cr.createAlias("ro.registerByRegid","r");
		cr.add(Restrictions.eq("r.regid", regid));
		List<Enquiry> l=cr.list();
		return l;
	}



	public Register serachbyregid(int regid) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class);
		cr.add(Restrictions.eq("regid", regid));
		Register r = (Register) cr.uniqueResult();
		return r;
	}

	public void updatesellerdata(Register reg) 
	{
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.update(reg);
		t1.commit();
		s1.close();
	}
	
	public List<Register> searchsellerList(String sel,String act)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class,"reg");
		cr.createAlias("reg.role","ro");
		cr.add(Restrictions.eq("ro.rolename", sel));
		cr.add(Restrictions.eq("status",act));
		List<Register> l=cr.list();
		return l;
	}
	
	public List<Register> searchuserList(String sel)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class,"reg");
		cr.createAlias("reg.role","ro");
		cr.add(Restrictions.eq("ro.rolename", sel));
		List<Register> l=cr.list();
		return l;
	}

	public void savecity(City c) {
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.save(c);
		t1.commit();
		s1.close();
	}
	
	public List<City> searchcity()
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(City.class);
		List<City> l=cr.list();
		return l;
	}
	public List<Category> searchcategory1()
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Category.class);
		List<Category> l=cr.list();
		return l;
	}

	public Category searchcategory(String cname) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Category.class);
		cr.add(Restrictions.eq("cname", cname));
		Category r = (Category) cr.uniqueResult();
		return r;
	}
	
	public City searchcity(String cityname) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(City.class);
		cr.add(Restrictions.eq("cityname", cityname));
		City r = (City) cr.uniqueResult();
		return r;
	}
	
	public List<Property> searchcity1(String city) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class,"pro");
		cr.createAlias("pro.city", "c");
		cr.add(Restrictions.eq("c.cityname", city));
		List<Property> p=cr.list();
		return p;
	}
	public List<City> searchbycity() {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(City.class);
		List<City> p=cr.list();
		return p;
	}
	
	
	public void saveproperty(Property p) {
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.save(p);
		t1.commit();
		s1.close();
	}

	public Property searchpropertyid(int pid) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class);
		cr.add(Restrictions.eq("pid", pid));
		Property r = (Property) cr.uniqueResult();
		s1.close();
		return r;
	}

	public void deleteproperty(Property p) {
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.delete(p);
		t1.commit();
		s1.close();
	}

	public void updateproperty(Property p) {
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.update(p);
		t1.commit();
		s1.close();
	}
	
	public List<Category> seearchcategory()
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Category.class);
		List<Category> l=cr.list();
		return l;
	}
	
	public Property searchcategory1(int cid) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class);
		cr.add(Restrictions.eq("cid", cid));
		Property r = (Property) cr.uniqueResult();
		s1.close();
		return r;
	}
	
	public Register searchid(int regid) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class);
		cr.add(Restrictions.eq("regid", regid));
		Register r = (Register) cr.uniqueResult();
		s1.close();
		return r;
	}
	
	public void deleteproperty(Register reg) {
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.delete(reg);
		t1.commit();
		s1.close();
	}

	public City searchCid(int cid) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(City.class);
		cr.add(Restrictions.eq("cityid", cid));
		City r = (City) cr.uniqueResult();
		s1.close();
		return r;
	}

	public void deletecity(City c) {
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.delete(c);
		t1.commit();
		s1.close();
	}

	public List<Property> searchCat(String c)
	{
		Session ss = con.openSession();
		Criteria cr = ss.createCriteria(Property.class, "pro");
		cr.createAlias("pro.category", "cat");
		cr.add(Restrictions.eq("cat.cname", c));
		List<Property> ap = cr.list();
		return ap;
	}

	public void Updatecity(City c) {
		Session s1 = con.openSession();
		Transaction t1 = s1.beginTransaction();
		s1.update(c);
		t1.commit();
		s1.close();
	}
	public List<Property> searchallPropertylist() {
		Session ss = con.openSession();
		Criteria cr = ss.createCriteria(Property.class);
		List<Property> ap = cr.list();
		
		return ap;
	}
	
	public List<Register> CountsellerList(String act,String sel)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class,"reg");
		cr.createAlias("reg.role", "ro");
		cr.add(Restrictions.eq("ro.rolename",sel));
		cr.add(Restrictions.eq("status",act));
		cr.setProjection(Projections.rowCount());
		List<Register> l=cr.list();
		return l;
	}
	
	public  List<Property> countsellerproperty( String em)
	{
		Session s1=con.openSession();
		Criteria cr=s1.createCriteria(Property.class,"p");
		cr.createAlias("p.register","pro");
		cr.add(Restrictions.eq("pro.email", em));
		cr.setProjection(Projections.rowCount());
		List<Property> p=cr.list();
		return p;
	}
	
	public  List<Enquiry> countEnquiryproperty( int regid)
	{
		Session s1=con.openSession();
		Criteria cr=s1.createCriteria(Enquiry.class,"p");
		cr.createAlias("p.registerByRid","pro");
		cr.add(Restrictions.eq("pro.regid", regid));
		cr.setProjection(Projections.rowCount());
		List<Enquiry> p=cr.list();
		return p;
	}
	
	public List<Register> Countsellerreq(String dea,String sel)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class,"reg");
		cr.createAlias("reg.role", "ro");
		cr.add(Restrictions.eq("ro.rolename",sel));
		cr.add(Restrictions.eq("status",dea));
		cr.setProjection(Projections.rowCount());
		List<Register> l=cr.list();
		return l;
	}
	public List<Property> searchbyhome(String h)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class,"reg");
		cr.createAlias("reg.category", "ro");
		cr.add(Restrictions.eq("ro.cname",h));
		cr.setProjection(Projections.rowCount());
		List<Property> l=cr.list();
		return l;
	}
	
	public List<Property> searchbyapp(String a)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class,"reg");
		cr.createAlias("reg.category", "ro");
		cr.add(Restrictions.eq("ro.cname",a));
		cr.setProjection(Projections.rowCount());
		List<Property> l=cr.list();
		return l;
	}
	
	public List<Property> searchbyvilla(String v)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class,"reg");
		cr.createAlias("reg.category", "ro");
		cr.add(Restrictions.eq("ro.cname",v));
		cr.setProjection(Projections.rowCount());
		List<Property> l=cr.list();
		return l;
	}
	
	
	public List<Property> searchbyoffice(String o)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class,"reg");
		cr.createAlias("reg.category", "ro");
		cr.add(Restrictions.eq("ro.cname",o));
		cr.setProjection(Projections.rowCount());
		List<Property> l=cr.list();
		return l;
	}
	
	public List<Property> searchbypro()
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Property.class);
		cr.setProjection(Projections.rowCount());
		List<Property> l=cr.list();
		return l;
	}
	
	public List<Register> CountUser(String us)
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Register.class,"reg");
		cr.createAlias("reg.role", "ro");
		cr.add(Restrictions.eq("ro.rolename",us));
		cr.setProjection(Projections.rowCount());
		List<Register> l=cr.list();
		return l;
	}
	
	public void AdminProfileUpdate(Register reg) {

			Session s = con.openSession();
			Transaction t = s.beginTransaction();
			s.update(reg);
			t.commit();
			s.close();

	}

	public void SellerProfileUpdate(Register reg) {
		Session s = con.openSession();
		Transaction t = s.beginTransaction();
		s.update(reg);
		t.commit();
		s.close();
	}

	public void saveEnq(Enquiry e) {
		Session s = con.openSession();
		Transaction t = s.beginTransaction();
		s.save(e);
		t.commit();
		s.close();
	}

	public List<Register> searchbyreg(String email) {
		int i=0;
		Session s=con.openSession();
		String hql="From Register r where r.email=?";
		Query q=s.createQuery(hql);
		q.setString(0, email);
		List<Register> l=q.list();
		return l;
	}

	public void savecontact(Contactus conn) {
		Session s = con.openSession();
		Transaction t = s.beginTransaction();
		s.save(conn);
		t.commit();
		s.close();
	}
	
	public List<Contactus> searchConnectedPeople()
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Contactus.class);
		List<Contactus> l=cr.list();
		return l;
	}

	public Contactus searchcid(int cid) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Contactus.class);
		cr.add(Restrictions.eq("cid", cid));
		Contactus r = (Contactus) cr.uniqueResult();
		s1.close();
		return r;
	}

	public void deletepeople(Contactus id) {
		Session s = con.openSession();
		Transaction t = s.beginTransaction();
		s.delete(id);
		t.commit();
		s.close();
	}
	public List<Postfeedback> searchFeedback()
	{
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Postfeedback.class);
		List<Postfeedback> feedbacklist=cr.list();
		return feedbacklist;
	}

	public void savefeedback(Postfeedback feed) {
		Session s = con.openSession();
		Transaction t = s.beginTransaction();
		s.save(feed);
		t.commit();
		s.close();
		
	}

	public Postfeedback searchfid(int fid) {
		Session s1 = con.openSession();
		Criteria cr = s1.createCriteria(Postfeedback.class);
		cr.add(Restrictions.eq("feedid", fid));
		Postfeedback r = (Postfeedback) cr.uniqueResult();
		s1.close();
		return r;
	}

	public void deleteFeedbackFromTable(Postfeedback fb) {
		Session s = con.openSession();
		Transaction t = s.beginTransaction();
		s.delete(fb);
		t.commit();
		s.close();
		
	}

}
