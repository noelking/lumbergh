<%@ page import="org.jcloudchaos.web.domain.VirtualMachine" %>



<div class="fieldcontain ${hasErrors(bean: virtualMachineInstance, field: 'hostName', 'error')} required">
	<label for="hostName">
		<g:message code="virtualMachine.hostName.label" default="Host Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hostName" required="" value="${virtualMachineInstance?.hostName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: virtualMachineInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="virtualMachine.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${virtualMachineInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: virtualMachineInstance, field: 'ignore', 'error')} ">
	<label for="ignore">
		<g:message code="virtualMachine.ignore.label" default="Ignore" />
		
	</label>
	<g:checkBox name="ignore" value="${virtualMachineInstance?.ignore}" />
</div>

<div class="fieldcontain ${hasErrors(bean: virtualMachineInstance, field: 'templateId', 'error')} ">
	<label for="templateId">
		<g:message code="virtualMachine.templateId.label" default="Template Id" />
		
	</label>
	<g:textField name="templateId" value="${virtualMachineInstance?.templateId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: virtualMachineInstance, field: 'templateName', 'error')} ">
	<label for="templateName">
		<g:message code="virtualMachine.templateName.label" default="Template Name" />
		
	</label>
	<g:textField name="templateName" value="${virtualMachineInstance?.templateName}"/>
</div>

