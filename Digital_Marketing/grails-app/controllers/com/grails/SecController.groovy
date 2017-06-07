package com.grails

import grails.plugin.springsecurity.annotation.Secured

class SecController {

    @Secured('ROLE_ADMIN')
    def welcome(){

        render view: 'welcome'
    }
}
