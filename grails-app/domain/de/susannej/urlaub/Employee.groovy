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
	char employed = 'Y'
	char admin = 'N'
	
	String toString() {
		lastname + ", " + firstname
	}
}
