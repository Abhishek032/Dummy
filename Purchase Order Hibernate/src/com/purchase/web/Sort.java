package com.purchase.web;

import com.purchase.web.Po;
import javafx.print.Collation;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by Abhishek on 05/05/2017.
 */
public class Sort extends org.apache.struts.action.Action {
    private static final Integer max=5;
    private static final String SUCCESS="success";
    private static final SessionFactory ourSessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure();

            ourSessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Session session=getSession();

        Transaction transaction= session.beginTransaction();
        String hql = "FROM Po";
        Query query = session.createQuery(hql);
        query.setFirstResult(Insert2DB.count*max);
        query.setMaxResults(max);
        List <Po> gets = query.list();
        if(request.getParameter("act").equalsIgnoreCase("P.O. Number"))
            Collections.sort(gets,new NumberComparator());
        if(request.getParameter("act").equalsIgnoreCase("Supplier"))
            Collections.sort(gets,new SupplierComparator());
        if(request.getParameter("act").equalsIgnoreCase("Due Date"))
            Collections.sort(gets,new DueDateComparator());
        if(request.getParameter("act").equalsIgnoreCase("P.O. Status"))
            Collections.sort(gets,new StatusComparator());
        if(request.getParameter("act").equalsIgnoreCase("Priority"))
            Collections.sort(gets,new PriorityComparator());
        if(request.getParameter("act").equalsIgnoreCase("Item(s)"))
            Collections.sort(gets,new ItemComparator());
        if(request.getParameter("act").equalsIgnoreCase("Ship From"))
            Collections.sort(gets,new ShipFromComparator());
        if(request.getParameter("act").equalsIgnoreCase("Ship To"))
            Collections.sort(gets,new ShipToComparator());
        if(request.getParameter("act").equalsIgnoreCase("Trans. Resp."))
            Collections.sort(gets,new TransComparator());




        /*String sql = "FROM Purchaseorder ";
        org.hibernate.query.Query query = session.createQuery(sql);
        query.setFirstResult(Insert2DB.count * 3);
        Insert2DB.count++;
        System.out.println("*&*&*&*&*&*&*&*&*&");
        query.setMaxResults(3);
        List<Purchaseorder> gets = query.list();
        List<Purchaseorder>po=new ArrayList<>();
        for(int i=0;i<gets.size();i++){
            System.out.println("qwertyuiopasdfghjkl:"+i);
            Purchaseorder por=(Purchaseorder)gets.get(i);
            po.add(por);
        }
        Collections.sort(po);*/


        //Pagination



        transaction.commit();
        session.close();

        request.setAttribute("gets", gets);
        return mapping.findForward(SUCCESS);
    }

}
