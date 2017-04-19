package Test;

public class TestMain {
	public static void main(String[] args) {
		
		long startTimeSimple = System.currentTimeMillis();
		ManageEmployee.simpleExecution();
		long endTimeSimple=System.currentTimeMillis();
		System.out.println("-----------------------------------------------------------------------------------------------------(PREPARED)");
		long startTimePrepared = System.currentTimeMillis();
		ManageEmployeePrepared.preparedExecution();
		long endTimePrepared = System.currentTimeMillis();
		
		long simple=endTimeSimple-startTimeSimple;
		long prepared=endTimePrepared-startTimePrepared;
		
		System.out.println("Time taken by simple statement is "+simple+" mili seconds");
		System.out.println("Time taken by prepared statement is "+prepared+" mili seconds");
		// TODO Auto-generated method stub
	}
	

}
