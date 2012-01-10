
<%@ page import="de.susannej.urlaub.Employee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-employee" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list employee">
			
				<g:if test="${employeeInstance?.loginname}">
				<li class="fieldcontain">
					<span id="loginname-label" class="property-label"><g:message code="employee.loginname.label" default="Loginname" /></span>
					
						<span class="property-value" aria-labelledby="loginname-label"><g:fieldValue bean="${employeeInstance}" field="loginname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.employed}">
				<li class="fieldcontain">
					<span id="employed-label" class="property-label"><g:message code="employee.employed.label" default="Employed" /></span>
					
						<span class="property-value" aria-labelledby="employed-label"><g:formatBoolean boolean="${employeeInstance?.employed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="employee.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:formatBoolean boolean="${employeeInstance?.admin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.approve}">
				<li class="fieldcontain">
					<span id="approve-label" class="property-label"><g:message code="employee.approve.label" default="Approve" /></span>
					
						<span class="property-value" aria-labelledby="approve-label"><g:formatBoolean boolean="${employeeInstance?.approve}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.firstname}">
				<li class="fieldcontain">
					<span id="firstname-label" class="property-label"><g:message code="employee.firstname.label" default="Firstname" /></span>
					
						<span class="property-value" aria-labelledby="firstname-label"><g:fieldValue bean="${employeeInstance}" field="firstname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="employee.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${employeeInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="employee.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${employeeInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.vacations}">
				<li class="fieldcontain">
					<span id="vacations-label" class="property-label"><g:message code="employee.vacations.label" default="Vacations" /></span>
					
						<g:each in="${employeeInstance.vacations}" var="v">
						<span class="property-value" aria-labelledby="vacations-label"><g:link controller="vacation" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${employeeInstance?.id}" />
					<g:link class="edit" action="edit" id="${employeeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
