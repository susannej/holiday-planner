<%@ page import="de.susannej.urlaub.Reason" %>



<div class="fieldcontain ${hasErrors(bean: reasonInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="reason.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${reasonInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reasonInstance, field: 'needsVacDesc', 'error')} ">
	<label for="needsVacDesc">
		<g:message code="reason.needsVacDesc.label" default="Needs Vac Desc" />
		
	</label>
	<g:checkBox name="needsVacDesc" value="${reasonInstance?.needsVacDesc}" />
</div>

<div class="fieldcontain ${hasErrors(bean: reasonInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="reason.status.label" default="Status" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${reasonInstance?.status?}" var="s">
    <li><g:link controller="status" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="status" action="create" params="['reason.id': reasonInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'status.label', default: 'Status')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: reasonInstance, field: 'vacations', 'error')} ">
	<label for="vacations">
		<g:message code="reason.vacations.label" default="Vacations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${reasonInstance?.vacations?}" var="v">
    <li><g:link controller="vacation" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vacation" action="create" params="['reason.id': reasonInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vacation.label', default: 'Vacation')])}</g:link>
</li>
</ul>

</div>

