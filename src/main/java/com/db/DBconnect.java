package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
  private static Connection con;
  
  public static Connection getCon() throws ClassNotFoundException, SQLException {
	  if(con==null) {
		  Class.forName("com.mysql.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Job_Portal","root","root");
	  }
	  
	  return con;
  }
  
  
}
