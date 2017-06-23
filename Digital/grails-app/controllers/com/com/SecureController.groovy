package com.com

import com.digital.user.FacebookData
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class SecureController {
    def springSecurityService
    def id
    def index() {
        def currentUser = springSecurityService.currentUser
        List<FacebookData> fblist=new ArrayList<FacebookData>()
        try{
            id=currentUser.getId()
        }catch (NullPointerException e){
            e.printStackTrace()
            redirect(uri: "/")
        }
        Boolean check=false
        def fb=FacebookData.list()
        for(FacebookData data:fb) {
            if (data.userId == id) {
                check=true
                fblist.add(data)
            }
        }
        def name = currentUser.getUsername()
        render (view: 'welcome', model:[username:name, userFbData : fblist, fbcheck:check ])
    }
}
