package de.susannej.urlaub

class Reason {
	
	static hasMany = [vacations:Vacation]

    static constraints = {
    }
	
	String description
	Boolean needsVacDesc
	
	String toString() {
		description
	}
}
