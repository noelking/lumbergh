<%@ page import="org.jcloudchaos.web.domain.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-job" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-job" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${jobInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${jobInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${jobInstance?.id}" />
				<g:hiddenField name="version" value="${jobInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		
		
		<div id="list-virtualMachine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="canKill" title="${message(code: 'virtualMachine.canKill.label', default: 'Can Kill')}" />
						
						<g:sortableColumn property="hostName" title="${message(code: 'virtualMachine.hostName.label', default: 'Host Name')}" />
					
						<g:sortableColumn property="ipAddress" title="${message(code: 'virtualMachine.ipAddress.label', default: 'IP Address')}" />
						
						<g:sortableColumn property="status" title="${message(code: 'virtualMachine.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="Destroy" title="Destroy" />
							
					</tr>
				</thead>
				<tbody>
				<g:each in="${jobInstance.listVms()}" status="i" var="virtualMachineInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<td> <input type="checkbox" name="killVm" value='${fieldValue(bean: virtualMachineInstance, field: "imageId")}' onchange="updateJobWithVirtualMachine(this, ${jobInstance?.id})"></input> </td>
						
						<td><g:link action="show" id="${virtualMachineInstance.id}">${fieldValue(bean: virtualMachineInstance, field: "hostName")}</g:link></td>
					
						<td>${fieldValue(bean: virtualMachineInstance, field: "ipAddress")}</td>
						
						<td>${fieldValue(bean: virtualMachineInstance, field: "status")}</td>
					
						<td><g:link action="destroyAllMonsters" id="${virtualMachineInstance.id}"  params="[imageId:virtualMachineInstance.imageId, jobId:jobInstance.id]"><g:img file="bomb.png" style="width:50px"/></g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
		</div>
		
	</body>
</html>
