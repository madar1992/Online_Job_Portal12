package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.ApplyJob;
import com.entity.Jobs;

public class ApplyDao {

	private Connection con;
	   
	   public ApplyDao(Connection con) {
		   super();
		   this.con=con;
	   }
	   
	   public boolean addJobs(ApplyJob j) {
		   boolean f=false;
		 
		   try {
			   String query="insert into ApplyJob(name,email,qualification,experience,location,catagory,description) values(?,?,?,?,?,?,?)";
			   PreparedStatement pstmt=con.prepareStatement(query);
			   pstmt.setString(1,j.getName());
			   pstmt.setString(2,j.getEmail());
			   pstmt.setString(3,j.getQulification());
			   pstmt.setString(4,j.getExp());
			   pstmt.setString(5,j.getLocation());
			   pstmt.setString(6,j.getCatagory());
			   pstmt.setString(7,j.getDescription());
			   
			   
			   int i=pstmt.executeUpdate();
			   if(i==1) {
				   f=true;
			   }
		
		   }
		   catch(Exception e) {
			   
		   }
		return f;
		   
	   }
}
