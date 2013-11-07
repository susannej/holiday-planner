import de.susannej.urlaub.Employee
import de.susannej.urlaub.Reason
import de.susannej.urlaub.Status

class BootStrap {

    def init = { servletContext ->
		environments {
			development {
				def admin = new Employee(loginname:"admin", 
                             	password:"admin", 
								 firstname: "",
								 lastname:"Administrator",
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
		
				def urlaub = new Reason(description: "Urlaub", needsVacDesc: false)
				urlaub.save()
				def schulung = new Reason(description: "Schulung", needsVacDesc: true)
				schulung.save()	// blau
				def krank = new Reason(description: "Krank", needsVacDesc: false)
				krank.save()		// maroon
		
				(new Status(reason: schulung, sortOrder: 1, description: "Schulung", onlyApprover: false, displayColor: "blue", textColor: "white")).save()
				(new Status(reason: krank, sortOrder: 1, description: "Krank", onlyApprover: false, displayColor: "maroon", textColor: "white")).save()
				(new Status(reason: urlaub, sortOrder: 1, description: "notiert", onlyApprover: false, displayColor: "yellow", textColor: "black")).save()
				(new Status(reason: urlaub, sortOrder: 2, description: "beantragt", onlyApprover: false, toApprove: true, displayColor: "red", textColor: "white")).save()
				(new Status(reason: urlaub, sortOrder: 3, description: "genehmigt", onlyApprover: true, displayColor: "green", textColor: "white")).save()
				(new Status(reason: urlaub, sortOrder: 4, description: "abgelehnt", onlyApprover: true, displayColor: "black", textColor: "white")).save()
		
			}
			
			production {
				/*
				def admin = new Employee(loginname:"admin", 
                             	password:"admin", 
								 firstname: "",
								 lastname:"Administrator",
								 admin: true)
				admin.save()
		
				def urlaub = new Reason(description: "Urlaub", needsVacDesc: false)
				urlaub.save()
				def schulung = new Reason(description: "Schulung", needsVacDesc: true)
				schulung.save()	// blau
				def krank = new Reason(description: "Krank", needsVacDesc: false)
				krank.save()		// maroon
		
				(new Status(reason: schulung, sortOrder: 1, description: "Schulung", onlyApprover: false, displayColor: "blue", textColor: "white")).save()
				(new Status(reason: krank, sortOrder: 1, description: "Krank", onlyApprover: false, displayColor: "maroon", textColor: "white")).save()
				(new Status(reason: urlaub, sortOrder: 1, description: "notiert", onlyApprover: false, displayColor: "yellow", textColor: "black")).save()
				(new Status(reason: urlaub, sortOrder: 2, description: "beantragt", onlyApprover: false, toApprove: true, displayColor: "red", textColor: "white")).save()
				(new Status(reason: urlaub, sortOrder: 3, description: "genehmigt", onlyApprover: true, displayColor: "green", textColor: "white")).save()
				(new Status(reason: urlaub, sortOrder: 4, description: "abgelehnt", onlyApprover: true, displayColor: "black", textColor: "white")).save()
				*/
			}
		}
    }
}
