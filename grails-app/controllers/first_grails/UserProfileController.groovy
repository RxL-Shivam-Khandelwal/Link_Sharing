package first_grails

class UserProfileController {

    def index() { }

    def show(){

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


    render(view:"../Frontend/userProfile" , model:[subscriptionCount: subscriptionCount, topicCount: topicCount,all_Topics: topics, resource: l, subscription_Topic: sub_topic,curr_user:user])  
    }
}
