<%@ page import="de.susannej.urlaub.Vacation" %>



<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="vacation.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${de.susannej.urlaub.Employee.list()}" optionKey="id" required="" value="${vacationInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'reason', 'error')} required">
	<label for="reason">
		<g:message code="vacation.reason.label" default="Reason" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reason" name="reason.id" from="${de.susannej.urlaub.Reason.list()}" optionKey="id" required="" value="${vacationInstance?.reason?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="vacation.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${vacationInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'startdate', 'error')} required">
	<label for="startdate">
		<g:message code="vacation.startdate.label" default="Startdate (DD/MM/YYYY)" />
		<span class="required-indicator">*</span>
	</label>
	<!-- g:jqDatePicker name="startdate" value="${vacationInstance?.startdate}"	displayFormat="dd.MM.yyyy" datepickerFormat="dd.mm.yy" / -->
	<g:jqDatePicker name="startdate" value="${vacationInstance?.startdate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'enddate', 'error')} required">
	<label for="enddate">
		<g:message code="vacation.enddate.label" default="Enddate (DD/MM/YYYY)" />
		<span class="required-indicator">*</span>
	</label>
	<!-- g:jqDatePicker name="enddate" value="${vacationInstance?.enddate}"	displayFormat="dd.MM.yyyy" datepickerFormat="dd.mm.yy" / -->
	<g:jqDatePicker name="enddate" value="${vacationInstance?.enddate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="vacation.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${de.susannej.urlaub.Status.list()}" optionKey="id" required="" value="${vacationInstance?.status?.id}" class="many-to-one"/>
</div>

