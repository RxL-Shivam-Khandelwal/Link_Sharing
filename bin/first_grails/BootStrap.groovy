//package first_grails
//
//class BootStrap {
//
//    def init = { servletContext ->
//    }
//    def destroy = {
//    }
//}


package first_grails

class BootStrap {

    def init = { servletContext ->
        // Check if an admin user already exists
        def adminUser = Users.findByAdmin(true)

        if (!adminUser) {
            // Create admin user if it doesn't exist
            def admin = new Users(
                    email: "shivam.kh007@gmail.com",
                    username: "admin",
                    password: "password",
                    firstName: "Shivam",
                    lastName: "Khandelwal",
                    admin: true
            )

            admin.save(failOnError: true)
        }
    }

    def destroy = {
    }
}
