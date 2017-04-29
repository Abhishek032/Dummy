package com.po.action;

import com.po.form.Insert2DBForm;
import org.apache.struts.action.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Abhishek on 29-04-2017.
 */
public class Retrive extends org.apache.struts.action.Action {
    private static String url = "com.mysql.jdbc.Driver";
    private static String driver = "jdbc:mysql://localhost:3306/demo";
    private static String user = "root";
    private static String password = "root";
    private static Connection con;
    private final static String SUCCESS = "failure";
    private final static String sqlQuery = "SELECT ponumber,seller,duedate,status,priority,incoterms,shipfrom,shipto,trans FROM demo.newpo";




    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ArrayList<Insert2DBForm> gets = new ArrayList<Insert2DBForm>();
        PreparedStatement pst = null;
        //Statement stmt = null;
        ResultSet rs = null;
        try {
            try {
                Class.forName(url);
                try {
                    con = DriverManager.getConnection(driver,user,password);
                } catch (SQLException ex) {

                    System.out.println("Failed to create the database connection.");
                }
            } catch (ClassNotFoundException ex) {

                System.out.println("Driver not found");
            }
            pst = con.prepareStatement(sqlQuery);
            rs = pst.executeQuery(sqlQuery);
        } catch (SQLException e) {
            System.out.println("Failed to create Prepared statement");
        }
        try {
            while (rs.next()) {

                Insert2DBForm get = new Insert2DBForm();
                get.setPonumber(rs.getString("ponumber"));
                get.setSeller(rs.getString("seller"));
                get.setDuedate(rs.getString("duedate"));
                get.setStatus(rs.getString("status"));
                get.setPriority(rs.getString("priority"));
                get.setIncoterms(rs.getString("incoterms"));
                get.setShipfrom(rs.getString("shipfrom"));
                get.setShipto(rs.getString("shipto"));
                get.setTrans(rs.getString("trans"));
                System.out.println("***************" + get.toString());
                gets.add(get);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("gets", gets);
        return mapping.findForward(SUCCESS);
    }

}
