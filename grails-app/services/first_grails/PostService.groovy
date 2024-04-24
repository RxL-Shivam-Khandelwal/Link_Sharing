package first_grails

import grails.gorm.transactions.Transactional
//import org.springframework.beans.factory.annotation.Autowired

@Transactional
class PostService {
//    @Autowired
    ResourceRatingService resourceRatingService;
    def serviceMethod() {

    }
    def show(Users user,Long resId ){
        Resources resource = Resources.findById(resId);
        Float rating = 0.0;
        Float av_rating = 0.0;
        av_rating= resourceRatingService.calculateAverageRatingForResource(resource);
            ResourceRating r = ResourceRating.findByUserAndResource(user, resource);
            if (r != null) {
                rating = r.score;
            }
            Users curr_user = user;
            Long maxPerPage=2;
            Long currentPage=1;
            Long offset=0;
            Long totalRecords = Topic.createCriteria().get {
                projections {
                    countDistinct "id"
                }
            }

            List <Topic> topics =  Topic.createCriteria().list(max: maxPerPage, offset: offset){
            }
            Map mp = [resId: resId, rating: rating, av_rating: av_rating, topics: topics, curr_user: curr_user, resource: resource,maxPerPage:maxPerPage,currentPage:currentPage,offset:offset,totalRecords:totalRecords];
              return mp
    }


}
