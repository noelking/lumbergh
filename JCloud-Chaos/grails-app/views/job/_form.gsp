<%@ page import="org.jcloudchaos.web.domain.Job" %>



<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'jcloudsUrl', 'error')} ">
	<label for="jcloudsUrl">
		<g:message code="job.jcloudsUrl.label" default="Jclouds Url" />
		
	</label>
	<g:textField name="jcloudsUrl" value="${jobInstance?.jcloudsUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="job.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${jobInstance?.name}"/>
</div>

