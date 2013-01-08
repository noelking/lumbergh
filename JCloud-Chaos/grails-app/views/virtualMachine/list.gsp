
<%@ page import="org.jcloudchaos.web.domain.VirtualMachine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'virtualMachine.label', default: 'VirtualMachine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-virtualMachine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-virtualMachine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="hostName" title="${message(code: 'virtualMachine.hostName.label', default: 'Host Name')}" />
					
						<g:sortableColumn property="ipAddress" title="${message(code: 'virtualMachine.ipAddress.label', default: 'IP Address')}" />
						
						<g:sortableColumn property="status" title="${message(code: 'virtualMachine.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="Destroy" title="Destroy" />
							
					</tr>
				</thead>
				<tbody>
				<g:each in="${virtualMachineInstanceList}" status="i" var="virtualMachineInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${virtualMachineInstance.id}">${fieldValue(bean: virtualMachineInstance, field: "hostName")}</g:link></td>
					
						<td>${fieldValue(bean: virtualMachineInstance, field: "ipAddress")}</td>
						
						<td>${fieldValue(bean: virtualMachineInstance, field: "status")}</td>
					
						<td><g:link action="destroyAllMonsters" id="${virtualMachineInstance.id}"  params="[id:virtualMachineInstance.imageId]"><g:img file="bomb.png" style="width:50px"/></g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${virtualMachineInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
