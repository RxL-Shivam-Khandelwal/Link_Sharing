package demo


class AuthenticationInterceptor {
   public AuthenticationInterceptor(){
       match(controller: ['Topic', 'Profile', 'UserProfile', 'LinkResource','Post'])
    }
    boolean before() {
        def user = session.getAttribute('user_id')
        println "interceptor is working fine!!!"
        if (!user) {
            redirect(template:"templates/errorHandling");
            return false;
        }
        return true;
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
