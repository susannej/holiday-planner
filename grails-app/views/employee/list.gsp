
<%@ page import="de.susannej.urlaub.Employee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-employee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="loginname" title="${message(code: 'employee.loginname.label', default: 'Loginname')}" />
					
						<g:sortableColumn property="lastname" title="${message(code: 'employee.lastname.label', default: 'Lastname')}" />
					
						<g:sortableColumn property="firstname" title="${message(code: 'employee.firstname.label', default: 'Firstname')}" />
					
						<g:sortableColumn property="employed" title="${message(code: 'employee.employed.label', default: 'Employed')}" />
					
						<g:sortableColumn property="admin" title="${message(code: 'employee.admin.label', default: 'Admin')}" />
					
						<g:sortableColumn property="approve" title="${message(code: 'employee.approve.label', default: 'Approve')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "loginname")}</g:link></td>
					
						<td>${fieldValue(bean: employeeInstance, field: "lastname")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "firstname")}</td>
					
						<td><g:checkBox name="needsVacDesc" value="${employeeInstance.employed}" onclick="return false" onkeydown="return false" /></td>
					
						<td><g:checkBox name="needsVacDesc" value="${employeeInstance.admin}" onclick="return false" onkeydown="return false" /></td>
					
						<td><g:checkBox name="needsVacDesc" value="${employeeInstance.approve}" onclick="return false" onkeydown="return false" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
