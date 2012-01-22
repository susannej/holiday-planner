package de.susannej.urlaub

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class StatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [statusInstanceList: Status.list(params), statusInstanceTotal: Status.count()]
    }

    def create() {
        [statusInstance: new Status(params)]
    }

    def save() {
        def statusInstance = new Status(params)
        if (!statusInstance.save(flush: true)) {
            render(view: "create", model: [statusInstance: statusInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'status.label', default: 'Status'), statusInstance.id])
        redirect(action: "show", id: statusInstance.id)
    }

    def show() {
        def statusInstance = Status.get(params.id)
        if (!statusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'status.label', default: 'Status'), params.id])
            redirect(action: "list")
            return
        }

        [statusInstance: statusInstance]
    }

    def edit() {
        def statusInstance = Status.get(params.id)
        if (!statusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'status.label', default: 'Status'), params.id])
            redirect(action: "list")
            return
        }

        [statusInstance: statusInstance]
    }

    def update() {
        def statusInstance = Status.get(params.id)
        if (!statusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'status.label', default: 'Status'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (statusInstance.version > version) {
                statusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'status.label', default: 'Status')] as Object[],
                          "Another user has updated this Status while you were editing")
                render(view: "edit", model: [statusInstance: statusInstance])
                return
            }
        }

        statusInstance.properties = params

        if (!statusInstance.save(flush: true)) {
            render(view: "edit", model: [statusInstance: statusInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'status.label', default: 'Status'), statusInstance.id])
        redirect(action: "show", id: statusInstance.id)
    }

    def delete() {
        def statusInstance = Status.get(params.id)
        if (!statusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'status.label', default: 'Status'), params.id])
            redirect(action: "list")
            return
        }

        try {
            statusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'status.label', default: 'Status'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'status.label', default: 'Status'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def statusForReasonAsJson() {
		def reasonId = params.reasonId
		def reason = Reason.get(reasonId)
		
		def erg
		if (session.user.approve) {
			erg = Status.executeQuery("\
				select s.id, s.description \
				  from Status s \
				 where s.reason = :reason \
				 order by s.sortOrder",
				[reason: reason]
			)
		} else {
			erg = Status.executeQuery("\
				select s.id, s.description \
				  from Status s \
				 where s.reason = :reason \
				   and onlyApprover = false \
				 order by s.sortOrder",
				[reason: reason]
			)
		}
		
		def status = [:]
		
		for (record in erg) {
			status[record[0]] = record[1]
		}
		
		render status as JSON
	}
}
