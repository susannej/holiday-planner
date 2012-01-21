
<%@ page import="de.susannej.urlaub.Reason" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reason.label', default: 'Reason')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reason" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reason" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'reason.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="needsVacDesc" title="${message(code: 'reason.needsVacDesc.label', default: 'Needs Vac Desc')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reasonInstanceList}" status="i" var="reasonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reasonInstance.id}">${fieldValue(bean: reasonInstance, field: "description")}</g:link></td>
					
						<td><g:checkBox name="needsVacDesc" value="${reasonInstance?.needsVacDesc}" onclick="return false" onkeydown="return false" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reasonInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
