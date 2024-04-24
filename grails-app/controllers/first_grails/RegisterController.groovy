package first_grails
import org.hibernate.criterion.Order
import org.hibernate.criterion.CriteriaSpecification
import org.hibernate.criterion.*

class RegisterController {
 RegisterService registerService;
    def index() {
    }

    def error(){
        render " Due to some error, account not created."
    }
 def dashboard(Long userId) {
   if(session.user_id == null){
       render(template: "/templates/errorHandling")
   }else{
       userId = session.user_id;
      def user = Users.findById(userId)
       Map result = registerService.dashboard(userId);
       render(view: "../Frontend/dashboard", model: [subscriptionCount: result.subscriptionCount, topicCount: result.topicCount,all_Topics:result.topics,resource: result.l,subscription_Topic: result.sub_topic, curr_user:result.user,user_img: result.user_img,maxPerPage:result.maxPerPage,currentPage:result.currentPage,offset:result.offset,totalRecords:result.totalRecords])
       }
}

    def nextPage() {
        Long currentPage = 1;
        Long totalRecords = params.totalRecords.toLong();
        if(params?.page){
            currentPage= params.page.toLong();
        }
        Users curr_user = session.user;
        Map result = registerService.nextPage(currentPage,totalRecords,curr_user);

        render(template: '/templates/trendingTopics', model: [all_Topics: result.topics, currentPage: result.currentPage, totalRecords: result.totalRecords,maxPerPage: result.maxPerPage,curr_user : result.curr_user]);
    }
    def create_user() {
        try {
            Users user = new Users(params)
            println params;
            println "user image format check" + params.photo;
            user.save(flush: true, failOnError: true)
            def userId = user.id
             session.user_id = user.id
             session.user = user;
            // Set user ID in localStorage
            render(template: '/register/setLocalStorage', model: [userId: userId])
        }catch (Exception e) {
              println e;
             render (view: "create", model: [errors: e])
        }
    }

    def is_read(){

        Resources res= Resources.findById(params.resId);
        Users user= Users.findById(session.user_id);
        registerService.is_read(res,user);
        Long userId = session.user.id;
        redirect(action:"dashboard", params: [userId: userId]);
    }

    def change_topic_name(){
        registerService.change_topic_name(params);
        flash.message = "Topic name changed successfully!"
        Long userId= session.user.id;
        redirect(action: "dashboard",params: [userId:userId]);

    }

    def change_topic_mode(){
        Topic curr_topic = Topic.findById(params.topicId);
        curr_topic.visibility = params.selectedVisibility;
        curr_topic.save(flush:true);
        flash.message = "Visibility mode changed!"
        Long userId= session.user.id;
        redirect(action:"dashboard",params: [userId: userId]);
    }

    def change_seriousness(){
        Subscription curr_sub = Subscription.findById(params.StopicId);
        curr_sub.seriousness = params.selectedSeriousness;
        curr_sub.save(flush:true);
        println params;
        flash.message = "Seriousness changed!"
        Long userId= session.user.id;
        redirect(action:"dashboard",params: [userId: userId]);
    }

    def toDelete(){
        Topic topic = Topic.findById(params.id);

        println "topic id that has deleted:" + topic.id;

      def res=  Resources.findAllByTopic(topic);
        res.each{ it->
            it.isdeleted =1;
        }
        Resources.saveAll(res);
        topic.isdeleted=true;
        topic.save(flush:true);
        Long userId= session.user.id;
        redirect(action: "dashboard",params: [userId: userId] );
    }
}
