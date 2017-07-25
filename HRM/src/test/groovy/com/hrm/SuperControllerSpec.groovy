package com.hrm

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@Mock([RoleEmployee])
@TestFor(SuperController)
class SuperControllerSpec extends Specification {

    def setup() {
        def module = new Module('AAAAA', 'BBBBBB')

    }

    def cleanup() {
    }

    void "test something"() {




        /*expect:"fix me"
            true == false*/
    }
}
