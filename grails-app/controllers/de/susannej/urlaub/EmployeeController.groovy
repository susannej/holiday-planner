package de.susannej.urlaub

import org.springframework.dao.DataIntegrityViolationException

class EmployeeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
		if (session.user.approve) {
			redirect(controller: "vacation", action: "openVacations")
		} else {
			redirect(controller: "vacation", action: "singleMonth")
		}
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [employeeInstanceList: Employee.list(params), employeeInstanceTotal: Employee.count()]
    }

    def create() {
        [employeeInstance: new Employee(params)]
    }

    def save() {
        def employeeInstance = new Employee(params)
        if (!employeeInstance.save(flush: true)) {
            render(view: "create", model: [employeeInstance: employeeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
        redirect(action: "show", id: employeeInstance.id)
    }

    def show() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "list")
            return
        }

        [employeeInstance: employeeInstance]
    }

    def edit() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "list")
            return
        }

        [employeeInstance: employeeInstance]
    }

    def update() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (employeeInstance.version > version) {
                employeeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'employee.label', default: 'Employee')] as Object[],
                          "Another user has updated this Employee while you were editing")
                render(view: "edit", model: [employeeInstance: employeeInstance])
                return
            }
        }

        employeeInstance.properties = params

        if (!employeeInstance.save(flush: true)) {
            render(view: "edit", model: [employeeInstance: employeeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
        redirect(action: "show", id: employeeInstance.id)
    }

    def delete() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "list")
            return
        }

        try {
            employeeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def login() {
	}
	
	def authenticate() {
		log.trace("in authenticate")
		def employee = Employee.findByLoginnameAndPassword(params.login, params.password)
		if (employee && employee.employed == true){
			log.info "User ${params.login} logged in"
			session.user = employee
			log.info("user-id = " + session.user.id)
			flash.message = "Hello ${employee.firstname} ${employee.lastname}!"
			redirect(controller:"employee", action:"index")
		} else {
			log.info "Login of ${params.login} rejected"
			flash.message = "Sorry, ${params.login}. Please try again."
			redirect(action:"login")
		}	
	}
	
	def logout() {
		flash.message = "Goodbye ${session.user.firstname} ${session.user.lastname}"
		log.info "User ${session.user.loginname} logged out"
		session.user = null
		redirect(controller:"employee", action:"login")
	}

	def profile() {
        def employeeInstance = Employee.get(session.user.id)
        if (!employeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "list")
            return
        }

        [employeeInstance: employeeInstance]
    }

}
