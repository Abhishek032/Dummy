package com.administrate

import com.grails.Module
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class ModuleController {
    def springSecurityService
    def modulePage() {
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        def moduleList = Module.list()
        render(view: 'module', model: [username: name, module: moduleList])
    }
    def createModule(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        render(view: 'createModule', model: [username:name])
    }
    def saveModule(Module module){
        module.setModuleCreated(params.moduleCreated)
        module.save(flush: true)
        redirect(controller: 'module', action: 'modulePage')
    }
    def updateModule(){
        def module = Module.read(Integer.parseInt(params.moduleindex))

        module.setModuleName(params.moduleName)
        module.setModuleType(params.moduleType)
        module.setModuleCreated(params.moduleCreated)

        module.save(flush:true)
        redirect(controller: 'module', action: 'modulePage')

    }
}
