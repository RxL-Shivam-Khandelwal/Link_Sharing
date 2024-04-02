package first_grails

class TopicController {

    def index() { 

    }

    def create_Topic(){
        
        try{
            println params;
            Topic topic= new Topic(params);
             def userId= session.user_id;
            // as user has created a topic, it means it should also be added to its subscriptions.
           // trying to add the subscriptions to the user Subscription list
            def user= Users.get(userId);
           
            println topic;
            topic.save(flush:true, failOnError: true);
            Subscription new_subs= new Subscription();
                        println topic;
            new_subs.topic = topic;
            new_subs.user = user;
            new_subs.seriousness = "Serious";
            new_subs.save(flush:true, failOnError:true);
           println topic;

             def subscription_Topic = Topic.where {
                 (user.id == userId)
                  }
            println "topic : ${topic}";
            flash.message = "Topic created successfully!"
           
             
             def topicCount = Topic.where {
                 user.id == userId
             }.count()

               def subscriptionCount = Subscription.where {
                   user.id == userId;
               }.count()

                def all_Topics= Topic.list();      // List of all the topics.
                def topicUserMap = [:];
                all_Topics.each { ctopic ->
                  def user_name = Users.get(ctopic.userId).username;
                  topicUserMap[ctopic.name] = user_name;  
                }
                session.subscription_Topic = subscription_Topic;
                session.topicUserMap=topicUserMap;
                session.user= user;
               session.topicCount = topicCount;    
               session.all_Topics = all_Topics;
            render (view: "../Frontend/dashboard", model: [subscriptionCount: subscriptionCount, topicCount: topicCount]);   
        }catch(Exception e){
            render "Topic not created + ${e}";
        }
    }
}
