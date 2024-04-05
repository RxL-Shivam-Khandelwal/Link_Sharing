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

            topic.save(flush:true, failOnError: true);
            Subscription new_subs= new Subscription();
            println topic;
            new_subs.topic = topic;
            new_subs.user = user;         //user created the topic therefore user should be added as it is.
            new_subs.seriousness = "Serious";
            new_subs.save(flush:true, failOnError:true);
          
              println "value: ${topic}";
        // //     // find all the subscription of the user.(first fetch all the topicId from the subscription table by matching userId, then from topic table match those topicId from the Topic table to get all the topics.)
        // def total_subscriptions = Subscription.findAllByUser(Users.get(userId))

        // // Extract topic ids from subscriptions
        // def topicIds = total_subscriptions.collect { it.topic.id }

        // // Find topics based on the extracted topic ids
        // def subscription_Topic = Topic.findAllByIdInList(topicIds)


        def subscription_Topic =  Subscription.findAllByUser(user);



        
            //    def subscription_Topic = Subscription.where {
            //        user.id == userId;
            //    }

            println subscription_Topic;
            flash.message = "Topic created successfully!"
           
             
             def topicCount = Topic.where {
                 user.id == userId
             }.count()

               def subscriptionCount = Subscription.where {
                   user.id == userId;
               }.count()

                def topics= Topic.list(); 
                def res = Resources.list();

                session.subscription_Topic = subscription_Topic;
                session.user= user;
            render (view: "../Frontend/dashboard", model: [subscriptionCount: subscriptionCount, topicCount: topicCount, all_Topics: topics, resource: res]);   
        }catch(Exception e){
            render "Topic not created + ${e}";
        }
    }
}
