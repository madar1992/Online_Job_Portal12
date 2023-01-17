package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AdminDao {
 private Connection con;
 
 public AdminDao(Connection con) {
	   super();
	   this.con=con;
 }
 
	public boolean adminLogin(String email, String password) throws SQLException {
		boolean f=false;
	
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from admin where email='"+email+"' and password='"+password+"'");
		while(rs.next()) {
			f=true;
			
		}
		return f;
	}
}
