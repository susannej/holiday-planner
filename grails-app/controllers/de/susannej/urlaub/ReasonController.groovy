package de.susannej.urlaub

import org.springframework.dao.DataIntegrityViolationException

class ReasonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reasonInstanceList: Reason.list(params), reasonInstanceTotal: Reason.count()]
    }

    def create() {
        [reasonInstance: new Reason(params)]
    }

    def save() {
        def reasonInstance = new Reason(params)
        if (!reasonInstance.save(flush: true)) {
            render(view: "create", model: [reasonInstance: reasonInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'reason.label', default: 'Reason'), reasonInstance.id])
        redirect(action: "show", id: reasonInstance.id)
    }

    def show() {
        def reasonInstance = Reason.get(params.id)
        if (!reasonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reason.label', default: 'Reason'), params.id])
            redirect(action: "list")
            return
        }

        [reasonInstance: reasonInstance]
    }

    def edit() {
        def reasonInstance = Reason.get(params.id)
        if (!reasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reason.label', default: 'Reason'), params.id])
            redirect(action: "list")
            return
        }

        [reasonInstance: reasonInstance]
    }

    def update() {
        def reasonInstance = Reason.get(params.id)
        if (!reasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reason.label', default: 'Reason'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (reasonInstance.version > version) {
                reasonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reason.label', default: 'Reason')] as Object[],
                          "Another user has updated this Reason while you were editing")
                render(view: "edit", model: [reasonInstance: reasonInstance])
                return
            }
        }

        reasonInstance.properties = params

        if (!reasonInstance.save(flush: true)) {
            render(view: "edit", model: [reasonInstance: reasonInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'reason.label', default: 'Reason'), reasonInstance.id])
        redirect(action: "show", id: reasonInstance.id)
    }

    def delete() {
        def reasonInstance = Reason.get(params.id)
        if (!reasonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reason.label', default: 'Reason'), params.id])
            redirect(action: "list")
            return
        }

        try {
            reasonInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'reason.label', default: 'Reason'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reason.label', default: 'Reason'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
