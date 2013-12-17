import au.edu.uow.groovy.grails.plugins.cp.ConfigProperty
import au.edu.uow.groovy.grails.plugins.cp.ConfigPropertyService
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class DynamicConfigBootStrap {

	def configPropertyService
	def grailsApplication
	
    def init = {servletContext ->
		def config = grailsApplication.config.load.config.property
		def isLoadConfig = (config == null || config instanceof java.util.Map)? false : config
		
		if(isLoadConfig){
			ConfigurationHolder.flatConfig.each {key, value ->
				configPropertyService.loadValues(key, value)
			}
		}
        
        ConfigProperty.list()*.updateConfigMap()
    }

    def destroy = {
    }
}
