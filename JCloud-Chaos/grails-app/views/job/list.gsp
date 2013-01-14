<%@ page import="org.jcloudchaos.web.domain.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
	  <section id="createJob">
      <div class="row">
        <div class="span4">
          <h2><em><i class="icon-bookmark"></i> Setup Job</em> <a class="up anchorLink" href="#home"><i class="icon-chevron-up"></i></a></h2>
        </div>
         <div class="span8">
          <h2><em><i class="icon-bookmark"></i> Available Jobs</em> <a class="up anchorLink" href="#home"><i class="icon-chevron-up"></i></a></h2>
        </div>
      </div>
      <div class="row">
        <div class="span4">
        
        <div class="well">
            <span class="dropcap">1</span>  <h3>Create a new job to test your architecture</h3>
            <hr>
        <br/>
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
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-red" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
         </div>
        </div><!--/span-->
        
        <div class="span8">
        
        <div class="well">
            <span class="dropcap">2</span>  <h3>Run Job</h3>
            <hr>
        	<br/>
        
        	<table> 
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'job.id.label', default: 'Id')}" />
						<g:sortableColumn property="name" title="${message(code: 'job.name.label', default: 'Name')}" />
						<g:sortableColumn property="provider" title="${message(code: 'job.provider.label', default: 'Provider')}" />
						<g:sortableColumn property="numberOfInstancesToDestroy" title="${message(code: 'job.numberOfInstancesToDestroy.label', default: 'No. Instances To Destroy')}" />
						<g:sortableColumn property="launch" title="Launch Tha'" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${jobInstanceList}" status="i" var="jobInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" onclick="handleJobClick(this)">
						<td>${fieldValue(bean: jobInstance, field: "id")}</td>
						<td><g:link action="show" id="${jobInstance.id}">${fieldValue(bean: jobInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: jobInstance, field: "provider")}</td>
						<td>${fieldValue(bean: jobInstance, field: "numberOfInstancesToDestroy")}</td>
						<td><g:link action="destroyRandomInstances" id="destroy ${jobInstance.id}"  params="[jobId:jobInstance.id]"><g:img file="rocket.png" style="width:50px"/></g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
         </div>
        </div><!--/span-->
        
      </div><!--/row-->
    </section>
	
	<section id="editJob">
      <div class="row">
        <div class="span12">
          <h2><em><i class="icon-bookmark"></i> Update Job Info</em> <a class="up anchorLink" href="#home"><i class="icon-chevron-up"></i></a></h2>
        </div>
      </div>
      <div class="row">
        <div class="span4">
        
        <div class="well" id="editJobForm">
            <span class="dropcap">3</span>  <h3>Change job settings</h3>
            <hr>
        	<br/>
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
			<g:form method="post">
				<g:hiddenField name="id" value="${jobInstance?.id}" />
				<g:hiddenField name="version" value="${jobInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-red"  action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="btn"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
        
         </div>
        </div><!--/span-->
        
        
        <div class="span8">
        
        <div class="well">
            <span class="dropcap">4</span>  <h3>Select the Virtual Machines that can be killed</h3>
            <hr>
        	<br/>
        
        	<table id="jobVirtualMachineTable">
				<thead>
					<tr>
						<g:sortableColumn property="canKill" title="${message(code: 'virtualMachine.canKill.label', default: 'Can Kill')}" />
						<g:sortableColumn property="hostName" title="${message(code: 'virtualMachine.hostName.label', default: 'Host Name')}" />
						<g:sortableColumn property="ipAddress" title="${message(code: 'virtualMachine.ipAddress.label', default: 'IP Address')}" />
						<g:sortableColumn property="status" title="${message(code: 'virtualMachine.status.label', default: 'Status')}" />
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			
        
         </div>
        </div><!--/span-->
        
      </div><!--/row-->
    </section>
    
    <section id="serverStatus">
      <div class="row">
        <div class="span12">
          <h2><em><i class="icon-bookmark"></i> Server Status</em> <a class="up anchorLink" href="#home"><i class="icon-chevron-up"></i></a></h2>
        </div>
      </div>
      <div class="row">
	
	 <div class="span12">
        
        <div class="well">
            <span class="dropcap">5</span>  <h3>Monitor server status</h3>
            <hr>
        	<br/>
        
        	<table id="serverStatusTable">
				<thead>
					<tr>
						
						<g:sortableColumn property="hostName" title="${message(code: 'virtualMachine.hostName.label', default: 'Host Name')}" />
						<g:sortableColumn property="ipAddress" title="${message(code: 'virtualMachine.ipAddress.label', default: 'IP Address')}" />
						<g:sortableColumn property="status" title="${message(code: 'virtualMachine.status.label', default: 'Status')}" />
						<g:sortableColumn property="Destroy" title="Destroy" />
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			
        
         </div>
        </div><!--/span-->
        
      </div><!--/row-->
    </section>
	
		
	</body>
</html>
