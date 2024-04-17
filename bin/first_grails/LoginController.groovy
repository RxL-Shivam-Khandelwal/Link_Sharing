package first_grails
import org.hibernate.criterion.Order
class LoginController {

    def index() {
        Long maxPerPage = 2
        Long currentPage = 1;
        if(params?.page){
            currentPage= params.page.toLong();
        }

        Long offset = (currentPage - 1) * maxPerPage
        def resource = Resources.createCriteria().list(max: maxPerPage, offset: offset){
            eq("isdeleted", false)
            order("lastUpdated","desc")
        }

        def totalRecords = Resources.countByIsdeleted(false)
        def res_shares = resource;
        render (view : "../Frontend/login", model:[resource: resource, currentPage: currentPage, totalRecords: totalRecords,res_shares:res_shares, maxPerPage: maxPerPage]);
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
                //   def topics= Topic.list();
                // def sub_topic = Subscription.findAllByUser(user);
                  session.user= user;
                  session.user_id = userId;
            render(template: '/register/setLocalStorage', model: [userId: userId])
            // render (view: "../Frontend/dashboard",model: [subscriptionCount: subscriptionCount, topicCount: topicCount])
        } else {
            // redirect(controller: "register", action: "index")
            render "create an account first";
        }
    }


    def nextPage() {
        def maxPerPage = 2
        Long currentPage = 1;
        if(params?.page){
            currentPage= params.page.toLong();
        }
        println "value of current page is :" + currentPage;
        def offset = (currentPage - 1) * maxPerPage
        def resource = Resources.createCriteria().list(max: maxPerPage, offset: offset){
            eq("isdeleted", false)
            order("lastUpdated","desc")
        }
        println "value of currentPGE IS :" + currentPage + "resources are:" + resource;
        def totalRecords = Resources.countByIsdeleted(false)

        render(template: '/templates/recentShares', model: [resource: resource, currentPage: currentPage, totalRecords: totalRecords,maxPerPage: maxPerPage]);
    }


    def topPosts(){
        def maxPerPage = 2
        Long currentPage = 1;
        if(params?.page){
            currentPage= params.page.toLong();
        }
        println "value of current page is :" + currentPage;
        def offset = (currentPage - 1) * maxPerPage
        def resource = Resources.createCriteria().list(max: maxPerPage, offset: offset){
            eq("isdeleted", false)
            order("lastUpdated","desc")
        }
        println "value of currentPGE IS :" + currentPage + "resources are:" + resource;
        def totalRecords = Resources.countByIsdeleted(false)

        render(template: '/templates/topPosts', model: [resourceP: resource, currentPageP: currentPage, totalRecordsP: totalRecords,maxPerPageP: maxPerPage]);

    }
}
