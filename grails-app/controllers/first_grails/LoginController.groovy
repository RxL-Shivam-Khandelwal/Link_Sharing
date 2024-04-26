package first_grails
import org.hibernate.criterion.Order
class LoginController {

    def index() {
            Long maxPerPage = 2
            Long currentPage = 1;
            Long currentPageP = 1;
            Long offset = (currentPage - 1) * maxPerPage
            List<Resources> resource = Resources.createCriteria().list(max: maxPerPage, offset: offset) {
                eq("isdeleted", false)
                order("lastUpdated", "desc")
            }
            Long totalRecords = Resources.countByIsdeleted(false)
            List<Resources> res_shares = resource;
            render(view: "../Frontend/login", model: [resource: resource, currentPage: currentPage, totalRecords: totalRecords, res_shares: res_shares, maxPerPage: maxPerPage, currentPageP: currentPageP]);

    }

    def loginUser(){
        String email = params.email
        String password = params.password
        Users dummyUser = Users.findByEmail(email);
        Users user = Users.findByEmailAndPassword(email, password);
        String msg = ""

        if (user && user.active == true) {
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
        } else if(dummyUser){
               msg = "Please write correct Credentials!!"
          }
          else {
               msg = "Please contact Admin!!"
        }
        render(template:"/templates/errorHandling", model: [msg: msg]);
    }


    def nextPage() {
        Long maxPerPage = 2
        Long currentPage = 1;
        Long currentPageP = 1;
        if(params?.page){
            currentPage= params.page.toLong();
        }
        println "value of current page is :" + currentPage;
        Long offset = (currentPage - 1) * maxPerPage
        List<Resources> resource = Resources.createCriteria().list(max: maxPerPage, offset: offset){
            eq("isdeleted", false)
            order("lastUpdated","desc")
        }
        println "value of currentPGE IS :" + currentPage + "resources are:" + resource;
        Long totalRecords = Resources.countByIsdeleted(false)

        render(template: '/templates/recentShares', model: [resource: resource, currentPage: currentPage, totalRecords: totalRecords,maxPerPage: maxPerPage,currentPageP: currentPageP]);
    }


    def topPosts(){
        Long maxPerPage = 2
        Long currentPage = 1;
        if(params?.page){
            currentPage= params.page.toLong();
        }
        println "value of current page is :" + currentPage;
        Long offset = (currentPage - 1) * maxPerPage
        List<Resources> resource = Resources.createCriteria().list(max: maxPerPage, offset: offset){
            eq("isdeleted", false)
            order("lastUpdated","desc")
        }
        println "value of currentPGE IS :" + currentPage + "resources are:" + resource;
        Long totalRecords = Resources.countByIsdeleted(false)
        render(template: '/templates/topPosts', model: [resourceP: resource, currentPageP: currentPage, totalRecordsP: totalRecords,maxPerPageP: maxPerPage]);

    }
}
