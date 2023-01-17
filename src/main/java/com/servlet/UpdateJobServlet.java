package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.db.DBconnect;
import com.entity.Jobs;
@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strId=req.getParameter("id");
		String title=req.getParameter("title");
		String location=req.getParameter("location");
		String category=req.getParameter("catagory");
		String status=req.getParameter("status");
		String description=req.getParameter("desc");
	
		int id=Integer.parseInt(strId);
		
		Jobs job=new Jobs();
		job.setId(id);
		job.setTitle(title);
		job.setLocation(location);
		job.setCategory(category);
		job.setStatus(status);
		job.setDescription(description);
		try {
			HttpSession session=req.getSession();
			JobDAO dao=new JobDAO(DBconnect.getCon());
			
			boolean f=dao.updateJob(job);
			if(f) {
				session.setAttribute("succMsg", "job updated successfully.....");
				resp.sendRedirect("view.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something went wrong.....");
				resp.sendRedirect("view.jsp");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	
	
}
