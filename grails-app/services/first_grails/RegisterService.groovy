package first_grails

import grails.gorm.transactions.Transactional
import first_grails.Subscription;
import first_grails.Topic;
import org.hibernate.criterion.Projections

@Transactional
class RegisterService {

    def serviceMethod() {

    }

    def dashboard(Long userId) {
         Users user = Users.findById(userId)
            Users curr_user = user;

        def subscriptionCount = Subscription.createCriteria().get {
            projections {
                count()
            }
            createAlias('topic', 't')
            eq('user.id', userId)
            eq('t.isdeleted', false)
        }
        def topicCount = Topic.createCriteria().get{
            projections{
                count()
            }
            eq('user.id', userId)
            eq('isdeleted', false)
        }

            List<Subscription> sub_topic = Subscription.findAllByUser(user);
            List<Topic> topics =  Topic.list();
            topics.sort({t1, t2 ->
                Long ResourcecountT1 = t1.resources.size();
                Long ResourcecountT2 = t2.resources.size();
                ResourcecountT2.compareTo(ResourcecountT1)
            })

            List<Resources> l = []
        List<Resources> new_posts= [];
            topics.each{ it->
                if(Subscription.findByTopicAndUser(it,user) && it.resources.size() && it.visibility == Topic.Visibility.Public){
                    def reso = it.resources;
                    reso.each{ it1->
                        new_posts.add([it1]);
                    }
                }
            }
            new_posts.each{  resource->
                List<ReadingItem> readingItemlist = ReadingItem.findAllByResource(resource);
                Boolean flag=0;
                readingItemlist.each{it->
                    if(it.user==user && it.isRead){
                        flag=1;
                    }
                }
                if(!flag){
                    l.add([resource]);
                }
            }
            l = l.flatten();
            String user_img = curr_user.photoURL;
            println  topics.size();
            // preparing data for pagination.
            Long totalRecords = topics.size();
            Long maxPerPage = 2
            Long currentPage = 1;
            Long offset = (currentPage - 1) * maxPerPage;
            topics=  Topic.createCriteria().list(max: maxPerPage, offset: offset){
                eq('isdeleted', false);

            }
         Map mp = [
                 subscriptionCount: subscriptionCount,
                 topicCount: topicCount,
                 topics: topics,
                 l: l,
                 sub_topic: sub_topic,
                 user: user,
                 user_img: user_img,
                 maxPerPage: maxPerPage,
                 currentPage: currentPage,
                 offset: offset,
                 totalRecords: totalRecords
         ]
           return mp;
     }

    def nextPage(Long currentPage,Long totalRecords, Users curr_user) {
        def maxPerPage = 2
        def offset = (currentPage - 1) * maxPerPage
        def topics=  Topic.createCriteria().list(max: maxPerPage, offset: offset){
            eq('isdeleted', false);
        }
        Map mp = [
                topics : topics,
                currentPage: currentPage,
                totalRecords: totalRecords,
                maxPerPage:maxPerPage,
                curr_user: curr_user
        ]
        return mp;
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

    void is_read(Resources res,Users user){

        ReadingItem item = ReadingItem.findByUserAndResource(user,res);
        if(item!=null){
            item.isRead = true;
            item.save(flush: true, failOnError: true);
        }else{
            ReadingItem r_item = new ReadingItem(resource:res, user:user,isRead:true);
            r_item.save(flush:true, failOnError:true);
        }
    }

    void change_topic_name(def params){
        def topic_name = params.new_topic_name;
        Topic curr_topic = Topic.findById(params.topicId);
        curr_topic.name = topic_name;
        curr_topic.save(flush:true, failOnError:true);
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
