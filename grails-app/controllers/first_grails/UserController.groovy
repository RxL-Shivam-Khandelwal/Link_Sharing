package first_grails
import grails.converters.JSON

class UserController {

    def index() { }

        def details(Long userId) {
        // Fetch user details based on userId
        def user = Users.get(userId)
        println user;

        if (user) {
            // Return user details as JSON response
            render(user as JSON)
        } else {
            // Handle error if user not found
            render(status: 404, text: "User not found")
        }
    }
}
