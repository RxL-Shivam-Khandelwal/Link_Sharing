package first_grails

class Topic_showController {

    def index() { }


    def topic(){

        def curr_topic = Topic.findById(params.topicId);
        def  topic_owner = curr_topic.user;

        def topic_subscribers = curr_topic.subscriptions;
        def topic_posts = curr_topic.resources;

        def topic_Show_Map = [
            curr_topic: curr_topic,
            topic_owner: topic_owner,
            topic_subscribers: topic_subscribers,
            topic_posts: topic_posts
        ]

        render(view:"../Frontend/topic_show" , model:[topic_Show_Map:topic_Show_Map]);

    }
}
