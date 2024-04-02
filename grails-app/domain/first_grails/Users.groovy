package first_grails
import org.hibernate.type.StandardBasicTypes

class Users {
    String email
    String username
    String password
    String firstName
    String lastName
    byte[] photo 
    Boolean admin
    Boolean active

    static mapping = {
        photo sqlType: 'blob' // Specify column type as BLOB
    }

    static constraints = {

    email(unique: true, email: true, blank: false)
    username(unique: true, blank: false)
    password(minSize: 5, blank: false)
    firstName(blank: false)
    lastName(blank: false)
    photo(nullable: true, maxSize: 1024 * 1024 * 10) // Example size limit of 10 MB
    admin(nullable: true)
    active(nullable: true)
    }

    static hasMany = [subscriptions: Subscription, resources: Resources, resourceRatings: ResourceRating, readingItems: ReadingItem, topics: Topic]
}
