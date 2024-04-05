package first_grails

class SubandUnsubController {

    def index() { }

    def subscribe(params){
            Subscription new_subs= new Subscription();
            // println "hello: ${params.topicId}";
               // Converting params.topicId to Long
               def topicId = params.topicId.toLong();
               // Converting params.cuser to Long
            //   println "helloWorld : ${topicId}";
               def cuserId = params.cuser.toLong();
            def topic = Topic.findById(topicId);
            def curr_user = Users.findById(cuserId);
            // def creator = topic.user;
            // def creator_user  = Users.findById(creator_id);
              // println "hello_topic: ${topic} : ${creator_user}";
            // def creator_of_topic ;
            new_subs.topic= topic;
            new_subs.user= curr_user;
            new_subs.seriousness = "Serious";
            // println "curr_user: ${curr_user} : curr_topic: ${topic}";
            new_subs.save(flush:true, failOnError:true);
            def userId= session.user_id;

        //     // find all the subscription of the user.(first fetch all the topicId from the subscription table by matching userId, then from topic table match those topicId from the Topic table to get all the topics.)
        // def total_subscriptions = Subscription.findAllByUser(Users.get(userId))

        // // Extract topic ids from subscriptions
        // def topicIds = total_subscriptions.collect { it.topic.id }

        // // Find topics based on the extracted topic ids
        // def subscription_Topic = Topic.findAllByIdInList(topicIds);
        // def subscription_Topic = Subscription.findAllByUser(Users.get(userId))
        def subscription_Topic =  Subscription.findAllByUser(curr_user);
         def topics = Topic.list();
        session.subscription_Topic = subscription_Topic;

         render (view: "../Frontend/dashboard",model:[all_Topics : topics ]);
           
    }

    def unsubscribe(){

        def topicId = params.topicId.toLong()
        def userId = params.cuser.toLong()
            def topic = Topic.findById(topicId);
            def curr_user  = Users.findById(userId);
        // Find the subscription record based on topicId and userId
        def subscription = Subscription.findByTopicAndUser(topic, curr_user);

        if (subscription) {
            // Delete the subscription record
            subscription.delete(flush: true)
            flash.message = "You have unsubscribed from this topic."
        } else {
            flash.message = "Subscription not found."
        }
        // def total_subscriptions = Subscription.findAllByUser(curr_user)

        // // Extract topic ids from subscriptions
        // def topicIds = total_subscriptions.collect { it.topic.id }

        // // Find topics based on the extracted topic ids
         // def subscription_Topic = Topic.findAllByIdInList(topicIds);

        def subscription_Topic =  Subscription.findAllByUser(curr_user);
        session.subscription_Topic = subscription_Topic;
                 def topics = Topic.list();

         render (view: "../Frontend/dashboard",model:[all_Topics : topics ]);
    }
}
