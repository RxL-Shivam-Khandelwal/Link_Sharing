package first_grails

class PostController {
 ResourceRating postRating;
    def index() { }

    def show(Long resId , Float avgRating){

            Resources resource = Resources.findById(resId);
            def rating = 0;
            Float av_rating = 0.0;
           av_rating= calculateAverageRatingForResource(resource);
//           def topics =  Topic.list();
             if(session.user  == null){
                 render(view:"../Frontend/post", model: [resId:resId, post_rating : rating,avgRating:av_rating,all_Topics: topics,curr_resource: resource])
             }else {
                 println "user is " + session.user;
                 Users user = Users.findById(session.user.id);
                 ResourceRating r = ResourceRating.findByUserAndResource(user, resource);
                 if (r != null) {
                     rating = r.score;
                 }
                 println avgRating;
                 def curr_user = session.user;
                 Long maxPerPage=2;
                 Long currentPage=1;
                 Long offset=0;
                 def totalRecords = Topic.createCriteria().get {
                     projections {
                         countDistinct "id"
                     }
                 }

                 List<Topic> topics =  Topic.createCriteria().list(max: maxPerPage, offset: offset){
                 }

                 render(view: "../Frontend/post", model: [resId: resId, post_rating: rating, avgRating: av_rating, all_Topics: topics, curr_user: curr_user, curr_resource: resource,maxPerPage:maxPerPage,currentPage:currentPage,offset:offset,totalRecords:totalRecords]);
             }
    }


    def save(){
         def rating = params.rating.toInteger();
         def resId = params.resId;
         Users user = session.user;
        Resources resource= Resources.findById(resId);
         ResourceRating r= ResourceRating.findByUserAndResource(user, resource);
         ResourceRating curr_res_rating= new ResourceRating();

         if(r!=null){
            r.score = rating;
            r.save(flush:true, failOnError:true);
         }
         else{
         curr_res_rating.resource= resource;
         curr_res_rating.user= user;
         curr_res_rating.score= rating;
         curr_res_rating.save(flush:true, failOnError:true);
         }
         if(r!=null){curr_res_rating=r;}
        println "hello guys"
    Float avgRating = calculateAverageRatingForResource(resource);
//        println postRating.serviceMethod();
//        Float avgRating  = postRating.calculateAverageRatingForResource(resource);
        render(avgRating);
    }


      private Float calculateAverageRatingForResource(Resources resource) {
        def ratings = ResourceRating.findAllByResource(resource)
        def totalScore = 0

        // Calculate total score of all ratings for the resource
        ratings.each {
            totalScore += it.score
        }

        // Calculate average rating if there are ratings, otherwise return 0.0
        if (ratings.size() > 0) {
            return totalScore / ratings.size()
        } else {
            return 0.0
        }
    }

      def delete_post(){

          Resources res = Resources.findById(params.id);
          res.isdeleted=1;
          res.save(flush:true);
          Long userId = session.user.id;
          println "post is deleted:" + res.isdeleted;
          redirect(controller:"Register", action:"dashboard", params: [userId: userId]);
      }
       
    }

