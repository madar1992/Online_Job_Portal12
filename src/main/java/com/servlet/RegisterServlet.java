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
import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("em");
		String password=req.getParameter("ps");
		String qulification=req.getParameter("qua");
		
		
		try {
			HttpSession session=req.getSession();
			UserDao dao=new UserDao(DBconnect.getCon());
			User u=new User();
		    u.setName(name);
		    u.setEmail(email);
		    u.setPassword(password);
		    u.setQualification(qulification);
		    boolean b=dao.register(u);
		    if(b) {
				session.setAttribute("succMsg", "Registration successfully.....");
				resp.sendRedirect("sign_up.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something went wrong.....");
				resp.sendRedirect("sign_up.jsp");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		
		
	}

}
