package first_grails

class LinkResourceController {

    def index() { }


    def CreateLink(){

          try{
            // println "hello: ${params.userId}";
          Topic ctopic = Topic.findByName(params.topic);
          Users curr_user = Users.findById(session.user.id);
          println "topic is : ${ctopic}";
          Resources new_res = new Resources(description:params.description,user: curr_user,topic : ctopic, url: params.url);
        new_res.save(flush:true, failOnError:true);
                def res = Resources.list();
                def topics = Topic.list();
                render(view:"../Frontend/dashboard.gsp", model:[resource : res, all_Topics :topics]);

          }
          catch(Exception e){

             println e;
             render(view: "../register/create", model:[errors:e]);
          }


    } 
}
