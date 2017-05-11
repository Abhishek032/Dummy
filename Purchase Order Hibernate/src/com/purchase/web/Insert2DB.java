package com.purchase.web;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by Abhishek on 05/05/2017.
 */
public class Insert2DB extends org.apache.struts.action.Action {
    static Integer count=-1;
    private final static String SUCCESS="success";
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

        Insert2DBForm insert =(Insert2DBForm) form;
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
        insert.setMustship(String.valueOf(Boolean.valueOf(request.getParameter("mustship"))));
        insert.setDesig(request.getParameter("designate"));
        insert.setCarrier(request.getParameter("carrier"));
        insert.setDeliveryenddate(request.getParameter("destdeliverystart"));
        insert.setDeliverystartdate(request.getParameter("destdeliveryend"));
        insert.setPickupstartdate(request.getParameter("oripickupstart"));
        insert.setPickupenddate(request.getParameter("oripickupend"));
        insert.setCity(request.getParameter("oricity"));
        insert.setCountry(request.getParameter("oricountry"));
        insert.setStreet(request.getParameter("oristreetadd"));
        insert.setState(request.getParameter("oristate"));
        insert.setName(request.getParameter("oricountrynew"));


        Session session=getSession();
        Transaction tr=session.beginTransaction();
        try{
            System.out.println("querying all the managed entities...");

            List<Origin> or=new ArrayList<>();
            Origin origin=new Origin();

            origin.setCity(insert.getCity());
            origin.setCountry(insert.getCountry());
            origin.setName(insert.getName());
            origin.setState(insert.getState());
            origin.setStreet(insert.getStreet());
            origin.setPickupenddate(insert.getPickupenddate());
            origin.setPickupstartdate(insert.getPickupstartdate());
            or.add(origin);

            List<Destination>dr=new ArrayList<>();
            Destination destination = new Destination();

            destination.setCity(insert.getCity());
            destination.setCountry(insert.getCountry());
            destination.setName(insert.getName());
            destination.setState(insert.getState());
            destination.setStreet(insert.getStreet());
            destination.setDestenddate(insert.getDeliveryenddate());
            destination.setDeststartdate(insert.getDeliverystartdate());
            dr.add(destination);

            Po entity=new Po();
            entity.setStatus(insert.getStatus());
            entity.setPriority(insert.getPriority());
            entity.setIssuedate(String.valueOf(Date.valueOf(insert.getIssuedate())));
            entity.setDuedate(String.valueOf(Date.valueOf(insert.getDuedate())));
            entity.setSeller(insert.getSeller());
            entity.setShipfrom(insert.getShipfrom());
            entity.setShipto(insert.getShipto());
            entity.setBillto(insert.getBillto());
            entity.setTransresp(insert.getTrans());
            entity.setIncoterms(insert.getIncoterms());
            entity.setMustship(Boolean.valueOf(insert.getMustship()));
            entity.setDesignatedmode(insert.getDesig());
            entity.setCarrier(insert.getCarrier());

            entity.setDestinationList(dr);
            entity.setOriginList(or);

            session.save(entity);


            tr.commit();
            session.close();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            count=-1;
            session.close();
        }
        return mapping.findForward(SUCCESS);
    }
}

