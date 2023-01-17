package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;


public class UserDao {
	private Connection con;
	   
	   public UserDao(Connection con) {
		   super();
		   this.con=con;
	   }
	
	
	public boolean register(User j) {
		boolean f=false;
		try {
			   String query="insert into user(name,email,password,qulification) values(?,?,?,?)";
			   PreparedStatement pstmt=con.prepareStatement(query);
			   pstmt.setString(1,j.getName());
			   pstmt.setString(2,j.getEmail());
			   pstmt.setString(3,j.getPassword());
			   pstmt.setString(4,j.getQualification());
			  
			   
			   int i=pstmt.executeUpdate();
			   if(i==1) {
				   f=true;
			   }
		
		   }
		   catch(Exception e) {
			   
		   }
		
		
		
		return f;
	}
	public User login(String email, String password) throws SQLException {
		
		User obj=new User();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+password+"'");
		while(rs.next()) {
			System.out.println(rs.getInt(1)+"  "+rs.getString(2));
			obj.setId(rs.getInt(1));
			obj.setName(rs.getString(2));
			obj.setEmail(rs.getString(3));
			obj.setPassword(rs.getString(4));
			
		}
		return obj;
	}
public boolean login1(String email, String password) throws SQLException {
		boolean f=false;
	
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+password+"'");
		while(rs.next()) {
			f=true;
			
		}
		return f;
	}
public List<User> getAllUsers() throws SQLException{
	
	List<User> list=new ArrayList<User>();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from user");
	while(rs.next()) {
	User u=new User();
	u.setId(rs.getInt(1));
	u.setName(rs.getString(2));
	u.setEmail(rs.getString(3));
	u.setPassword(rs.getString(4));
	u.setQualification(rs.getString(5));
	list.add(u);
		
	}
	return list;
}
}
