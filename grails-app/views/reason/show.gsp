
<%@ page import="de.susannej.urlaub.Reason" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reason.label', default: 'Reason')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reason" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reason" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reason">
			
				<g:if test="${reasonInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="reason.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${reasonInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reasonInstance?.needs_vac_desc}">
				<li class="fieldcontain">
					<span id="needs_vac_desc-label" class="property-label"><g:message code="reason.needs_vac_desc.label" default="Needsvacdesc" /></span>
					
						<span class="property-value" aria-labelledby="needs_vac_desc-label"><g:formatBoolean boolean="${reasonInstance?.needs_vac_desc}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reasonInstance?.vacations}">
				<li class="fieldcontain">
					<span id="vacations-label" class="property-label"><g:message code="reason.vacations.label" default="Vacations" /></span>
					
						<g:each in="${reasonInstance.vacations}" var="v">
						<span class="property-value" aria-labelledby="vacations-label"><g:link controller="vacation" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reasonInstance?.id}" />
					<g:link class="edit" action="edit" id="${reasonInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
