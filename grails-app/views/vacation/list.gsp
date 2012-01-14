
<%@ page import="de.susannej.urlaub.Vacation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacation.label', default: 'Vacation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vacation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<g:if test="${session.user.admin}">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</g:if>
			</ul>
		</div>
		<div id="list-vacation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="vacation.employee.label" default="Employee" /></th>
					
						<th><g:message code="vacation.reason.label" default="Reason" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'vacation.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="startdate" title="${message(code: 'vacation.startdate.label', default: 'Startdate')}" />
					
						<g:sortableColumn property="enddate" title="${message(code: 'vacation.enddate.label', default: 'Enddate')}" />
					
						<th><g:message code="vacation.status.label" default="Status" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vacationInstanceList}" status="i" var="vacationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${vacationInstance.id}">${fieldValue(bean: vacationInstance, field: "employee")}</g:link></td>
					
						<td>${fieldValue(bean: vacationInstance, field: "reason")}</td>
					
						<td>${fieldValue(bean: vacationInstance, field: "description")}</td>
					
						<td><g:formatDate date="${vacationInstance.startdate}" format="dd.MM.yyyy" /></td>
					
						<td><g:formatDate date="${vacationInstance.enddate}" format="dd.MM.yyyy" /></td>
					
						<td>${fieldValue(bean: vacationInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vacationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
