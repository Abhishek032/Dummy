package com.grails

import facebook4j.Facebook
import facebook4j.FacebookException
import facebook4j.FacebookFactory
import facebook4j.auth.AccessToken
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.ServletException

@Secured('permitAll')
class CampController {
    AccessToken info
    String text
    def campaign() {
        println("*********************************************")
        Facebook facebook = (Facebook)session.getAttribute("facebook")


        String oauthCode = request.getParameter("code");
        try {
            facebook.getOAuthAccessToken(oauthCode);
        } catch (FacebookException e) {
            throw new ServletException(e);
        }


        try {
            info = facebook.getOAuthAccessTokenInfo();
            System.out.println("OAuthAccessToken : "+info);
        } catch (FacebookException e) {
            e.printStackTrace();
        }
        text=info.toString();
        System.out.println("OAUTH ACCESSTOKEN : "+text);
        String[] firstSplit=text.split("token='");
        String[] secondSplit=firstSplit[1].split("'");
        //Access Token is secondSplit[0]
        System.out.println("AccessToken : "+secondSplit[0]);








        /*AccessToken info
        println("******"+facebook)
        try {
            String oauthCode = params.get("code")
            try {
                info = facebook.getOAuthAccessToken(oauthCode);
            } catch (FacebookException e) {
                throw new ServletException(e);
            }

            println("OAuthAccessToken : "+info);
        } catch (FacebookException e) {
            e.printStackTrace();
        }
        text=info.toString();
        println("OAUTH ACCESSTOKEN : "+text);
        String[] firstSplit=text.split("token='");
        String[] secondSplit=firstSplit[1].split("'");
        //Access Token is secondSplit[0]
        println("AccessToken : "+secondSplit[0]);*/
        render view: 'campaign'
    }
}
