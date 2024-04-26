package first_grails
import org.hibernate.criterion.CriteriaSpecification

class SearchController {
    RegisterService registerService;

    def index() {

        String searchTerm = params.searchTerm;
        Long userId = session.user_id;
        Users user = Users.findById(userId)
        Map result = registerService.dashboard(userId);
        Long currentPageP =1;
         List<Resources> demo = result.l;
        List<Resources>search_posts = []
        if(user.admin ==false && searchTerm.length() > 0) {
            String lowercasesearchTerm = searchTerm.toLowerCase();
            demo.each { it ->
                if (it.description.contains(searchTerm) || (it.topic.name.toLowerCase() == lowercasesearchTerm)) {
                    search_posts.add(it);
                }
            }
        }else if(user.admin ==false && searchTerm.length() == 0){
            search_posts= demo;
        }
        Long totalRecordsP = search_posts.size();
       println "total Records : " + totalRecordsP;
        Long offset = 0;
        Long maxPerPage = 3;
        List<Resources> PaginatedSearchResult = registerService.PaginatePosts(search_posts,offset,maxPerPage);
        render(view: "../Frontend/search", model: [subscriptionCount: result.subscriptionCount, topicCount: result.topicCount,all_Topics:result.topics,resource: PaginatedSearchResult,subscription_Topic: result.sub_topic, curr_user:result.user,user_img: result.user_img,maxPerPage:maxPerPage,currentPage:result.currentPage,offset:result.offset,totalRecords:result.totalRecords,currentPageP: currentPageP,totalRecordsP:totalRecordsP])
    }

    def nextPageP(){

        Users user = session.user;
        Map result = registerService.nextPageP(params, user);
        render(template: '/templates/topPosts', model: [resourceP: result.paginatedSubscriptions, currentPageP: result.currentPage, totalRecordsP: result.totalRecordsP,maxPerPageP: result.maxPerPage]);

    }


}
