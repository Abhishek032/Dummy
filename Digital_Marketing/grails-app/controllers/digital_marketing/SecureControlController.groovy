package Digital_Marketing

import grails.plugin.springsecurity.annotation.Secured



class SecureController {

    def index() {
        render (view:"Login")

    }
}
