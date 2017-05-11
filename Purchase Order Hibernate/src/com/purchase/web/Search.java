package com.purchase.web;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Abhishek on 05/05/2017.
 */
public class Search extends org.apache.struts.action.Action{
    private static String url = "com.mysql.jdbc.Driver";
    private static String driver = "jdbc:mysql://localhost:3306/purchaseorder";
    private static String user = "root";
    private static String password = "root";
    private static Connection con;
    private final static String SUCCESS = "success";
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Statement st;
        try {

            System.out.println("Connected!");
            String num = request.getParameter("search");

            try {
                Class.forName(url);
                try {
                    con = DriverManager.getConnection(driver,user,password);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            }



            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query = "SELECT ponumber,carrier,duedate,status,priority,incoterms,shipfrom,shipto,transresp FROM purchaseorder.po WHERE ponumber='"+num+"'or seller='"+num+"'or status='"+num+"'or priority='"+num+"'";

            System.out.println("query " + query);
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                al = new ArrayList();
                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                al.add(rs.getString(6));
                al.add(rs.getString(7));
                al.add(rs.getString(8));
                al.add(rs.getString(9));


                System.out.println("al :: " + al);
                pid_list.add(al);
            }

            request.setAttribute("piList", pid_list);
            con.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward(SUCCESS);
    }
}