package first_grails

class Resources {
  String description;
  Users user;
  Topic topic;
  String url;
  byte[]  documentResource;
transient Float avgRating

    static constraints = {
        url(nullable:true)
        documentResource(nullable:true);
    }
    static belongsTo = [topic:Topic, user:Users];
    static hasMany = [readingItems: ReadingItem];

}
