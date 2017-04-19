package Test;

public class Department {
 private int dept_id;
 private String dept_name;
 private String dept_description;

 public Department(){}
 public Department(int dept_id,String dept_name,String dept_description){
	 this.dept_id=dept_id;
	 this.dept_name=dept_name;
	 this.dept_description=dept_description;
 }
 
public int getDept_id() {
	return dept_id;
}
public void setDept_id(int dept_id) {
	this.dept_id = dept_id;
}
public String getDept_name() {
	return dept_name;
}
public void setDept_name(String dept_name) {
	this.dept_name = dept_name;
}
public String getDept_description() {
	return dept_description;
}
public void setDept_description(String dept_description) {
	this.dept_description = dept_description;
}

}
