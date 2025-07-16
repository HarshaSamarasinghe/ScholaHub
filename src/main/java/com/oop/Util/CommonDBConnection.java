package com.oop.Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class CommonDBConnection {
	
	private static String url = "jdbc:mysql://localhost:3306/scholahubdb";
	private static String userName = "root";
	private static String password = "#Harsha1234";
	private static Connection con;
	
	public static Connection getConnection() {
		
    try {
    	//connect database
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
			
		}
		catch (Exception e) {
			System.out.println("Database connection is not success!!!");
		}
		return con;
	}

}
