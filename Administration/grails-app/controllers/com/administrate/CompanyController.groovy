package com.administrate

import com.grails.Company
import com.grails.Employee
import com.grails.RoleEmployee
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class CompanyController {
    def springSecurityService

    def showCompany(){
        def name = springSecurityService.currentUser.getUsername()
        def companyList = Company.list()
        render (view: 'company', model:[username:name, company:companyList])

    }

    def showEmployee(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        Company comp=new Company()
        def companyList=Company.list()
        for(Company company: companyList){
            if(company.getId() == Integer.parseInt(params.index)){
                comp=company
            }
        }
        render (view: 'employee', model:[username:name, company:comp])
    }


    def createEmployee(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        Company company=new Company()
        def companyList=Company.list()
        for(Company comp:companyList){
            if(comp.getId()==Integer.parseInt(params.index)){
                company=comp
            }
        }
        render (view: 'createEmployee', model:[username:name, comp:company])
    }
    def saveEmployee(Employee employee){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        Company com=new Company()
        def companyList = Company.list()
        for(Company comp: companyList){
            if(comp.getId()==Integer.parseInt(params.company)){
                com=comp
                employee.setEmployeeRole("ESS")
                com.addToEmployee(employee)
                employee.save(flush:true)
            }
        }
        redirect(controller: 'company', action: 'showEmployee')
        render (view: 'employee', model:[username: name, company: com])
    }
    def roleAssignPage(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        Company comp=new Company()
        def companyList=Company.list()
        for(Company company : companyList){
            if(company.getId()==Integer.parseInt(params.index)){
                comp=company
            }
        }
        def emp=Employee.list()
        def roleList = RoleEmployee.list()
        render (view: 'roleAssign', model:[username:name, company:comp, employee:emp, role:roleList])
    }
    def roleAssign(){
        def empList = Employee.list()
        println("!!!!!"+params.data)
        println("!!!!!"+params.radio)
        for(Employee emp: empList){
            if(emp.getId()==Integer.parseInt(params.radio)){
                emp.setEmployeeRole(params.data)
                emp.save(flush:true)
            }
        }
    }
}
