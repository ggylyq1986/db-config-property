
<%@ page import="au.edu.uow.groovy.grails.plugins.cp.ConfigProperty" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="DBConfigPropertyUI.gsp">
		<g:set var="entityName" value="${message(code: 'configProperty.label', default: 'ConfigProperty')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-configProperty" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list configProperty">
			
				<g:if test="${configPropertyInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="configProperty.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${configPropertyInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configPropertyInstance?.key}">
				<li class="fieldcontain">
					<span id="key-label" class="property-label"><g:message code="configProperty.key.label" default="Key" /></span>
					
						<span class="property-value" aria-labelledby="key-label"><g:fieldValue bean="${configPropertyInstance}" field="key"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configPropertyInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="configProperty.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${configPropertyInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${configPropertyInstance?.id}" />
					<g:link class="edit" action="edit" id="${configPropertyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
