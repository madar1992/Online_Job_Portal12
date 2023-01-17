package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.db.DBconnect;
import com.entity.Jobs;
@WebServlet("/addJobs")
public class AddPost extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title=req.getParameter("title");
		String location=req.getParameter("location");
		String category=req.getParameter("catagory");
		String status=req.getParameter("status");
		String description=req.getParameter("desc");
		
		Jobs job=new Jobs();
		
		job.setTitle(title);
		job.setLocation(location);
		job.setCategory(category);
		job.setStatus(status);
		job.setDescription(description);
		
		try {
			HttpSession session=req.getSession();
			JobDAO dao=new JobDAO(DBconnect.getCon());
			
			boolean f=dao.addJobs(job);
			if(f) {
				session.setAttribute("succMsg", "job posted successfully.....");
				resp.sendRedirect("add_job.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something went wrong.....");
				resp.sendRedirect("add_job.jsp");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
	}

}
