package com.com
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class SecureController {
    def springSecurityService
    def index() {
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        println("#######################")
        render (view: 'welcome', model:[username:name ])
    }
}
