<%@ page import="de.susannej.urlaub.Vacation" %>


		<!-- FIXME !!!
			While editing a vacation, the actual status should be preselected!!!
		-->
		<script type="text/javascript">
			$(document).ready(function() {
				$("#reason").change(function() {
					$("#status").hide();
					$("#status").html("");
					var value = $("#reason").val();
					$.getJSON('/urlaubsplaner/status/statusForReasonAsJson',
						{
							reasonId: value
						},
						function(data) {
							$.each(data, function(key, value) {
								$("<option value='" + key + "'>" + value + "</option>").appendTo("#status");
							});
						}
					);
					$("#status").val(0);
					$("#status").show();
				});
				$("#reason").val(0);
				$("#reason").change();
			});
		</script>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="vacation.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${session.user.admin}">
		<g:select id="employee" name="employee.id" from="${de.susannej.urlaub.Employee.list()}" optionKey="id" required="" value="${vacationInstance?.employee?.id}" class="many-to-one"/>
	</g:if>
	<g:else>
		<label style="text-align: left">${session.user.firstname} ${session.user.lastname}</label>
		<input type="hidden" name="employee.id" value="${session.user.id}">
	</g:else>
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
		<g:message code="vacation.startdate.label" default="Startdate" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqDatePicker name="startdate" value="${vacationInstance?.startdate}"	displayFormat="dd.MM.yyyy" datepickerFormat="dd.mm.yy" />
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'enddate', 'error')} required">
	<label for="enddate">
		<g:message code="vacation.enddate.label" default="Enddate" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqDatePicker name="enddate" value="${vacationInstance?.enddate}"	displayFormat="dd.MM.yyyy" datepickerFormat="dd.mm.yy" />
</div>

<div class="fieldcontain ${hasErrors(bean: vacationInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="vacation.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${de.susannej.urlaub.Status.list()}" optionKey="id" required="" value="${vacationInstance?.status?.id}" class="many-to-one"/>
</div>

