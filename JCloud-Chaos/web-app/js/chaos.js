function updateJobWithVirtualMachine(jobId, imageId) {
	url = "/JCloud-Chaos/jobvirtualmachine";
	callback = "finishedPost";
	var jobData = createUpdateJobData(jobId, imageId);
	ajaxCall('POST', url, callback, jobData);
}

function createUpdateJobData(jobId, imageId) {
	return JSON.stringify({
		"imageId" : imageId,
		"jobId" : jobId
	});
}

function finishedPost(data) {
	alert('Output from save' + JSON.stringify(data));
}

function handleJobClick(row) {
	var selectedId = row.cells.item(0).firstChild.nodeValue;
	url = "/JCloud-Chaos/jobrest?id=" + selectedId;
	ajaxCall('GET', url, displayJob, null);
}

function displayJob(data) {
	populateEditJobForm(data);
	moveToEditJob();
	displayServerStatus(data.id);
}

function displayServerStatus(selectedId) {
	requestServerStatusData(selectedId)
	
	url = "/JCloud-Chaos/jobvirtualmachine?id=" + selectedId;
	ajaxCall('GET', url, populateJobVMTable, null);
}

function populateEditJobForm(data) {
	$('div#editJobForm #id').val(data.id);
	$('div#editJobForm #version').val(data.version);

	$('div#editJobForm #name').val(data.name);
	$('div#editJobForm #jcloudsUrl').val(data.jcloudsUrl);
	$('div#editJobForm #provider').val(data.provider);
	$('div#editJobForm #user').val(data.user);
	$('div#editJobForm #key').val(data.key);
	$('div#editJobForm #numberOfInstancesToDestroy').val(
			data.numberOfInstancesToDestroy);
}

function moveToEditJob() {
	$('a#editFormLink').click();
}

function ajaxCall(type, url, callback, data) {
	$.ajax({
		type : type,
		url : url,
		data : data,
		success : callback,
		dataType : "json",
		contentType : 'application/json',
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error ' + jqXHR.reponseText + "\n" + textStatus + "\n"
					+ errorThrown);
		}
	});
}

function populateJobVMTable(virtualMachines) {

	$('#jobVirtualMachineTable tbody > tr').remove();
	var tableBody = $('#jobVirtualMachineTable tbody');

	var jobId = $('#editJobForm form input#id').val();

	for ( var currentVm = 0; currentVm < virtualMachines.length; currentVm++) {

		var virtualMachine = virtualMachines[currentVm];
		if (virtualMachine.status == 'RUNNING') {
			var rowStyle = ((currentVm % 2) == 0 ? 'even' : 'odd');
			var rowData = '<tr><td><input  class="'
					+ rowStyle
					+ '" type="checkbox" name="killVm" onchange="updateJobWithVirtualMachine('
					+ jobId + ', \'' + virtualMachine.imageId
					+ '\')"></input></td>';
			rowData += '<td>' + virtualMachine.hostName + '</td>';
			rowData += '<td>' + virtualMachine.ipAddress + '</td>';
			rowData += '<td>' + virtualMachine.status + '</td>';
			rowData += '</tr>';
			tableBody.append(rowData)
		}
	}

}

function populateServerStatusTable(virtualMachines) {

	$('#serverStatusTable tbody > tr').remove();
	var tableBody = $('#serverStatusTable tbody');

	for ( var currentVm = 0; currentVm < virtualMachines.length; currentVm++) {

		var virtualMachine = virtualMachines[currentVm];
		var rowData = '<tr>';
		rowData += '<td>' + virtualMachine.hostName + '</td>';
		rowData += '<td>' + virtualMachine.ipAddress + '</td>';
		rowData += '<td>' + virtualMachine.status + '</td>';
		rowData += '<td></td></tr>';
		tableBody.append(rowData)
	}
}

function requestServerStatusData(selectedId) {

	var timeInMs = 5000
	var url = "/JCloud-Chaos/jobvirtualmachine?id=" + selectedId
	$.ajax({
		type : 'GET',
		url : url,
		dataType : 'json',
		cache : false,
		data : null,

		success : function(data, textStatus) {
			
			populateServerStatusTable(data);
			
			setTimeout(function() {
				requestServerStatusData(selectedId);
			}, timeInMs);

		},

		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert(textStatus);
		}

	});

}