package de.susannej.urlaub

class Vacation {

    static constraints = {
		employee()
		reason()
		startdate()
		enddate()
		description()
		status()
    }
	
	Employee employee
	Date startdate
	Date enddate
	String description
	Reason reason
	Status status
	
	String toString() {
		startdate.toString() + " - " + enddate.toString() + " " + reason.toString() + ": " + description
	}
}
