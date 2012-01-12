package de.susannej.urlaub

import org.springframework.dao.DataIntegrityViolationException

class VacationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def singleList() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [vacationInstanceList: Vacation.findAllByEmployee(session.user), vacationInstanceTotal: Vacation.count()]
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [vacationInstanceList: Vacation.list(params), vacationInstanceTotal: Vacation.count()]
    }

	def create() {
        [vacationInstance: new Vacation(params)]
    }

    def save() {
        def vacationInstance = new Vacation(params)
        if (!vacationInstance.save(flush: true)) {
            render(view: "create", model: [vacationInstance: vacationInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'vacation.label', default: 'Vacation'), vacationInstance.id])
        redirect(action: "show", id: vacationInstance.id)
    }

    def show() {
        def vacationInstance = Vacation.get(params.id)
        if (!vacationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacation.label', default: 'Vacation'), params.id])
            redirect(action: "list")
            return
        }

        [vacationInstance: vacationInstance]
    }

    def edit() {
        def vacationInstance = Vacation.get(params.id)
        if (!vacationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacation.label', default: 'Vacation'), params.id])
            redirect(action: "list")
            return
        }

        [vacationInstance: vacationInstance]
    }

    def update() {
        def vacationInstance = Vacation.get(params.id)
        if (!vacationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacation.label', default: 'Vacation'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (vacationInstance.version > version) {
                vacationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vacation.label', default: 'Vacation')] as Object[],
                          "Another user has updated this Vacation while you were editing")
                render(view: "edit", model: [vacationInstance: vacationInstance])
                return
            }
        }

        vacationInstance.properties = params

        if (!vacationInstance.save(flush: true)) {
            render(view: "edit", model: [vacationInstance: vacationInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'vacation.label', default: 'Vacation'), vacationInstance.id])
        redirect(action: "show", id: vacationInstance.id)
    }

    def delete() {
        def vacationInstance = Vacation.get(params.id)
        if (!vacationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacation.label', default: 'Vacation'), params.id])
            redirect(action: "list")
            return
        }

        try {
            vacationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'vacation.label', default: 'Vacation'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vacation.label', default: 'Vacation'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def openVacations() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[vacationInstanceList: Vacation.findAllByStatus(Status.get(2)), vacationInstanceTotal: Vacation.count()]
	}
	
}
