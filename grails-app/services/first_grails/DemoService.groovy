package first_grails

import grails.gorm.transactions.Transactional

@Transactional
class DemoService {

    def serviceMethod() {
        println "demo service"
        return  true;
    }
}
