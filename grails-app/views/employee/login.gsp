<%@ page import="de.susannej.urlaub.Employee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title>Login</title>
	</head>
	<body>
		<div id="edit-vacation" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.xxx" default="Login" /></h1>
      		<g:if test="${flash.message}">
        		<div class="message" role="status">${flash.message}</div>
      		</g:if>
      		<g:form action="authenticate" method="post" >
      			<fieldset class="form">
      	
					<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'loginname', 'error')} ">
						<label for="loginname">
							<g:message code="employee.login.label" default="Login" />
						</label>
						<g:field type="text" name="login" placeholder="Username" value="" autofocus="true"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} ">
						<label for="password">
							<g:message code="employee.password.label" default="Password" />
						</label>
						<g:field type="password" name="password" placeholder="Password" value=""/>
					</div>

				</fieldset>
				<fieldset class="buttons">
					<!-- g:actionSubmit class="save" action="Login" value="${message(code: 'default.button.login.label', default: 'Login')}" / -->
					<input class="save" type="submit" value="Login" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>