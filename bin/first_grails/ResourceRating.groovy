package first_grails

class ResourceRating {
 Resources resource;
 Users user;
 Integer score;
    static constraints = {
                // resource(unique:['user'], nullable:false)
                // user(nullable:false)
                // score(min:1,max:5, nullable:false);
    }
    static belongsTo = [user:Users,resource:Resources];
}

