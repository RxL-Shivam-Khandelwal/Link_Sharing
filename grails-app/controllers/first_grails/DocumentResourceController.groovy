package first_grails
import org.springframework.http.HttpHeaders
import org.springframework.http.MediaType
class DocumentResourceController {

    def index() { }


    def documentRes(){

                  try{
            // println "hello: ${params.userId}";
          Topic ctopic = Topic.findByName(params.topic);
          Users curr_user = Users.findById(session.user.id);
          Resources new_res = new Resources(description:params.description,user: curr_user,topic : ctopic, documentResource: params.documentResource);
        new_res.save(flush:true, failOnError:true);
                      println "hello world";
                def res = Resources.list();
                def topics = Topic.list();
             redirect(controller:"Register", action:"dashboard");
          }
          catch(Exception e){
             println e;
             render(view: "../register/create", model:[errors:e]);
          }

    }

    def downloadFile(Long fileId) {
        def fileEntity = Resources.get(fileId)
        if (!fileEntity) {
            // Handle case where file is not found
            // Redirect or display error message
            return
        }

        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=${fileEntity.description}")
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE)
        response.setContentLength(fileEntity.documentResource.length)

        response.getOutputStream().write(fileEntity.documentResource)
        response.getOutputStream().flush()

        // Close the response output stream
        response.getOutputStream().close()

        // Render an empty response since the file has been downloaded
        render(contentType: "text/html", text: "")
    }
}
