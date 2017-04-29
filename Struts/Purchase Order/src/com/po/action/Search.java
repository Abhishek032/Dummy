package com.po.action;

import org.apache.struts.action.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Abhishek on 29-04-2017.
 */
public class Search extends org.apache.struts.action.Action {
    private static String url = "com.mysql.jdbc.Driver";
    private static String driver = "jdbc:mysql://localhost:3306/demo";
    private static String user = "root";
    private static String password = "root";
    private static Connection con;
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";
    int count=0;
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Statement st;


            System.out.println("Connected!");
            String num = request.getParameter("search");

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



            ArrayList al = null;
            ArrayList pid_list = new ArrayList();

            String que="select ponumber from demo.newpo";
            st=con.createStatement();
            ResultSet rs = st.executeQuery(que);
            while(rs.next())
            {
                if(rs.getString(1).equals(num))
                    count++;

            }
            rs.close();

            System.out.println("Count:"+count);
            if(count>0)
            {
                count=0;
                try {
                String query = "SELECT * FROM demo.newpo WHERE ponumber='"+num+"' ";


                System.out.println("query " + query);
                st = con.createStatement();
                ResultSet rs1 = st.executeQuery(query);

                while (rs1.next()) {
                    al = new ArrayList();

                    al.add(rs1.getString(1));
                    al.add(rs1.getString(6));
                    al.add(rs1.getString(5));
                    al.add(rs1.getString(2));
                    al.add(rs1.getString(3));
                    al.add(rs1.getString(11));
                    al.add(rs1.getString(7));
                    al.add(rs1.getString(8));
                    al.add(rs1.getString(10));


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
        else
            return mapping.findForward(FAILURE);

    }
}
