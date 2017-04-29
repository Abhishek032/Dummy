package com.abhishek.web;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Abhishek on 27-04-2017.
 */
public class loginAction extends Action {
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginForm loginForm = (LoginForm) form;
        loginForm.setUserId(request.getParameter("id"));
        loginForm.setPassword(request.getParameter("pass"));
        if (loginForm.getUserId().equals(loginForm.originalUserId) && loginForm.getPassword().equals(loginForm.originalPassword)) {
            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(FAILURE);
        }
    }
}
