package first_grails

class DocumentResource {
   String filePath;

    static constraints = {
    }
    static belongsTo= [resource:Resources];
}
