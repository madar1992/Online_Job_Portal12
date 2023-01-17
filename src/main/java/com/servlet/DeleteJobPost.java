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
@WebServlet("/delete")
public class DeleteJobPost extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			HttpSession session=req.getSession();
			JobDAO j=new JobDAO(DBconnect.getCon());
			boolean b=j.deleteJob(id);
			
			if(b) {
				
				session.setAttribute("succMsg", "job deleted successfully.....");
				resp.sendRedirect("view.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something went wrong.....");
				resp.sendRedirect("view.jsp");
			}
			
		}
		catch(Exception e) {
			
		}
	}

	
	
}
