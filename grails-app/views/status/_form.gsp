<%@ page import="de.susannej.urlaub.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'orderId', 'error')} required">
	<label for="orderId">
		<g:message code="status.orderId.label" default="Order Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="orderId" required="" value="${fieldValue(bean: statusInstance, field: 'orderId')}"/>
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

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'displayColor', 'error')} ">
	<label for="displayColor">
		<g:message code="status.displayColor.label" default="Display Color" />
		
	</label>
	<g:textField name="displayColor" value="${statusInstance?.displayColor}"/>
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

