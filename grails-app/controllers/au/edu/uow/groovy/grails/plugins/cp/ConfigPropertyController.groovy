package au.edu.uow.groovy.grails.plugins.cp

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ConfigPropertyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def properties = session["DBCfgProperties"]
		if(!properties){
			properties = ConfigurationHolder.flatConfig
			session.setAttribute("DBCfgProperties", properties)
		}
        [configPropertyInstanceList: ConfigProperty.list(params), configPropertyInstanceTotal: ConfigProperty.count(), properties : ConfigurationHolder.flatConfig]
    }

    def create() {
        [configPropertyInstance: new ConfigProperty(params)]
    }

    def save() {
        def configPropertyInstance = new ConfigProperty(params)
        if (!configPropertyInstance.save(flush: true)) {
            render(view: "create", model: [configPropertyInstance: configPropertyInstance])
            return
        }
		
		properties = ConfigurationHolder.flatConfig
		session.setAttribute("DBCfgProperties", properties)

        flash.message = message(code: 'default.created.message', args: [message(code: 'configProperty.label', default: 'ConfigProperty'), configPropertyInstance.id])
        redirect(action: "show", id: configPropertyInstance.id)
    }

    def show(Long id) {
        def configPropertyInstance = ConfigProperty.get(id)
        if (!configPropertyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configProperty.label', default: 'ConfigProperty'), id])
            redirect(action: "list")
            return
        }

        [configPropertyInstance: configPropertyInstance]
    }

    def edit(Long id) {
        def configPropertyInstance = ConfigProperty.get(id)
        if (!configPropertyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configProperty.label', default: 'ConfigProperty'), id])
            redirect(action: "list")
            return
        }

        [configPropertyInstance: configPropertyInstance]
    }

    def update(Long id, Long version) {
        def configPropertyInstance = ConfigProperty.get(id)
        if (!configPropertyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configProperty.label', default: 'ConfigProperty'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (configPropertyInstance.version > version) {
                configPropertyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'configProperty.label', default: 'ConfigProperty')] as Object[],
                          "Another user has updated this ConfigProperty while you were editing")
                render(view: "edit", model: [configPropertyInstance: configPropertyInstance])
                return
            }
        }

        configPropertyInstance.properties = params

        if (!configPropertyInstance.save(flush: true)) {
            render(view: "edit", model: [configPropertyInstance: configPropertyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'configProperty.label', default: 'ConfigProperty'), configPropertyInstance.id])
        redirect(action: "show", id: configPropertyInstance.id)
    }

    def delete(Long id) {
        def configPropertyInstance = ConfigProperty.get(id)
        if (!configPropertyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configProperty.label', default: 'ConfigProperty'), id])
            redirect(action: "list")
            return
        }

        try {
            configPropertyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'configProperty.label', default: 'ConfigProperty'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'configProperty.label', default: 'ConfigProperty'), id])
            redirect(action: "show", id: id)
        }
    }
}
