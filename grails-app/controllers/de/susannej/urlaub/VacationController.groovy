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
		//[vacationInstanceList: Vacation.findAllByStatus(Status.get(2)), vacationInstanceTotal: Vacation.count()]
		[vacationInstanceList: Vacation.findAllByStatusInList(Status.findAllByToApprove(true)), vacationInstanceTotal: Vacation.count()]
	}
	
	def singleMonth() {}
	
	def allMonth() {}
	
	def ownEventsAsJson() {
		long start = Long.parseLong(params.start) * 1000
		long end = Long.parseLong(params.end) * 1000
		
		def startdate = new Date(start)
		def enddate = new Date(end)
		
		ArrayList events = new ArrayList();

		def erg = Vacation.executeQuery("\
			select v.id, e.lastname, e.firstname, r.description, v.description, v.startdate, v.enddate, s.displayColor, s.textColor \
			  from Employee e, Reason r, Status s, Vacation v \
			 where e = v.employee and r = v.reason and s = v.status and v.employee = :user \
			   and (v.startdate between :startdate and :enddate \
				    or v.enddate between :startdate and :enddate \
				    or v.startdate < :startdate and v.enddate > :enddate)",
			 [user: session.user, startdate: startdate, enddate: enddate]
		)
		
		for (record in erg) {
				def vacationTitle = record[3] + (record[4] ? ": " + record[4] : "")
				events.add(
					[
						id: record[0],
						title: vacationTitle,
						start: record[5].format("yyyy-MM-dd"),
						end: record[6].format("yyyy-MM-dd"),
						url: "/urlaubsplaner/vacation/edit/" + record[0],
						color: record[7],
						textColor: record[8]
					]
				)
		}

		render events as JSON
	}
	
	def allEventsAsJson() {
		long start = Long.parseLong(params.start) * 1000
		long end = Long.parseLong(params.end) * 1000
		
		def startdate = new Date(start)
		def enddate = new Date(end)
		
		ArrayList events = new ArrayList();

		def erg = Vacation.executeQuery("\
			select v.id, e.lastname, e.firstname, r.description, v.description, v.startdate, v.enddate, s.displayColor, s.textColor \
			  from Employee e, Reason r, Status s, Vacation v \
			 where e = v.employee and r = v.reason and s = v.status \
			   and (v.startdate between :startdate and :enddate \
				    or v.enddate between :startdate and :enddate \
				    or v.startdate < :startdate and v.enddate > :enddate)",
			 [startdate: startdate, enddate: enddate]
		)
		
		for (record in erg) {
				def vacationTitle = record[1] + (record[2] ? ", " + record[2] : "") + " - " + record[3] + (record[4] ? ": " + record[4] : "")
				events.add(
					[
						id: record[0],
						title: vacationTitle,
						start: record[5].format("yyyy-MM-dd"),
						end: record[6].format("yyyy-MM-dd"),
						url: "/urlaubsplaner/vacation/edit/" + record[0],
						color: record[7],
						textColor: record[8]
					]
				)
		}

		render events as JSON
	}
	
}
