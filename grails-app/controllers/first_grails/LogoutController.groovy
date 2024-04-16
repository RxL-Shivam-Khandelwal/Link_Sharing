package first_grails

class LogoutController {

    def index() {
        session.invalidate();
        def resource = Resources.createCriteria().list {
            order('lastUpdated', 'desc')
        }
         def res_shares = Resources.list().reverse();

        render (view : "../Frontend/login", model:[resource:resource,res_shares:res_shares]);

     }
}
