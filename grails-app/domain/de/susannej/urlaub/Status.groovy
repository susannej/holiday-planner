package de.susannej.urlaub

class Status {
	
	static hasMany = [vacations: Vacation]

    static constraints = {
		orderId()
		description()
		onlyApprover()
		displayColor()
    }
	
	Integer orderId
	String description
	Boolean onlyApprover
	String displayColor
	
	String toString() {
		description
	}
}
