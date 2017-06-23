package com.com

import com.digital.user.FacebookData
import com.restfb.DefaultFacebookClient
import com.restfb.FacebookClient
import com.restfb.Parameter
import com.restfb.Version
import com.restfb.json.JsonObject
import facebook4j.Facebook
import facebook4j.auth.AccessToken

class CampController {
    def springSecurityService
    AccessToken info
    String text
    def campaign() {
        Facebook facebook = (Facebook)session.getAttribute("facebook")
        String oauthCode = request.getParameter("code")

            try{
                facebook.getOAuthAccessToken(oauthCode)
                /*facebook.deleteAllPermissions();
                request.getSession().invalidate();*/
            }catch(Exception e){
                redirect(controller: 'camp', action: 'problemSignin')
            }
        try{
            info = facebook.getOAuthAccessTokenInfo()
            text=info.toString();
            String[] firstSplit=text.split("token='")
            String[] secondSplit=firstSplit[1].split("'")
            def currentUser = springSecurityService.currentUser
            def id=currentUser.getId()


            def fbdata = new FacebookData(name: "FacebookData")
            def shortLivedToken =secondSplit[0]

            //To extend Token expiration.......................
            info = facebook.extendTokenExpiration(shortLivedToken );
            text=info.toString();
            String[] firstSplitAgain=text.split("token='")
            String[] secondSplitAgain=firstSplitAgain[1].split("'")
            def accessToken=secondSplitAgain[0]
            //AccessToken
            fbdata.setAccessToken(accessToken)
            FacebookClient fbClient = new DefaultFacebookClient(accessToken);
            FacebookClient client = new DefaultFacebookClient(accessToken, Version.LATEST);
            JsonObject picture = client.fetchObject("me/picture", JsonObject.class, Parameter.with("redirect","false"));
            String imagetext=picture.toString();
            String[] firstImageSplit=imagetext.split("\"url\":\"");
            String []secondImageSplit=firstImageSplit[1].split("\"");
            String dpUrl=secondImageSplit[0]
            com.restfb.types.User fbuser = fbClient.fetchObject("me",com.restfb.types.User.class, Parameter.with("fields", "name,id"));

            def fb=FacebookData.list()
            Boolean notPresent=true
            /*//Retriving associated fb accounts
            List<FacebookData> fblist*/
            for(FacebookData data:fb){
                if(data.getFacebookId().equals(fbuser.getId()))
                {
                    if(data.userId==id){
                        data.setFacebookName(fbuser.getName())
                        data.setAccessToken(accessToken)
                        data.setProfilePicUrl(dpUrl)
                        data.save(flush: true)
                        notPresent=false
                    }
                }
            }
            if(notPresent){
                fbdata.setFacebookName(fbuser.getName())
                fbdata.setFacebookId(fbuser.getId())
                fbdata.setProfilePicUrl(dpUrl)
                currentUser.addToFacebookData(fbdata)
                fbdata.save(flush: true)
            }
        //render (view: 'campaign', model:[username:name ])
            redirect(controller: 'secure', action: 'index')
        }catch (Exception e){
                e.printStackTrace()
        }
    }

    def campaignPage(){
        //Retriving associated fb accounts

        def currentUser = springSecurityService.currentUser
        List<FacebookData> fblist=new ArrayList<FacebookData>()
        Boolean check=false
        Boolean fbselect=false
        def id=currentUser.getId()
        def fb=FacebookData.list()
        for(FacebookData data:fb) {
            if (data.userId == id) {
                check=true
                fblist.add(data)
            }
        }
        def name=currentUser.getUsername()
        render (view: 'campaign', model:[username : name, userFbData : fblist, fbcheck : check, fbSelect:fbselect])
        //render view: 'campaign'
    }

    def problemCampaign(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        render (view: 'problemCampaign', model:[username:name ])
        //render view: 'campaign'
    }

    def problemSignin(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        render (view: 'welcomeagain', model:[username:name ])
        //render view: 'campaign'
    }
}
