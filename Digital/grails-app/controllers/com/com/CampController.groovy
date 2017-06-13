package com.com

import com.digital.user.FacebookData
import com.restfb.DefaultFacebookClient
import com.restfb.FacebookClient
import com.restfb.Parameter
import com.restfb.types.User
import facebook4j.Facebook
import facebook4j.FacebookException
import facebook4j.FacebookFactory
import facebook4j.auth.AccessToken

class CampController {
    AccessToken info
    String text
    def campaign() {
        println("******************************8")
        Facebook facebook = (Facebook)session.getAttribute("facebook")
        String oauthCode = request.getParameter("code")


            facebook.getOAuthAccessToken(oauthCode)


            info = facebook.getOAuthAccessTokenInfo()

        text=info.toString();
        String[] firstSplit=text.split("token='")
        String[] secondSplit=firstSplit[1].split("'")
        def fbdata = new FacebookData()
        fbdata.accessToken=secondSplit[0]//AccessToken

        FacebookClient fbClient = new DefaultFacebookClient(fbdata.accessToken);

        User fbuser = fbClient.fetchObject("me",User.class, Parameter.with("fields", "name,id"));
        fbdata.facebookName = fbuser.getName()
        fbdata.facebookId = fbuser.getId()

        /*fbdata.save()
        if(!fbData.save()){
            println("errors"+fbData.errors)
        }*/










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
