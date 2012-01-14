package de.susannej.urlaub

class Employee {
	
	static hasMany = [vacations:Vacation]

    static constraints = {
		loginname()
		toString()
		employed()
		admin()
		approve()
    }
	
	String loginname
	String password
	String firstname
	String lastname
	Boolean employed = true
	Boolean admin = false
	Boolean approve = false
	String startView = "Month"
	
	String toString() {
		lastname + ", " + firstname
	}
}
