package first_grails

class UserProfileController {

    def index() { }

    def show(){
      if(session.user == null){
          render(template: "/templates/errorHandling");
      }else{
        println "value is " + session?.user;
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
  
       def sub_topic = Subscription.findAllByUser(user);
           sub_topic = sub_topic.sort{s1, s2 ->
               int s1_resources = s1.resources.size();
               int s2_resources = s2.resources.size();

               if(s1_resources == s2_resources && s1_resources==0){
                  return  s1.lastUpdated > s2.lastUpdated;
               }else if(s1_resources==0){
                   return -1;
               }else if(s2_resources==0){
                   return 1;
               }
               int most_recent_resource_of_s1 = s1.resources.max{it-> it.lastUpdated}
               int most_recent_resource_of_s2 = s2.resources.max{it->it.lastUpdated}
               return most_recent_resource_of_s1 > most_recent_resource_of_s2;
           }

    render(view:"../Frontend/userProfile" , model:[subscriptionCount: subscriptionCount, topicCount: topicCount,all_Topics: topics, resource: l, subscription_Topic: sub_topic,curr_user:user])
          }
    }
}
