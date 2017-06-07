package com.grailsbrains.auth

import com.grailsbrains.user.CampaignDetails
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    String email
    String contact
    String industry
    String company
    String accessToken
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [campaigndetails : CampaignDetails]
    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        email(nullable:true, blank:false)
        contact(nullable:true, blank:false)
        industry(nullable:true, blank:false)
        company(nullable:true, blank:false)
        accessToken(nullable:true, blank:false)
    }

    static mapping = {
	    password column: '`password`'
    }
}
