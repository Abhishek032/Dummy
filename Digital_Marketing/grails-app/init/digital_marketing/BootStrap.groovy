package Digital_Marketing


import com.grailsbrains.auth.UserRole
import com.grailsbrains.auth.Role
import com.grailsbrains.auth.User

class BootStrap {

    def init = {

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()

        def testUser = new User(username: 'admin', password: 'admin').save()

        UserRole.create testUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 1
        assert Role.count() == 1
        assert UserRole.count() == 1

    }
}
