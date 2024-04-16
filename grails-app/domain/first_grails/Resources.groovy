package first_grails

class Resources {
  String description;
  Users user;
  Topic topic;
  String url;
  byte[]  documentResource;
    Boolean isdeleted=0;
    Date dateCreated;
    Date lastUpdated;
    static constraints = {
        url(nullable:true)
        documentResource(nullable:true);
        isdeleted(nullable: true, defaultValue: false);
    }
    static belongsTo = [topic:Topic, user:Users];
    static hasMany = [readingItems: ReadingItem, resourceRating: ResourceRating];

}
