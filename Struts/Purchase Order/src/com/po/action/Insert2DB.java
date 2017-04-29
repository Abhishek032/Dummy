package com.po.action;

import com.po.form.Insert2DBForm;
import com.po.form.LoginForm;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Abhishek on 28-04-2017.
 */
public class Insert2DB extends org.apache.struts.action.Action{
    private final static String url="com.mysql.jdbc.Driver";
    private final static String driver="jdbc:mysql://localhost:3306/demo";
    private final static String user ="root";
    private final static String password="root";
    private final static String SUCCESS="success";
    private final static String sqlQuery = "INSERT INTO newpo(ponumber,status,priority,poissuedate,duedate,seller,shipfrom,shipto,billto,trans,incoterms,mustship,designate,carrier) VALUES (?, ?, ? ,? ,?, ?, ? ,? ,? ,? ,? ,? ,? ,?)";
    Connection con;
    PreparedStatement pstmt=null;
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Insert2DBForm insert = (Insert2DBForm) form;

        try {
            Class.forName(url);
            try {
                con = DriverManager.getConnection(driver,user,password);
            } catch (SQLException ex) {

                System.out.println("Failed to create the database connection.");
            }
        } catch (ClassNotFoundException ex) {

            System.out.println("Driver not found.");
        }
        try{
            pstmt = con.prepareStatement(sqlQuery);
        }catch(SQLException e){
            System.out.println("Failed to create Prepared statement");
        }
        insert.setPonumber(request.getParameter("ponumber"));
        insert.setStatus(request.getParameter("status"));
        insert.setPriority(request.getParameter("priority"));
        insert.setIssuedate(request.getParameter("issuedate"));
        insert.setDuedate(request.getParameter("duedate"));
        insert.setSeller(request.getParameter("seller"));
        insert.setShipfrom(request.getParameter("shipfrom"));
        insert.setShipto(request.getParameter("shipto"));
        insert.setBillto(request.getParameter("billto"));
        insert.setTrans(request.getParameter("trans"));
        insert.setIncoterms(request.getParameter("incoterms"));
        insert.setMustship(request.getParameter("mustship"));
        insert.setDesig(request.getParameter("designate"));
        insert.setCarrier(request.getParameter("carrier"));

        try {
            pstmt.setString(1, insert.getPonumber());
            pstmt.setString(2, insert.getStatus());
            pstmt.setString(3, insert.getPriority());
            pstmt.setString(4, insert.getIssuedate());
            pstmt.setString(5, insert.getDuedate());
            pstmt.setString(6, insert.getSeller());
            pstmt.setString(7, insert.getShipfrom());
            pstmt.setString(8, insert.getShipto());
            pstmt.setString(9, insert.getBillto());
            pstmt.setString(10, insert.getTrans());
            pstmt.setString(11, insert.getIncoterms());
            Boolean bool = "true".equals(insert.getMustship());
            pstmt.setBoolean(12, bool);
            pstmt.setString(13, insert.getDesig());
            pstmt.setString(14, insert.getCarrier());
        } catch (SQLException e) {
            System.out.println("Exception in setString");
        }

        try {
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("exception in executeupdate");
        }
            return mapping.findForward(SUCCESS);
    }
}


