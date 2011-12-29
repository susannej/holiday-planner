package de.susannej.urlaub

class Reason {
	
	static hasMany = [vacations:Vacation]

    static constraints = {
    }
	
	int id
	String description
	Boolean needs_vac_desc
	
	String toString() {
		description
	}
}
