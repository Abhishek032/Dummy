package com.grails

import facebook4j.Facebook
import facebook4j.FacebookException
import facebook4j.FacebookFactory
import facebook4j.auth.AccessToken
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.ServletException

@Secured('permitAll')
class CampController {
    /*AccessToken info
    String text
    String accessToken*/
    def campaign() {
        Facebook facebook = (Facebook)session.getAttribute("facebook")

        String oauthCode = request.getParameter("code")

        try {
            facebook.getOAuthAccessToken(oauthCode)
        } catch (FacebookException e) {
            redirect(controller: 'fbLogout', action: 'logoutPage')
            /*throw new ServletException(e)*/
        }


        /*try {
            info = facebook.getOAuthAccessTokenInfo()
            println "OAuthAccessToken : "+info
        } catch (FacebookException e) {
            e.printStackTrace()
        }
        text=info.toString();
        println "OAUTH ACCESSTOKEN : "+text
        String[] firstSplit=text.split("token='")
        String[] secondSplit=firstSplit[1].split("'")
        accessToken=secondSplit[0]
        //Access Token is secondSplit[0]
        println "AccessToken : "+accessToken*/








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

    def campaignPage(){
        render view: 'campaign'
    }
}
