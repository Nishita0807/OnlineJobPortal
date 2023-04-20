package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnect {
	private static Connection conn;
	public static Connection getConn() {
		try {
			if(conn==null) {
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost/job_portal","root","Rekha");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	

}
