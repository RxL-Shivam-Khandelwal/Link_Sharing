package first_grails
import org.hibernate.criterion.Order
import org.hibernate.criterion.CriteriaSpecification
import org.hibernate.criterion.*

class RegisterController {

    def index() { 
        render "Data Saved";
    }

    def error(){
        render " Due to some error, account not created."
    }
 def dashboard(Long userId) {
    def user = Users.findById(userId)
        def curr_user = user;

          println "cur_user :   ${curr_user} :    ${userId}"

    def subscriptionCount = Subscription.where {
        user.id == userId;
    }.count()

    def topicCount = Topic.where {
        user.id == userId
    }.count()
     def sub_topic = Subscription.findAllByUser(user);
     def criteria = Topic.createCriteria();
// def topics = criteria.list {
//     // Perform a subquery to count the number of subscriptions for each topic
//     projections {
//         property("id")
//         countDistinct("subscriptions.id")
//     }

//     // Group by topic id
//     groupProperty("id")

//     // Order by the count of subscriptions in descending order
//     order(Projections.countDistinct("subscriptions.id"), "desc")

//     // Transform the result to Topic objects
//     resultTransformer(org.hibernate.criterion.Transformers.aliasToBean(Topic))
// }
  
   def topics =  Topic.list();
     //  def topics= Topic.list();
     def res= Resources.list();
     session.user = user;  
 
    render(view: "../Frontend/dashboard", model: [subscriptionCount: subscriptionCount, topicCount: topicCount,all_Topics:topics,resource: res,subscription_Topic: sub_topic, curr_user:user])
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
