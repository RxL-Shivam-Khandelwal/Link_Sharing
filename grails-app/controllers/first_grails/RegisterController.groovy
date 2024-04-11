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
    def subscriptionCount = Subscription.where {
        user.id == userId;
    }.count()

    def topicCount = Topic.where {
        user.id == userId
    }.count()
     def sub_topic = Subscription.findAllByUser(user);

   def topics =  Topic.list();
     session.user = user;  
     def l = []
     def all_resource = Resources.list();
     all_resource.each { resource ->

                def readingItemlist = ReadingItem.findAllByResource(resource);
         Boolean flag=0;
         readingItemlist.each{it->
                if(it.user==session.user && it.isRead){
                    flag=1;
                }
         }
         if(!flag){
             l.add(resource);
         }
     }
    render(view: "../Frontend/dashboard", model: [subscriptionCount: subscriptionCount, topicCount: topicCount,all_Topics:topics,resource: l,subscription_Topic: sub_topic, curr_user:user])
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

    def is_read(){

        Resources res= Resources.findById(params.resId);
        Users user= Users.findById(session.user_id);
        ReadingItem item = ReadingItem.findByUserAndResource(user,res);
        if(item!=null){
        item.isRead = true;
        item.save(flush: true, failOnError: true);
        }else{
          ReadingItem r_item = new ReadingItem(resource:res, user:user,isRead:true);
          r_item.save(flush:true, failOnError:true);
        }
        Long userId = session.user.id;
         redirect(action:"dashboard", params: [userId: userId]);

    }

    def change_topic_name(){
         def topic_name = params.new_topic_name;
        Topic curr_topic = Topic.findById(params.topicId);
        curr_topic.name = topic_name;
        curr_topic.save(flush:true, failOnError:true);
        Long userId= session.user.id;
        redirect(action: "dashboard",params: [userId:userId] );

    }

    def change_topic_mode(){
        Topic curr_topic = Topic.findById(params.topicId);
        curr_topic.visibility = params.selectedVisibility;
        curr_topic.save(flush:true);
        Long userId= session.user.id;
        redirect(action:"dashboard",params: [userId: userId]);
    }

    def change_seriousness(){
        Subscription curr_sub = Subscription.findById(params.StopicId);
        curr_sub.seriousness = params.selectedSeriousness;
        curr_sub.save(flush:true);
        println params;
        Long userId= session.user.id;
        redirect(action:"dashboard",params: [userId: userId]);
    }
}
