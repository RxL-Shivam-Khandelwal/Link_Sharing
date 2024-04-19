package first_grails

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class Topic_demoServiceSpec extends Specification implements ServiceUnitTest<Topic_demoService>{

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
