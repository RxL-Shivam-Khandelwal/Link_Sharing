package first_grails

class PostController {

    def index() { }

    def show(Long resId){

            println "value isdofdsfdsif " + resId;
            Resources resource = Resources.findById(resId);
            Users user = Users.findById(session.user.id);
            ResourceRating r= ResourceRating.findByUserAndResource(user, resource);
            def rating = 0;
           if(r!=null){
              rating = r.score;
           }
          println "rating is : " + rating;
         render(view:"../Frontend/post", model:[resId:resId, post_rating : rating]);
    }

    def save(){
         def rating = params.rating.toInteger();
         def resId = params.resId;
         Resources resource= Resources.findById(resId);
         Users user = session.user;
         ResourceRating r= ResourceRating.findByUserAndResource(user, resource);
         if(r!=null){
            r.score = rating;
            r.save();
         redirect(action: "show", params: [resId: resId]);
         }
         else{
         ResourceRating curr_res_rating= new ResourceRating();
         curr_res_rating.resource= resource;
         curr_res_rating.user= user;
         curr_res_rating.score= rating;
          println "rating is : " + rating + "score is :" + curr_res_rating.score;
         curr_res_rating.save(flush:true, failOnError:true);
         redirect(action: "show", params: [resId: resId]);
         }
    }
         
       
    }

