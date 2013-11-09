<%@ page import="de.susannej.urlaub.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'reason', 'error')} required">
	<label for="reason">
		<g:message code="status.reason.label" default="Reason" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reason" name="reason.id" from="${de.susannej.urlaub.Reason.list()}" optionKey="id" required="" value="${statusInstance?.reason?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'sortOrder', 'error')} required">
	<label for="sortOrder">
		<g:message code="status.sortOrder.label" default="Sort Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="sortOrder" required="" value="${fieldValue(bean: statusInstance, field: 'sortOrder')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="status.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${statusInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'onlyApprover', 'error')} ">
	<label for="onlyApprover">
		<g:message code="status.onlyApprover.label" default="Only Approver" />
		
	</label>
	<g:checkBox name="onlyApprover" value="${statusInstance?.onlyApprover}" />
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'toApprove', 'error')} ">
	<label for="toApprove">
		<g:message code="status.toApprove.label" default="To Approve" />
		
	</label>
	<g:checkBox name="toApprove" value="${statusInstance?.toApprove}" />
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'mailSupervisor', 'error')} ">
	<label for="mailSupervisor">
		<g:message code="status.mailSupervisor.label" default="Mail Supervisor" />
		
	</label>
	<g:checkBox name="mailSupervisor" value="${statusInstance?.mailSupervisor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'mailEmployee', 'error')} ">
	<label for="mailEmployee">
		<g:message code="status.mailEmployee.label" default="Mail Employee" />
		
	</label>
	<g:checkBox name="mailEmployee" value="${statusInstance?.mailEmployee}" />
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'displayColor', 'error')} ">
	<label for="displayColor">
		<g:message code="status.displayColor.label" default="Display Color" />
		
	</label>
	<g:textField name="displayColor" value="${statusInstance?.displayColor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'textColor', 'error')} ">
	<label for="textColor">
		<g:message code="status.textColor.label" default="Text Color" />
		
	</label>
	<g:textField name="textColor" value="${statusInstance?.textColor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'vacations', 'error')} ">
	<label for="vacations">
		<g:message code="status.vacations.label" default="Vacations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statusInstance?.vacations?}" var="v">
    <li><g:link controller="vacation" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vacation" action="create" params="['status.id': statusInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vacation.label', default: 'Vacation')])}</g:link>
</li>
</ul>

</div>

