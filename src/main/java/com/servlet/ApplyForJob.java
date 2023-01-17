package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ApplyDao;
import com.db.DBconnect;
import com.entity.ApplyJob;
@WebServlet("/applyForJob")
public class ApplyForJob extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String qulification=req.getParameter("qua");
		String exp=req.getParameter("exp");
		String location=req.getParameter("location");
		String catagory=req.getParameter("catagory");
		String description=req.getParameter("desc");
		
		ApplyJob obj=new ApplyJob();
		
		obj.setName(name);
		obj.setEmail(email);
		obj.setQulification(qulification);
		obj.setExp(exp);
		obj.setLocation(location);
		obj.setCatagory(catagory);
		obj.setDescription(description);
		
		try {
			ApplyDao dao=new ApplyDao(DBconnect.getCon());
			boolean b=dao.addJobs(obj);
			HttpSession session=req.getSession();
			if(b) {
				session.setAttribute("succMsg", "Application submitted successfully.....");
				resp.sendRedirect("user_view.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something went wrong.....");
				resp.sendRedirect("apply.jsp");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
	}

	
	
}
