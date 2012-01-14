import de.susannej.urlaub.Employee
import de.susannej.urlaub.Reason
import de.susannej.urlaub.Status

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
		
				def susannej = new Employee(loginname: "susannej",
								password: "susannej",
								firstname: "Susanne",
								lastname: "Jaeckel",
								admin: true,
								approve: true)
				susannej.save()
		
				(new Reason(description: "Urlaub", needsVacDesc: false)).save()
				(new Reason(description: "Schulung", needsVacDesc: true)).save()	// blau
				(new Reason(description: "Krank", needsVacDesc: false)).save()		// maroon
		
				(new Status(orderId: 1, description: "notiert", onlyApprover: false, displayColor: "yellow")).save()
				(new Status(orderId: 2, description: "beantragt", onlyApprover: false, displayColor: "red")).save()
				(new Status(orderId: 3, description: "genehmigt", onlyApprover: true, displayColor: "green")).save()
				(new Status(orderId: 4, description: "abgelehnt", onlyApprover: true, displayColor: "black")).save()
		
			}
		}
    }
}
