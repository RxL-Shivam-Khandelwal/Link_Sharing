package first_grails

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class SampleControllerSpec extends Specification implements ControllerUnitTest<SampleController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
