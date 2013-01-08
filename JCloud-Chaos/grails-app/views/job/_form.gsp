<%@ page import="org.jcloudchaos.web.domain.Job" %>



<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="job.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${jobInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'jcloudsUrl', 'error')} required">
	<label for="jcloudsUrl">
		<g:message code="job.jcloudsUrl.label" default="Jclouds Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="jcloudsUrl" required="" value="${jobInstance?.jcloudsUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'provider', 'error')} required">
	<label for="provider">
		<g:message code="job.provider.label" default="Provider" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="provider" required="" value="${jobInstance?.provider}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="job.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user" required="" value="${jobInstance?.user}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'key', 'error')} required">
	<label for="key">
		<g:message code="job.key.label" default="Key" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="key" required="" value="${jobInstance?.key}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'numberOfInstancesToDestroy', 'error')} required">
	<label for="key">
		<g:message code="job.numberOfInstancesToDestroy.label" default="No. Instances To Destroy" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numberOfInstancesToDestroy" required="" value="${jobInstance?.numberOfInstancesToDestroy}"/>
</div>


