package de.susannej.urlaub

class Vacation {

    static constraints = {
    }
	
	int id
	Employee employee
	Date startdate
	Date enddate
	String description
	Reason reason
	Boolean approved
	
	String toString() {
		startdate.toString() + " - " + enddate.toString() + " " + reason.toString() + ": " + description
	}
}
