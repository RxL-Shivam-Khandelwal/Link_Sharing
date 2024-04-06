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

        redirect(controller: "Register", action:"dashboard", params:[userId:userId]);
         
        //  render (view: "../Frontend/dashboard",model:[all_Topics : topics, resource: res,subscription_Topic: sub_topic]);
           
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

            redirect(controller: "Register", action:"dashboard", params:[userId:userId]);
    }
}
