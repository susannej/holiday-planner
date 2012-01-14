package de.susannej.urlaub

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

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
	
	def singleMonth() {}
	
	def allMonth() {}
	
	def ownEvents() {
		long start = Long.parseLong(params.start) * 1000
		long end = Long.parseLong(params.end) * 1000
		
		log.error("in own Events / start = " + start)

		def startdate = new Date(start)
		def enddate = new Date(end)
		
		log.error("start = " + startdate.format("dd.MM.yyyy"))
		log.error("end = " + enddate.format("dd.MM.yyyy"))
		
		def events = [
			[
				id: 1,
				title: 'Schulung: Groovy und Grails',
				start: '2012-01-01',
				end: '2012-01-05',
				url: '/urlaubsplaner/vacation/1'
			],
			[
				id: 2,
				title: 'Urlaub',
				start: '2012-01-08',
				end: '2012-01-10',
				url: '/urlaubsplaner/vacation/2',
				color: 'green'
			],
			[
				id: 3,
				title: 'Krank',
				start: '2012-01-18',
				end: '2012-01-27',
				url: '/urlaubsplaner/vacation/3',
				color: 'yellow',
				textColor: 'black'
			],
			[
				id: 4,
				title: 'urlaub',
				start: '2012-01-29',
				end: '2012-02-03',
				url: '/urlaubsplaner/vacation/4',
				color: 'green'
			]
		]
		render events as JSON
	}
	
}
