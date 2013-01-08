
<%@ page import="org.jcloudchaos.web.domain.VirtualMachine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'virtualMachine.label', default: 'VirtualMachine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-virtualMachine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-virtualMachine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list virtualMachine">
			
				<g:if test="${virtualMachineInstance?.hostName}">
				<li class="fieldcontain">
					<span id="hostName-label" class="property-label"><g:message code="virtualMachine.hostName.label" default="Host Name" /></span>
					
						<span class="property-value" aria-labelledby="hostName-label"><g:fieldValue bean="${virtualMachineInstance}" field="hostName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${virtualMachineInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="virtualMachine.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${virtualMachineInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${virtualMachineInstance?.ignore}">
				<li class="fieldcontain">
					<span id="ignore-label" class="property-label"><g:message code="virtualMachine.ignore.label" default="Ignore" /></span>
					
						<span class="property-value" aria-labelledby="ignore-label"><g:formatBoolean boolean="${virtualMachineInstance?.ignore}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${virtualMachineInstance?.id}" />
					<g:link class="edit" action="edit" id="${virtualMachineInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
