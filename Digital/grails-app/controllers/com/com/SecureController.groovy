package com.com
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class SecureController {

    def index() {
        render view: 'welcome'
    }
}
