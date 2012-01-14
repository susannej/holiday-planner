<%@ page import="de.susannej.urlaub.Employee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			</ul>
		</div>
		<div id="edit-employee" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${employeeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${employeeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${employeeInstance?.id}" />
				<g:hiddenField name="version" value="${employeeInstance?.version}" />
				<fieldset class="form">
<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'loginname', 'error')} ">
	<label for="loginname">
		<g:message code="employee.loginname.label" default="Loginname" />
		
	</label>
	<g:textField name="loginname" value="${employeeInstance?.loginname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'firstname', 'error')} ">
	<label for="firstname">
		<g:message code="employee.firstname.label" default="Firstname" />
		
	</label>
	<g:textField name="firstname" value="${employeeInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastname', 'error')} ">
	<label for="lastname">
		<g:message code="employee.lastname.label" default="Lastname" />
		
	</label>
	<g:textField name="lastname" value="${employeeInstance?.lastname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="employee.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${employeeInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'startView', 'error')} ">
	<label for="startView">
		<g:message code="employee.startView.label" default="Start View" />
		
	</label>
	<g:select name="startView" from="${['List', 'Month']}" value="${employeeInstance?.startView}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'vacations', 'error')} ">
	<label for="vacations">
		<g:message code="employee.vacations.label" default="Vacations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeInstance?.vacations?}" var="v">
    <li><g:link controller="vacation" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vacation" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vacation.label', default: 'Vacation')])}</g:link>
</li>
</ul>

</div>

				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
