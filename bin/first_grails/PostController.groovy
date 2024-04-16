package first_grails

class PostController {

    def index() { }

    def show(Long resId , Float avgRating){

            println "value isdofdsfdsif " + avgRating;
            Resources resource = Resources.findById(resId);
            Users user = Users.findById(session.user.id);
            ResourceRating r= ResourceRating.findByUserAndResource(user, resource);
            def rating = 0;
           if(r!=null){
              rating = r.score;
           }
             println avgRating;
             def topics =  Topic.list();
              def curr_user = session.user;
              Float av_rating = 0.0;

                 av_rating= calculateAverageRatingForResource(resource);

         render(view:"../Frontend/post", model:[resId:resId, post_rating : rating, avgRating:av_rating, all_Topics: topics,curr_user: curr_user, curr_resource: resource]);
    }

    def save(){
         def rating = params.rating.toInteger();
         def resId = params.resId;
         Resources resource= Resources.findById(resId);
         Users user = session.user;
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

         // resource.save(flush: true)
         }
         if(r!=null){curr_res_rating=r;}
            // calculation of resource rating.
        def resourceId = curr_res_rating.resource.id
        //  println "resourceId is :" + resourceId;
    def rating_resource = Resources.get(resourceId)
    Float avgRating = calculateAverageRatingForResource(rating_resource);
         rating_resource.avgRating = avgRating
         rating_resource.save(flush:true, failOnError:true);
       println "resourceId is :" + avgRating;

         redirect(action: "show", params: [resId: resId,avgRating: avgRating]);
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

