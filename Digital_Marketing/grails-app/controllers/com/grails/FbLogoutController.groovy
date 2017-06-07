package com.grails

import facebook4j.Facebook
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.ServletException
@Secured('permitAll')
class FbLogoutController {

    def logout() {
        Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
        String accessToken;
        try {
            accessToken = facebook.getOAuthAccessToken().getToken();

            // Delete permissions for this Facebook App
            facebook.deleteAllPermissions();

        } catch (Exception e) {
            e.printStackTrace()
        }

        // Invalidate the Session
        request.getSession().invalidate();

        // Logout from the Facebook
        StringBuffer next = request.getRequestURL();
        int index = next.lastIndexOf("/");
        next.replace(index+1, next.length(), "");

        render view: 'successfulLogout'
        /*redirect(controller: 'sec', action: 'welcome')*/
        //response.sendRedirect("http://www.facebook.com/logout.php?next=" + next.toString() + "&access_token=" + accessToken);

    }
    def logoutPage(){
        render view: 'successfulLogout'
    }
}
