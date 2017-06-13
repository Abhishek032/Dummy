package com.digital.auth

import com.digital.user.FacebookData
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	String username
	String email
	String contact
	String industry
	String company
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [facebookData : FacebookData]
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
	}

	static mapping = {
		password column: '`password`'
	}
}
