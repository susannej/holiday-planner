package de.susannej.urlaub

class Status {
	
	static hasMany = [vacations: Vacation]

    static constraints = {
		reason()
		sortOrder()
		description()
		onlyApprover()
		toApprove()
		mailSupervisor()
		mailEmployee()
		displayColor()
		textColor()
    }
	
	Reason reason
	Integer sortOrder
	String description
	Boolean onlyApprover
	Boolean toApprove = false
	Boolean mailSupervisor = false
	Boolean mailEmployee = false
	String displayColor
	String textColor
	
	String toString() {
		description
	}
}
