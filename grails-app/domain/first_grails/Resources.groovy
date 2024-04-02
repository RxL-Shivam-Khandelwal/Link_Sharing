package first_grails

class Resources {
  String description;
  Users createdBy;
  Topic topic;
  Date dateCreated;
  Date lastUpdated;
    static constraints = {
      // description(blank:false)
    }
    static belongsTo = [topic:Topic, user:Users, readingItem : ReadingItem];
    static hasMany = [linkResources: LinkResource, documentResources : DocumentResource];
}
