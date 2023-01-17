package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
import com.entity.User;

public class JobDAO {
   private Connection con;
   
   public JobDAO(Connection con) {
	   super();
	   this.con=con;
   }
   
   public boolean addJobs(Jobs j) {
	   boolean f=false;
	 
	   try {
		   String query="insert into jobs(title,description,category,status,location) values(?,?,?,?,?)";
		   PreparedStatement pstmt=con.prepareStatement(query);
		   pstmt.setString(1,j.getTitle());
		   pstmt.setString(2,j.getDescription());
		   pstmt.setString(3,j.getCategory());
		   pstmt.setString(4,j.getStatus());
		   pstmt.setString(5,j.getLocation());
		   
		   int i=pstmt.executeUpdate();
		   if(i==1) {
			   f=true;
		   }
	
	   }
	   catch(Exception e) {
		   
	   }
	return f;
	   
   }
   
   public List<Jobs> getAllJobs(){
	   
	   List<Jobs> list=new ArrayList<Jobs>();
	    
	   try {
		   Statement st=con.createStatement();
		   ResultSet rs=st.executeQuery("select * from jobs");
		   while(rs.next()) {
			   Jobs j=new Jobs();
			   j.setId(rs.getInt(1));
			   j.setTitle(rs.getString(2));
			   j.setDescription(rs.getString(3));
			   j.setCategory(rs.getString(4));
			   j.setStatus(rs.getString(5));
			   j.setLocation(rs.getString(6));
			   j.setPdate(rs.getTimestamp(7)+"");
			   
			   list.add(j);
		   }
		   
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	return list;
	   
   }
public Jobs getJobById(int id){
	   
	Jobs j=new Jobs();
	    
	   try {
		   Statement st=con.createStatement();
		   ResultSet rs=st.executeQuery("select * from jobs where id='"+id+"'");
		   while(rs.next()) {
			   
			   j.setId(rs.getInt(1));
			   j.setTitle(rs.getString(2));
			   j.setDescription(rs.getString(3));
			   j.setCategory(rs.getString(4));
			   j.setStatus(rs.getString(5));
			   j.setLocation(rs.getString(6));
			   j.setPdate(rs.getTimestamp(7)+"");
			   
			  
		   }
		   
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	return j;
	   
   }
public boolean updateJob(Jobs j) {
	boolean f=false;
	 try {
		   String query="update jobs set title=?,description=?,category=?,status=?,location=? where id=?";
		   PreparedStatement pstmt=con.prepareStatement(query);
		   pstmt.setString(1,j.getTitle());
		   pstmt.setString(2,j.getDescription());
		   pstmt.setString(3,j.getCategory());
		   pstmt.setString(4,j.getStatus());
		   pstmt.setString(5,j.getLocation());
		   pstmt.setInt(6, j.getId());
		   int i=pstmt.executeUpdate();
		  
		   if(i>=1) {
			   f=true;
		   }
		   
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	
	return f;
	
}
public boolean deleteJob(int id) {
	boolean f=false;
	
	try {
		Statement st=con.createStatement();
		int i=st.executeUpdate("delete from jobs where id='"+id+"'");
		if(i==1) {
			f=true;
		}
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
	return f;
	
}

}
