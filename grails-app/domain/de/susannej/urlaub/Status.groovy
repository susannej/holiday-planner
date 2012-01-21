package de.susannej.urlaub

class Status {
	
	static hasMany = [vacations: Vacation]

    static constraints = {
		reason()
		sortOrder()
		description()
		onlyApprover()
		displayColor()
		textColor()
    }
	
	Reason reason
	Integer sortOrder
	String description
	Boolean onlyApprover
	String displayColor
	String textColor
	
	String toString() {
		description
	}
}
