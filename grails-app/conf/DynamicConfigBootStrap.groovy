import org.codehaus.groovy.grails.commons.GrailsApplication

import com.dbconfig.ConfigProperty;
import com.dbconfig.ConfigPropertyService;

class DynamicConfigBootStrap {

	def configPropertyService
	def grailsApplication
	
    def init = {servletContext ->
		def config = grailsApplication.config.load.config.property
		def isLoadConfig = (config == null || config instanceof java.util.Map)? false : config
		
		if(isLoadConfig){
			grailsApplication.flatConfig.each {key, value ->
				configPropertyService.loadValues(key, value)
			}
		}
        
        ConfigProperty.list()*.updateConfigMap()
    }

    def destroy = {
    }
}
