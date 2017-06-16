package com.com

import com.digital.user.FacebookData
import com.restfb.DefaultFacebookClient
import com.restfb.FacebookClient
import com.restfb.Parameter
import facebook4j.Facebook
import facebook4j.auth.AccessToken

class CampController {
    def springSecurityService
    AccessToken info
    String text
    def campaign() {

        Facebook facebook = (Facebook)session.getAttribute("facebook")
        String oauthCode = request.getParameter("code")


            facebook.getOAuthAccessToken(oauthCode)


            info = facebook.getOAuthAccessTokenInfo()

        text=info.toString();
        String[] firstSplit=text.split("token='")
        String[] secondSplit=firstSplit[1].split("'")

        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()

        def fbdata = new FacebookData(name: "FacebookData")


        def accessToken=secondSplit[0]//AccessToken
        fbdata.setAccessToken(accessToken)
        FacebookClient fbClient = new DefaultFacebookClient(accessToken);

        com.restfb.types.User fbuser = fbClient.fetchObject("me",com.restfb.types.User.class, Parameter.with("fields", "name,id"));

        def fb=FacebookData.list()
        int count=0;
        for(FacebookData fdata:fb){
            if(fdata.getFacebookId().equals(fbuser.getId()))
            {
                if(fdata.userId==id)
                    count++
            }
        }
        if(count==0){
            fbdata.setFacebookName(fbuser.getName())
            fbdata.setFacebookId(fbuser.getId())
            currentUser.addToFacebookData(fbdata)
            fbdata.save(flush: true)
        }
        //render (view: 'campaign', model:[username:name ])
        redirect(controller: 'camp', action: 'campaignPage')
    }

    def campaignPage(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        render (view: 'campaign', model:[username:name ])
        //render view: 'campaign'
    }
}
