package first_grails

import grails.gorm.transactions.Transactional

@Transactional
class ResourceRatingService {

    def serviceMethod() {
       println "hello world!"
        return 1;
    }


     Float calculateAverageRatingForResource(Resources resource) {
        def ratings = ResourceRating.findAllByResource(resource)
        def totalScore = 0

        // Calculate total score of all ratings for the resource
        ratings.each {
            totalScore += it.score
        }

        // Calculate average rating if there are ratings, otherwise return 0.0
        if (ratings.size() > 0) {
            return totalScore / ratings.size()
        } else {
            return 0.0
        }
    }
}
