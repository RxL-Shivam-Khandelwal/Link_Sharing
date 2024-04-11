package first_grails

class DocumentResourceController {

    def index() { }


    def documentRes(){

                  try{
            // println "hello: ${params.userId}";
          Topic ctopic = Topic.findByName(params.topic);
          Users curr_user = Users.findById(session.user.id);
          println "topic is : ${ctopic}";
          Resources new_res = new Resources(description:params.description,user: curr_user,topic : ctopic, documentResource: params.documentResource);
        new_res.save(flush:true, failOnError:true);
                def res = Resources.list();
                def topics = Topic.list();
             redirect(controller:"Register", actions:"dashboard", params:[userId:curr_user.id]);
          }
          catch(Exception e){

             println e;
             render(view: "../register/create", model:[errors:e]);
          }

    }
}
