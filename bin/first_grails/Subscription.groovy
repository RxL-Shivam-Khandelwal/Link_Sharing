package first_grails
import first_grails.Topic

class Subscription {
   Topic topic;
   Users user;
   enum seriousness{
    serious,very_serious,casual
   }
   Date dateCreated;
    static constraints = {
        // topic(unique:['user'])
        // seriousness(nullable:false)
        // user(nullable:false)
    }
    static belongsTo = [topic: Topic, user: Users];
}
