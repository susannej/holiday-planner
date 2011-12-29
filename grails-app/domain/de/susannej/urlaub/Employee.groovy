package de.susannej.urlaub

class Employee {
	
	static hasMany = [vacations:Vacation]

    static constraints = {
    }
	
	int id
	String loginname
	String password
	String firstname
	String lastname
	Boolean employed = true
	Boolean admin = false
	Boolean approve = false
	
	String toString() {
		lastname + ", " + firstname
	}
}
