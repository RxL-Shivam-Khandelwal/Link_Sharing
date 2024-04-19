package first_grails

class UserProfileController {

    def index() { }

    def show(){
      if(session.user_id == null){
          render(template: "/templates/errorHandling");
      }else{
        Users user = Users.findById(session.user_id);
       Long userId = user.id;
      def subscriptionCount = Subscription.where {
        user.id == userId;
    }.count()

    def topicCount = Topic.where {
        user.id == userId
    }.count()


   def topics =  Topic.list();
    println  "topic size is : " +topics.size();

   def abc  = topics.findAll{ it-> it.user == user};
   topics =abc;
    println  "topic size  (abc) is : " +abc.size();
     session.user = user;
     def l = []
     def all_resource = Resources.list();
     all_resource.each { resource ->
         def readingItemlist = ReadingItem.findAllByResource(resource);
         Boolean flag=0;
         readingItemlist.each{it->
                if(it.user==session.user && !it.isRead){
                    flag=1;
                }
         }
         if(flag){
             l.add(resource);
         }
     }

          def sub_topic = Subscription.findAllByUser(user)

          sub_topic = sub_topic.sort { s1, s2 ->
              def s1_resources = Resources.createCriteria().get {
                  'in'('topic', s1.topic)
                  ne('isdeleted', true)
                  projections {
                      countDistinct('id')
                  }
              }

              def s2_resources = Resources.createCriteria().get {
                  'in'('topic', s2.topic)
                  ne('isdeleted', true)
                  projections {
                      countDistinct('id')
                  }
              }
              def resourceComparison = s1_resources.compareTo(s2_resources)

              if (resourceComparison == 0 && s1_resources == 0) {
                  return s1.lastUpdated <=> s2.lastUpdated
              }
              if (s1_resources == 0 || s2_resources == 0) {
                  return s1_resources <=> s2_resources
              }
              def most_recent_resource_of_s1 = s1.topic.resources.findAll { !it.isdeleted }.max { it.lastUpdated }?.lastUpdated
              def most_recent_resource_of_s2 = s2.topic.resources.findAll { !it.isdeleted }.max { it.lastUpdated }?.lastUpdated
              return most_recent_resource_of_s1 <=> most_recent_resource_of_s2
          }.reverse()
          Long maxPerPage = 2
          Long currentPage = 1;
          Long offset = (currentPage - 1) * maxPerPage;
          Long totalRecords=5;
    render(view:"../Frontend/userProfile" , model:[subscriptionCount: subscriptionCount, topicCount: topicCount,all_Topics: topics, resource: l, subscription_Topic: sub_topic,curr_user:user, currentPage: currentPage, totalRecords: totalRecords,maxPerPage: maxPerPage])
          }
    }
}
