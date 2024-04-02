package first_grails

class Topic {
    String name
    Users user
    Visibility visibility // Using enum name as property type

    static constraints = {
        // name(blank:false, unique:['user']);
    }

    static belongsTo = [user: Users]
    static hasMany = [resources: Resources, subscriptions: Subscription]

    enum Visibility {
        Public,
        Private
    }
}
