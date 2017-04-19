package Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class EmployeeSortConnection {
	private static String url="com.mysql.jdbc.Driver";
	private static String driver="jdbc:mysql://localhost:3306/demo";
	private static String user="root";
	private static String password="root";
	private static Connection con;
	public static Connection conManage()
	{
		try {
			Class.forName(url);
			try {
				con = DriverManager.getConnection(driver,user,password);
			} catch (SQLException e) {
				System.out.println("Connection didn't establish");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Driver not found");
		}
		return con;
		
	}

}
