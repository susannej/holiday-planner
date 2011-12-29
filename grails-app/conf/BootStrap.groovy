import de.susannej.urlaub.Employee

class BootStrap {

    def init = { servletContext ->
		environments {
			development {
        def admin = new Employee(loginname:"admin", 
                             password:"admin", 
                             firstname:"Administrator", 
                             lastname:"admin",
							 admin: true)
        admin.save()
		
        def jdoe = new Employee(loginname:"jdoe", 
                            password:"jdoe", 
                            firstname:"John", 
                            lastname:"Doe")
        jdoe.save()
        
	  }
    }
    }
}
