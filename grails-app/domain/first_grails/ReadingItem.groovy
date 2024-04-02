package first_grails

class ReadingItem {
Resources resource;
Users user;
Boolean isRead;

    static constraints = {
        // resource(unique:['user']);
    }
    static belongsTo = [user: Users];
}
