package first_grails

class TopicController {

    def index() { 

    }

    def create_Topic(){
        
        try{
            println params;
            Topic topic= new Topic(params);
            println topic;
            topic.save(flush:true, failOnError: true);
            println "topic : ${topic}";
            flash.message = "Topic created successfully!"
            def userId= session.user_id;
             def topicCount = Topic.where {
                 user.id == userId
             }.count()
               def subscriptionCount = Subscription.where {
                   user.id == userId;
               }.count()             
            render (view: "../Frontend/dashboard", model: [subscriptionCount: subscriptionCount, topicCount: topicCount]);   
        }catch(Exception e){
            render "Topic not created + ${e}";
        }
    }
}
