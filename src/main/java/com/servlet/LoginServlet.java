package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.dao.EmployerDAO;
import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.Admin;
import com.entity.Employer;
import com.entity.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String email=req.getParameter("em");
			String pass=req.getParameter("ps");
			User u=new User();
			HttpSession session=req.getSession();
			
			
			AdminDao dao1=new AdminDao(DBconnect.getCon());
			
			
			boolean y=false;
			boolean x=dao1.adminLogin(email, pass);
			
			if(x) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
				
			}
			else if(x==false) {
				Employer e=new Employer();
				EmployerDAO dao2=new EmployerDAO(DBconnect.getCon());
				 y=dao2.employerLogin(email, pass);
				 
				if(y) {
					session.setAttribute("userobj", e);
					e.setRole("employer");
					resp.sendRedirect("employeer.jsp");
				}
				else{
					UserDao dao=new UserDao(DBconnect.getCon());
					u=dao.login(email, pass);
					boolean b=dao.login1(email, pass);
					
					if(b) {
						u.setRole("user");
						session.setAttribute("userobj", u);
						resp.sendRedirect("user.jsp");
					}
					else{
						session.setAttribute("succMsg", "Invalid user name & password.....");
						resp.sendRedirect("login.jsp");
					}
				}
			}
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	  
	  
	}
	  
 
}
