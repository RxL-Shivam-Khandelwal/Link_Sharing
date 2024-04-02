package first_grails

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class TestingSpec extends Specification implements DomainUnitTest<Testing> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
