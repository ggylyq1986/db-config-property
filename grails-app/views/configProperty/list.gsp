
<%@ page import="au.edu.uow.groovy.grails.plugins.cp.ConfigProperty" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="DBConfigPropertyUI.gsp">
		<g:set var="entityName" value="${message(code: 'configProperty.label', default: 'ConfigProperty')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-configProperty" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="sortable">
				<thead>
					<tr>
					
						<g:sortableColumn property="key" title="${message(code: 'configProperty.key.label', default: 'Key')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'configProperty.value.label', default: 'Value')}" />
						
						<g:sortableColumn property="description" title="${message(code: 'configProperty.description.label', default: 'Description')}" />
						
						<th class="sortable">Is In Config File</th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${configPropertyInstanceList}" status="i" var="configPropertyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configPropertyInstance.id}">${fieldValue(bean: configPropertyInstance, field: "key")}</g:link></td>
					
						<td>${fieldValue(bean: configPropertyInstance, field: "value")}</td>
						
						<td>${fieldValue(bean: configPropertyInstance, field: "description")}</td>
					
						<g:isInConfigFile properties="${properties}" pKey="${fieldValue(bean: configPropertyInstance, field: "key")}" ></g:isInConfigFile>
						
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configPropertyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
