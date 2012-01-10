
<%@ page import="de.susannej.urlaub.Status" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'status.label', default: 'Status')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-status" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-status" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list status">
			
				<g:if test="${statusInstance?.orderId}">
				<li class="fieldcontain">
					<span id="orderId-label" class="property-label"><g:message code="status.orderId.label" default="Order Id" /></span>
					
						<span class="property-value" aria-labelledby="orderId-label"><g:fieldValue bean="${statusInstance}" field="orderId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="status.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${statusInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusInstance?.onlyApprover}">
				<li class="fieldcontain">
					<span id="onlyApprover-label" class="property-label"><g:message code="status.onlyApprover.label" default="Only Approver" /></span>
					
						<span class="property-value" aria-labelledby="onlyApprover-label"><g:formatBoolean boolean="${statusInstance?.onlyApprover}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusInstance?.displayColor}">
				<li class="fieldcontain">
					<span id="displayColor-label" class="property-label"><g:message code="status.displayColor.label" default="Display Color" /></span>
					
						<span class="property-value" aria-labelledby="displayColor-label"><g:fieldValue bean="${statusInstance}" field="displayColor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusInstance?.vacations}">
				<li class="fieldcontain">
					<span id="vacations-label" class="property-label"><g:message code="status.vacations.label" default="Vacations" /></span>
					
						<g:each in="${statusInstance.vacations}" var="v">
						<span class="property-value" aria-labelledby="vacations-label"><g:link controller="vacation" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${statusInstance?.id}" />
					<g:link class="edit" action="edit" id="${statusInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
