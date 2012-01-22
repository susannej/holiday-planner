
<%@ page import="de.susannej.urlaub.Status" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'status.label', default: 'Status')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-status" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-status" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="status.reason.label" default="Reason" /></th>
					
						<g:sortableColumn property="sortOrder" title="${message(code: 'status.sortOrder.label', default: 'Sort Order')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'status.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="onlyApprover" title="${message(code: 'status.onlyApprover.label', default: 'Only Approver')}" />
					
						<g:sortableColumn property="toApprove" title="${message(code: 'status.toApprove.label', default: 'To Approve')}" />
					
						<g:sortableColumn property="displayColor" title="${message(code: 'status.displayColor.label', default: 'Display Color')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${statusInstanceList}" status="i" var="statusInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${statusInstance.id}">${fieldValue(bean: statusInstance, field: "reason")}</g:link></td>
					
						<td>${fieldValue(bean: statusInstance, field: "sortOrder")}</td>
					
						<td>${fieldValue(bean: statusInstance, field: "description")}</td>
					
						<td><g:checkBox name="onlyApprover" value="${statusInstance.onlyApprover}" onclick="return false" onkeydown="return false" /></td>
					
						<td><g:checkBox name="toApprove" value="${statusInstance.toApprove}" onclick="return false" onkeydown="return false" /></td>
					
						<td>${fieldValue(bean: statusInstance, field: "displayColor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${statusInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
