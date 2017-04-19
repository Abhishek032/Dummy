package Test;

import java.util.Date;
public class Employee implements Comparable<Employee> {
	
	private int id;
	private int salary;
	private String name;
	private String address;
	private Date dob;
	private Department dep;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Department getDep() {
		return dep;
	}
	public void setDep(Department dep) {
		this.dep = dep;
	}
	public int compareTo(Employee emp) {
		int result=getName().compareToIgnoreCase(emp.getName());
		if(result==0)
		{
			return Integer.valueOf(getId()).compareTo(emp.getId());
		}
		else
		{
			return result;
		}
		
		//return this.getName().compareTo(emp.getName());
	}
	
}
