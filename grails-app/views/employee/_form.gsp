<%@ page import="de.susannej.urlaub.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'admin', 'error')} required">
	<label for="admin">
		<g:message code="employee.admin.label" default="Admin" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="admin" required="" value="${fieldValue(bean: employeeInstance, field: 'admin')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'employed', 'error')} required">
	<label for="employed">
		<g:message code="employee.employed.label" default="Employed" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="employed" required="" value="${fieldValue(bean: employeeInstance, field: 'employed')}"/>
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

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'loginname', 'error')} ">
	<label for="loginname">
		<g:message code="employee.loginname.label" default="Loginname" />
		
	</label>
	<g:textField name="loginname" value="${employeeInstance?.loginname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="employee.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${employeeInstance?.password}"/>
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

