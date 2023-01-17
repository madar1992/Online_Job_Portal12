package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.entity.Employer;
import com.entity.User;

public class EmployerDAO {

	private Connection con;
	 
	 public EmployerDAO(Connection con) {
		   super();
		   this.con=con;
	 }
	 
	 public boolean register(Employer j) {
			boolean f=false;
			try {
				   String query="insert into employer(EmpName,ComEmail,password,ComName,role) values(?,?,?,?,?)";
				   PreparedStatement pstmt=con.prepareStatement(query);
				   pstmt.setString(1,j.getEmployeerName());
				   pstmt.setString(2,j.getCompanyEmail());
				   pstmt.setString(3,j.getPassword());
				   pstmt.setString(4,j.getCompanyName());
				   pstmt.setString(5,"employer");
				  
				   
				   int i=pstmt.executeUpdate();
				   if(i==1) {
					   f=true;
				   }
			
			   }
			   catch(Exception e) {
				   
			   }
			
			
			
			return f;
		}
	 public boolean employerLogin(String email, String password) throws SQLException {
			boolean f=false;
		
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from employer where ComEmail='"+email+"' and password='"+password+"'");
			while(rs.next()) {
				f=true;
				
			}
			return f;
		}
	 public List<Employer> getAllEmployers() throws SQLException{
			
			List<Employer> list=new ArrayList<Employer>();
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from employer");
			while(rs.next()) {
		    Employer u=new Employer();
			u.setId(rs.getInt(1));
			u.setEmployeerName(rs.getString(2));
			u.setCompanyName(rs.getString(3));
			u.setCompanyEmail(rs.getString(4));
			u.setPassword(rs.getString(5));
			list.add(u);
				
			}
			return list;
		}
}
