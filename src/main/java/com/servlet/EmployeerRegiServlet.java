package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.EmployerDAO;
import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.Employer;
import com.entity.User;
@WebServlet("/EmployeerRegister")
public class EmployeerRegiServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("cemail");
		String password=req.getParameter("ps");
		String cname=req.getParameter("cname");
		
		
		try {
			HttpSession session=req.getSession();
			EmployerDAO dao=new EmployerDAO(DBconnect.getCon());
			Employer e=new Employer();
		    e.setEmployeerName(name);
		    e.setCompanyEmail(email);
		    e.setPassword(password);
		    e.setCompanyName(cname);
		    
		    boolean b=dao.register(e);
		    if(b) {
				session.setAttribute("succMsg", "Registration successfully and Loin to continue");
				resp.sendRedirect("EmployeeRegi.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something went wrong.....");
				resp.sendRedirect("EmployeeRegi.jsp");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
	}

	
}
