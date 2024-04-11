package first_grails

class LogoutController {

    def index() {
        session.invalidate();
        def resource = Resources.list();
        render (view : "../Frontend/login", model:[resource:resource]);

     }
}
