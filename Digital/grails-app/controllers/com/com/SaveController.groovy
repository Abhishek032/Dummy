package com.com

import com.digital.user.CampaignDetails
import com.digital.user.FacebookData
import com.restfb.DefaultFacebookClient
import com.restfb.FacebookClient
import com.restfb.Parameter
import com.restfb.types.FacebookType

class SaveController {
    def springSecurityService
    def link(CampaignDetails camp) {
        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        def fb=FacebookData.list()
        for(FacebookData data:fb)
        {
            if(data.userId==id){

                FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());

                //Post Link
                if (params.campaignMessage != null) {
                    def link = params.campaignLink
                    def message = params.campaignMessage
                    FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", message),
                            Parameter.with("link", link));
                    camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                    System.out.println("facebook.com/" + response.getId());
                } else {
                    def link = params.campaignLink

                    FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("link", link));
                    camp.setCampaignUrl(response.getId())
                    System.out.println("facebook.com/" + response.getId());
                }
                data.addToCampaignDetails(camp).save()
                camp.save(flush: true)
            }
        }
        redirect(controller: 'camp', action: 'campaignPage')
        //redirect(controller: 'post', action: 'linkpost')
    }
}
