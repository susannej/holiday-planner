package de.susannej.urlaub

class Employee {
	
	static hasMany = [vacations:Vacation]

    static constraints = {
		loginname()
		toString()
		employed()
		admin()
		approve()
		supervisor nullable:true
		email nullable:true
    }
	
	String loginname
	String password
	String firstname = null
	String lastname
	Employee supervisor
	Boolean employed = true
	Boolean admin = false
	Boolean approve = false
	String startView = "Month"
	String email
	
	String toString() {
		lastname + (firstname != null && firstname.length() > 0 ? ", " + firstname : "")
	}
}
