<%@ page import="au.edu.uow.groovy.grails.plugins.cp.ConfigProperty" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="dbConfigPropertyUI.gsp">
		<g:set var="entityName" value="${message(code: 'configProperty.label', default: 'ConfigProperty')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-configProperty" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<ul class="errors">
				<li>${flash.message}</li>
			</ul>
			</g:if>
			<g:hasErrors bean="${configPropertyInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${configPropertyInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" class="columns" >
				<g:render template="form"/>
				<fieldset class="form-actions">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
