package first_grails.AuthenticationInterceptor

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class GroovyInterceptorSpec extends Specification implements InterceptorUnitTest<GroovyInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test groovy interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"groovy")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
