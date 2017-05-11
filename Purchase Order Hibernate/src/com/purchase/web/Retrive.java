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
public class Retrive extends org.apache.struts.action.Action {

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
        Insert2DB.count++;

        Session session=getSession();
        Transaction transaction= session.beginTransaction();
        String hql = "FROM Po";
        Query query = session.createQuery(hql);
        query.setFirstResult(Insert2DB.count*max);
        query.setMaxResults(max);
        List <Po> gets = query.list();

        transaction.commit();
        session.close();

        request.setAttribute("gets", gets);
        return mapping.findForward(SUCCESS);
    }

}
