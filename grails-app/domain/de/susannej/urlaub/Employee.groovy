package de.susannej.urlaub

class Employee {
	
	static hasMany = [vacations:Vacation]

    static constraints = {
    }
	
	int id
	String firstname
	String lastname
	char employed
	char admin
	
	String toString() {
		lastname + ", " + firstname
	}
}
