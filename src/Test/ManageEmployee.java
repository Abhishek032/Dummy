package Test;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
public class ManageEmployee {
	Connection con=ManageConnection.getConnection();
	Statement stmt;
	ResultSet rs;
	public ArrayList<Employee> viewEmployee(){
		try{
			stmt=con.createStatement();
		}catch(SQLException e){
			System.out.println("Failed to create Statement");
		}
		ArrayList<Employee> emplist=new ArrayList<>();
		try {
			rs=stmt.executeQuery("select employee.id,employee.name,employee.address,employee.salary,employee.dob,department.dept_id,department.dept_name,department.dept_description,emp_dept.emp_id,emp_dept.dept_id from employee, department, emp_dept  where department.dept_id=emp_dept.dept_id and employee.id=emp_dept.emp_id");
		} catch (SQLException e) {
			System.out.println("Failed to create resultset");
		}
		try {
			while(rs.next())
			{
				Employee empl=new Employee();
				empl.setId(rs.getInt("id"));
				empl.setName(rs.getString("name"));
				empl.setAddress(rs.getString("address"));
				empl.setSalary(rs.getInt("salary"));
				empl.setDob(rs.getDate("dob"));
				Department dept=new Department();
				dept.setDept_id(rs.getInt("dept_id"));
				dept.setDept_name(rs.getString("dept_name"));
				dept.setDept_description(rs.getString("dept_description"));
				empl.setDep(dept);
				emplist.add(empl);
			}
		} catch (SQLException e) {}
		return emplist;
	}
	public static void simpleExecution()
	{
		ManageEmployee mngemp=new ManageEmployee();
		
		ArrayList<Employee> emplist=new ArrayList<Employee>();
		emplist=mngemp.viewEmployee();
		Iterator<Employee> it=emplist.iterator();
		while(it.hasNext())
		{
			Employee em=new Employee();
			em=it.next();
			
				System.out.println("ID :"+em.getId());
				System.out.println("Name :"+em.getName());
				System.out.println("Address :"+em.getAddress());
				System.out.println("Salary: "+em.getSalary());
				System.out.println("DOB :"+em.getDob());
				System.out.println("Department ID :"+em.getDep().getDept_id());
				System.out.println("Department Name :"+em.getDep().getDept_name());
				System.out.println("Department Description :"+em.getDep().getDept_description());
				System.out.println("==========================================================");
			
		}
	}

}

