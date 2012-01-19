package de.susannej.urlaub

class Status {
	
	static hasMany = [vacations: Vacation]

    static constraints = {
		orderId()
		description()
		onlyApprover()
		displayColor()
		textColor()
    }
	
	Integer orderId
	String description
	Boolean onlyApprover
	String displayColor
	String textColor
	
	String toString() {
		description
	}
}
