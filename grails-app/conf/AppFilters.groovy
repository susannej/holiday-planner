class AppFilters {

    def filters = {
       //applies filter to all the controllers 
       loginCheck(controller: '*', action: '*') {
           before = {
               if (!session.user && (!actionName.equals('login') && !actionName.equals('authenticate'))) {
				   redirect(controller: "employee", action: "login")
				   return false
			   } else {
			   		return true
			   }
           }
       }
    }

}
