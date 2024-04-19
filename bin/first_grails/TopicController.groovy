package first_grails


class TopicController {

    def index() { 

    }

    def create_Topic(){
        
        try{
            println params;
             def userId= session.user_id;
            def user= Users.get(userId);

            Topic topic= new Topic(name:params.name, user:user,visibility:params.visibility);
            // as user has created a topic, it means it should also be added to its subscriptions.
           // trying to add the subscriptions to the user Subscription list
   
            topic.save(flush:true, failOnError: true);
            Subscription new_subs= new Subscription();
            println "userId in topic controller: ${userId}";
            new_subs.topic = topic;
            new_subs.user = user;         //user created the topic therefore user should be added as it is.
            new_subs.seriousness = "Serious";
            new_subs.save(flush:true, failOnError:true);
            flash.message = "Save successful!"
            redirect(controller:"Register", action:"dashboard", params:[userId: userId] )

        }catch(Exception e){
            render "Topic not created + ${e}";
        }
    }
}
