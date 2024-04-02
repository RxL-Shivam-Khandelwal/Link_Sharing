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
                  session.user_id = userId;
            render(template: '/register/setLocalStorage', model: [userId: userId])
            // render (view: "../Frontend/dashboard",model: [subscriptionCount: subscriptionCount, topicCount: topicCount])
        } else {
            // redirect(controller: "register", action: "index")
            render "create an account first";
        }
    }
}
