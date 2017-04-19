package Test;
import java.util.*;

import java.util.ArrayList;
import java.util.Iterator;

public class EmployeeSortMain {

	public static void main(String[] args) {
		ArrayList<Employee> employeeList=EmployeeSort.sortEmp();
		Collections.sort(employeeList);
		Iterator<Employee> iter=employeeList.iterator();
		while(iter.hasNext())
		{
			Employee emp=iter.next();
			System.out.println("ID :"+emp.getId());
			System.out.println("Name :"+emp.getName());
			System.out.println("Address :"+emp.getAddress());
			System.out.println("Salary: "+emp.getSalary());
			System.out.println("DOB :"+emp.getDob());
			System.out.println();
		}
		// TODO Auto-generated method stub

	}

}
