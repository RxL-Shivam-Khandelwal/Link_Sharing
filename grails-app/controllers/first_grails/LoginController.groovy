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
        List<Resources> resource = Resources.createCriteria().list(max: maxPerPage, offset: offset){
            eq("isdeleted", false)
            order("lastUpdated","desc")
        }

        Long totalRecords = Resources.countByIsdeleted(false)
        List<Resources>  res_shares = resource;
        render (view : "../Frontend/login", model:[resource: resource, currentPage: currentPage, totalRecords: totalRecords,res_shares:res_shares, maxPerPage: maxPerPage]);
    }

    def loginUser(){
        String email = params.email
        String password = params.password
        Users user = Users.findByEmailAndPassword(email, password);


          if (user) {
                  Long userId = user.id;
                  Long subscriptionCount = Subscription.where {
                      user.id == userId;
                  }.count()
                  Long topicCount = Topic.where {
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
