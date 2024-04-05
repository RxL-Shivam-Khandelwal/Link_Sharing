package first_grails

class LoginController {

    def index() { 
    }

    def loginUser(){
        def email = params.email
        def password = params.password
        def user = Users.findByEmailAndPassword(email, password);


          if (user) {
                  Long userId = user.id;
                  def subscriptionCount = Subscription.where {
                      user.id == userId;
                  }.count()
                  def topicCount = Topic.where {
                      user.id == userId
                  }.count()
                  def topics= Topic.list();
                   def subscription_Topic = Subscription.where {
                      (user.id == userId)
                  }          
                  session.subscription_Topic = subscription_Topic;
                  session.user= user;
                  session.user_id = userId;
                //   session.all_Topics = all_Topics;
                  session.subscriptionCount=subscriptionCount;
                  session.topicCount = topicCount;
            render(template: '/register/setLocalStorage', model: [userId: userId, all_Topics: topics])
            // render (view: "../Frontend/dashboard",model: [subscriptionCount: subscriptionCount, topicCount: topicCount])
        } else {
            // redirect(controller: "register", action: "index")
            render "create an account first";
        }
    }
}
