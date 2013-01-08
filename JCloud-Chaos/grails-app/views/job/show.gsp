
<%@ page import="org.jcloudchaos.web.domain.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-job" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-job" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list job">
			
				<g:if test="${jobInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="job.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${jobInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.jcloudsUrl}">
				<li class="fieldcontain">
					<span id="jcloudsUrl-label" class="property-label"><g:message code="job.jcloudsUrl.label" default="Jclouds Url" /></span>
					
						<span class="property-value" aria-labelledby="jcloudsUrl-label"><g:fieldValue bean="${jobInstance}" field="jcloudsUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.provider}">
				<li class="fieldcontain">
					<span id="provider-label" class="property-label"><g:message code="job.provider.label" default="Provider" /></span>
					
						<span class="property-value" aria-labelledby="provider-label"><g:fieldValue bean="${jobInstance}" field="provider"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="job.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${jobInstance}" field="user"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.key}">
				<li class="fieldcontain">
					<span id="key-label" class="property-label"><g:message code="job.key.label" default="Key" /></span>
					
						<span class="property-value" aria-labelledby="key-label"><g:fieldValue bean="${jobInstance}" field="key"/></span>
					
				</li>
				</g:if>
				
				<li class="fieldcontain">
					<span id="numberOfInstancesToDestroy-label" class="property-label"><g:message code="job.numberOfInstancesToDestroy.label" default="No. Instances To Destroy" /></span>
					<span class="property-value" aria-labelledby="numberOfInstancesToDestroy-label"><g:fieldValue bean="${jobInstance}" field="numberOfInstancesToDestroy"/></span>
				
				</li>
				
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${jobInstance?.id}" />
					<g:link class="edit" action="edit" id="${jobInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
