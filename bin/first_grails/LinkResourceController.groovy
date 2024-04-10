package first_grails

class LinkResourceController {

    def index() { }


    def CreateLink(){

          try{
            // println "hello: ${params.userId}";
          Topic ctopic = Topic.findByName(params.topic);
          Users curr_user = Users.findById(session.user.id);
          println "topic is : ${curr_user.username}";
          Resources new_res = new Resources(description:params.description,user: curr_user,topic : ctopic, url: params.url);
          new_res.save(flush:true, failOnError:true);
           ReadingItem readingItem = new ReadingItem(resource:new_res,user: curr_user,isRead: false);
           readingItem.save(flush:true, failOnError:true);
                Long userId= curr_user.id;
                redirect(controller: "Register", action:"dashboard", params:[userId:userId]);

             
          }
          catch(Exception e){

             println e;
             render(view: "../register/create", model:[errors:e]);
          }


    } 
}
