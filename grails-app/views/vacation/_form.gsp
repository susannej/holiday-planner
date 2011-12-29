<%@ page import="de.susannej.urlaub.Vacation" %>



<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'approved', 'error')} ">
	<label for="approved">
		<g:message code="vacation.approved.label" default="Approved" />
		
	</label>
	<g:checkBox name="approved" value="${vacationInstance?.approved}" />
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="vacation.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${vacationInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="vacation.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${de.susannej.urlaub.Employee.list()}" optionKey="id" required="" value="${vacationInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'enddate', 'error')} required">
	<label for="enddate">
		<g:message code="vacation.enddate.label" default="Enddate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="enddate" precision="day"  value="${vacationInstance?.enddate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'reason', 'error')} required">
	<label for="reason">
		<g:message code="vacation.reason.label" default="Reason" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reason" name="reason.id" from="${de.susannej.urlaub.Reason.list()}" optionKey="id" required="" value="${vacationInstance?.reason?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'startdate', 'error')} required">
	<label for="startdate">
		<g:message code="vacation.startdate.label" default="Startdate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startdate" precision="day"  value="${vacationInstance?.startdate}"  />
</div>

