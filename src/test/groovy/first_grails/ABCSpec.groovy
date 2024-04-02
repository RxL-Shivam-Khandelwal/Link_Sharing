package first_grails

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ABCSpec extends Specification implements DomainUnitTest<ABC> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
