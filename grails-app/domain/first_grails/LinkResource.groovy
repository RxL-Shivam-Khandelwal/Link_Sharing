package first_grails

class LinkResource {
 String url;

    static constraints = {
    }
    static belongsTo = [resource: Resources];
    
    
}
