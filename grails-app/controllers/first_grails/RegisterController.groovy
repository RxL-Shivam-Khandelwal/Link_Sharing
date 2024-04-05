package first_grails

class RegisterController {

    def index() { 
        render "Data Saved";
    }

    def error(){
        render " Due to some error, account not created."
    }
 def dashboard(Long userId) {
    def user = Users.finById(userId)
    def subscriptionCount = Subscription.where {
        user.id == userId;
    }.count()

    def topicCount = Topic.where {
        user.id == userId
    }.count()
    def subscription_Topic = Topic.where {
       user.id == userId
     }   
     def topics= Topic.list();
     if(topics==null){
        println  "hello";
     }else{
        topics.each{it-> println it;}
     }
     session.user = user;     
    session.subscription_Topic = subscription_Topic;   
    render(view: "../Frontend/dashboard", model: [subscriptionCount: subscriptionCount, topicCount: topicCount,all_Topics:topics])
}

    def create_user() {
        try {
            Users user = new Users(params)
            println params;
            user.save(flush: true, failOnError: true)
            def userId = user.id
             session.user_id = user.id
            // Set user ID in localStorage
            render(template: '/register/setLocalStorage', model: [userId: userId])
        }catch (Exception e) {
              println e;
             render (view: "create", model: [errors: e])
        }
    }
}
