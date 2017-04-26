package DemoServs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetTableData {
	ArrayList<TableData> tabledatlist=new ArrayList<>();

	public ArrayList<TableData> getTabData(){
		Connection con=ManageConnectionPo.getConnection();
		PreparedStatement pstmt=null;
		String sqlQuery = "select ponumber,seller,duedate,status,priority,incoterms,shipfrom,shipto,trans from newpo";	
		
		try{
			pstmt = con.prepareStatement(sqlQuery);
		}catch(SQLException e){
			System.out.println("Failed to create Prepared statement");
		}

		try {
			ResultSet rs = pstmt.executeQuery();
		
			while(rs.next())
			{
				TableData td=new TableData();
				td.setPonumber(rs.getString("ponumber"));
				td.setSupplier(rs.getString("seller"));
				td.setDuedate(rs.getDate("duedate"));
				td.setPostatus(rs.getString("status"));
				td.setPriority(rs.getString("priority"));
				td.setItems(rs.getString("incoterms"));
				td.setShipfrom(rs.getString("shipfrom"));
				td.setShipto(rs.getString("shipto"));
				td.setTrans(rs.getString("trans"));
				tabledatlist.add(td);
			}
		} catch (SQLException e) {}
		return tabledatlist;
		
	}
	

}
