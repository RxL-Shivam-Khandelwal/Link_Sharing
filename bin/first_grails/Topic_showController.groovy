package first_grails

class Topic_showController {

    def index() { }


    def topic(){

        def curr_topic = Topic.findById(params.topicId);
        def  topic_owner = curr_topic.user;

        // def topic_subscribers = curr_topic.subscriptions;
        Long maxPerPage = 2
        Long currentPage = 1;
        if(params?.page){
            currentPage= params.page.toLong();
        }
        Long offset = (currentPage - 1) * maxPerPage
        def topic_posts = Resources.createCriteria().list(max:maxPerPage,offset: offset){
             topic{
                 eq('id', curr_topic.id)
             }
        }
        def topic_subscribers = Subscription.createCriteria().list(max: maxPerPage, offset: offset) {
    topic {
        eq('id', curr_topic.id) // Assuming you're comparing topic IDs
    }
}

def  totalRecords = Subscription.createCriteria().count{
       topic{
        eq('id', curr_topic.id) 
       }
}
def totalRecords_Posts = Resources.createCriteria().count{
    topic{
        eq('id', curr_topic.id);
    }
}
        println "value of the total items are:" + totalRecords_Posts;

        def topic_Show_Map = [
            curr_topic: curr_topic,
            topic_owner: topic_owner,
            topic_subscribers: topic_subscribers,
            topic_posts: topic_posts
        ]
  println "total sibscrubers:" + totalRecords;
  println "based on pagination subscribers" + topic_subscribers;
        render(view:"../Frontend/topic_show" , model:[topic_Show_Map:topic_Show_Map,currentPage: currentPage, totalRecords: totalRecords, maxPerPage: maxPerPage,totalRecords_Posts: totalRecords_Posts]);

    }

    def nextPage(){
         def curr_topic = Topic.findById(params.topicId);
        def  topic_owner = curr_topic.user;
         println "value of currentpage is :" + params.page;
        Long maxPerPage = 2
        Long currentPage = 1;
        if(params?.page){
            currentPage= params.page.toLong();
        }
        Long offset = (currentPage - 1) * maxPerPage
        def topic_subscribers = Subscription.createCriteria().list(max: maxPerPage, offset: offset) {
    topic {
        eq('id', curr_topic.id) // Assuming you're comparing topic IDs
    }
}

def  totalRecords = Subscription.createCriteria().count{
       topic{
        eq('id', curr_topic.id) 
       }
}

def topic_Show_Map =[
            curr_topic: curr_topic,
            topic_owner: topic_owner,
            topic_subscribers: topic_subscribers,
            topic_posts: topic_posts 
]

        println "value of current page is :" +  currentPage;
        render(template: "/templates/subscribedUsers",  model:[topic_Show_Map:topic_Show_Map,currentPage: currentPage, totalRecords: totalRecords, maxPerPage: maxPerPage]);
    }


    def nextPageResources(){
        def curr_topic = Topic.findById(params.topicId);
        def  topic_owner = curr_topic.user;
        println "value of currentpage is :" + params.page;
        Long maxPerPage = 2
        Long currentPage = 1;
        if(params?.page){
            currentPage= params.page.toLong();
        }
        Long offset = (currentPage - 1) * maxPerPage;
        def topic_posts = Resources.createCriteria().list(max:maxPerPage,offset: offset){
            topic{
                eq('id', curr_topic.id)
            }
        }

        def totalRecords_Posts = Resources.createCriteria().count{
            topic{
                eq('id', curr_topic.id);
            }
        }
        def topic_Show_Map =[
                curr_topic: curr_topic,
                topic_owner: topic_owner,
                topic_posts: topic_posts
        ]
        println "programm is running fine till now!" + topic_posts

        render(template: "/templates/topicPosts",  model:[topic_Show_MapP:topic_Show_Map,currentPageP: currentPage, totalRecords_Posts: totalRecords_Posts, maxPerPageP: maxPerPage]);
    }
}
