package first_grails

class LogoutController {
    DemoService demoService
    def index() {

       println  demoService.serviceMethod()
        session.invalidate();
         redirect(controller:"Login");
     }


}
