<%@ page import="de.susannej.urlaub.Reason" %>



<div class="fieldcontain ${hasErrors(bean: reasonInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="reason.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${reasonInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reasonInstance, field: 'needs_vac_desc', 'error')} required">
	<label for="needs_vac_desc">
		<g:message code="reason.needs_vac_desc.label" default="Needsvacdesc" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="needs_vac_desc" required="" value="${fieldValue(bean: reasonInstance, field: 'needs_vac_desc')}"/>
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

