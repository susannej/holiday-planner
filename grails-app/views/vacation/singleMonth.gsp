
<%@ page import="de.susannej.urlaub.Vacation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacation.label', default: 'Vacation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'fullcalendar.css')}" type="text/css">
		<script type="text/javascript" src="${resource(dir: 'js', file: 'fullcalendar.js')}"></script>
		
	</head>
	<body>
		<a href="#list-vacation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="edit-vacation" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.xxx" default="eigene Urlaube" /></h1>
		</div>
		<div style="height: 20px">
		</div>

		<center>
		<div id="calendar" style="width: 80%"></div>
		</center>

		<script type="text/javascript">
			$(document).ready(function() {
				$("#calendar").fullCalendar({
					header: {
						left: 'prevYear prev today',
						center: 'title',
						right: 'next nextYear'
					},
					firstDay: 1,
					allDayDefault: true,
					editable: true,
					events: '/urlaubsplaner/vacation/ownEvents',
					error: function() {
						alert('Fehler bei der Verbindung zum Server!');
					}
				})
			});
		</script>
	</body>
</html>
