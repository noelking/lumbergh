function updateJobWithVirtualMachine(killVmCheckBox, jobId) {
	
	url = "/JCloud-Chaos/jobvirtualmachine"
	callback = "finishedPost"
	
	$.ajax({ 
		type: 'POST',
		url: url,
		data: createUpdateJobData(killVmCheckBox.value,jobId),
		success: finishedPost,
		dataType: "json",
		contentType: 'application/json',
		error: function(jqXHR, textStatus, errorThrown) {
            alert('hello' + jqXHR.reponseText + "\n"  + textStatus + "\n" + errorThrown);
        }
	});
}

function createUpdateJobData(id, jobId) {
    return JSON.stringify({"imageId":id, "jobId" : jobId});
}

function finishedPost(data) {
	alert('Output from save' + JSON.stringify(data));
}

function handleJobClick(row) {
		var selectedId = row.cells.item(0).firstChild.nodeValue;
		url = "/JCloud-Chaos/jobrest?id="+ selectedId;
		ajaxCall('GET', url, displayJob);
}

function displayJob(data) {
	populateEditJobForm(data);
	moveToEditJob();
	displayServerStatus(data.id);
}

function displayServerStatus(selectedId) {
	url = "/JCloud-Chaos/jobvirtualmachine?id="+ selectedId;
	ajaxCall('GET', url, populateTables);
}

function populateTables(data) {
	populateJobVMTable(data);
	populateServerStatusTable(data);
}

function populateEditJobForm(data) {
	$('div#editJobForm #id').val(data.id);
	$('div#editJobForm #version').val(data.version);
	
	$('div#editJobForm #name').val(data.name);
	$('div#editJobForm #jcloudsUrl').val(data.jcloudsUrl);
	$('div#editJobForm #provider').val(data.provider);
	$('div#editJobForm #user').val(data.user);
	$('div#editJobForm #key').val(data.key);
	$('div#editJobForm #numberOfInstancesToDestroy').val(data.numberOfInstancesToDestroy);
}

function moveToEditJob() {
	$('a#editFormLink').click();
}

function ajaxCall(type, url, callback) {
	$.ajax({ 
		type: type,
		url: url,
		data: null,
		success: callback,
		dataType: "json",
		contentType: 'application/json',
		error: function(jqXHR, textStatus, errorThrown) {
            alert('error ' + jqXHR.reponseText + "\n"  + textStatus + "\n" + errorThrown);
        }
	});
}

function populateJobVMTable(virtualMachines) {
	
	$('#jobVirtualMachineTable tbody > tr').remove();
	var tableBody = $('#jobVirtualMachineTable tbody');
	

	for(var currentVm = 0; currentVm < virtualMachines.length; currentVm++) {
		
		var virtualMachine = virtualMachines[currentVm];
		if(virtualMachine.status=='RUNNING') {
			var rowData = '<tr><td><input type="checkbox" name="killVm" onchange="updateJobWithVirtualMachine(this, '+virtualMachine.id+')"></input></td>';
			rowData += '<td>'+virtualMachine.hostName+'</td>';
			rowData += '<td>'+virtualMachine.ipAddress+'</td>';
			rowData += '<td>'+virtualMachine.status+'</td>';
			rowData += '<td></td></tr>';
			tableBody.append(rowData)
		}
	}
	
}

function populateServerStatusTable(virtualMachines) {
	
	$('#serverStatusTable tbody > tr').remove();
	var tableBody = $('#serverStatusTable tbody');
	
	for(var currentVm = 0; currentVm < virtualMachines.length; currentVm++) {
		
		var virtualMachine = virtualMachines[currentVm];
		var rowData = '<tr>';
		rowData += '<td>'+virtualMachine.hostName+'</td>';
		rowData += '<td>'+virtualMachine.ipAddress+'</td>';
		rowData += '<td>'+virtualMachine.status+'</td>';
		rowData += '</tr>';
		tableBody.append(rowData)
	}
	
}