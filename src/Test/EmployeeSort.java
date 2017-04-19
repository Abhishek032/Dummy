package Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class EmployeeSort {
	private static Connection con;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	private static String sqlQuery="select * from Employee";
	private static ArrayList<Employee> empList=new ArrayList<>();
	public static ArrayList<Employee> sortEmp(){
		con=EmployeeSortConnection.conManage();
		try {
			pstmt=con.prepareStatement(sqlQuery);
		} catch (SQLException e) {
			System.out.println("Failed to create statement");
		}
		try {
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("failed to create Resultset");
		}
		
		try {
			while(rs.next())
			{
				Employee emp=new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setAddress(rs.getString("address"));
				emp.setSalary(rs.getInt("salary"));
				emp.setDob(rs.getDate("dob"));
				empList.add(emp);
			}
		} catch (SQLException e) {
			return empList;
		}
		return empList;
		
	}
	
		
}
	
