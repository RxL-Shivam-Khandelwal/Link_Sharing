package first_grails

class ProfileController {

    def index() {
         if(session.user_id ==null){
             render(template: "/templates/errorHandling");
         }else {
             def sub = Subscription.list();
             Users user = Users.findById(session.user.id);
             render(view: "../Frontend/edit_profile", model: [subscriptions: sub, user: user]);
         }
     }

     def change_pass(){
            
            Users user = Users.findById(session.user_id);
           user.password = params.password;     
            
    if (user.save(flush: true)) {
        // Invalidate the session
        session.invalidate()
        flash.message = "Save successful!"
    } else {
        // Handle errors if any
        flash.message = "Error updating password"
    }
         redirect(controller:"Login");
     }

     def change_profile(){
        Users user = Users.findById(session.user_id);
         user.username= params.username;
         user.firstName= params.firstName;
         user.lastName = params.lastName;
         user.photo = params.photo;

    if (user.save(flush: true)) {
        // Invalidate the session
        session.invalidate()
        flash.message = "Save successful!"
    } else {
        // Handle errors if any
        flash.message = "Error updating password"
    }
         redirect(controller:"Login");
     }
}
