
var servers = new Array();

function updateJobWithVirtualMachine(jobId, imageId) {
	url = "/JCloud-Chaos/jobvirtualmachine";
	callback = "updatedJob";
	var jobData = createUpdateJobData(jobId, imageId);
	ajaxCall('POST', url, callback, jobData);
}

function createUpdateJobData(jobId, imageId) {
	return JSON.stringify({
		"imageId" : imageId,
		"jobId" : jobId
	});
}

function runJob(jobId) {
	url = "/JCloud-Chaos/jobrest";
	callback = "killAlert";
	var jobData = createRunJobData(jobId);
	ajaxCall('POST', url, callback, jobData);
}

function createRunJobData(jobId) {
	return JSON.stringify({
		"jobId" : jobId
	});
}

function killAlert(data) {
	alert('Kill');
	loadGritter('images/success.png', 'Kill success', data);
}

function updatedJob(data) {
	loadGritter('images/success.png', 'Job successfully updated', '<span class="stopped">'+data.name+'</span> has  been updated');
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
	
	requestJobServerData();
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
			var errorMessage = 'error ' + jqXHR.reponseText + " - " + textStatus + " - " + errorThrown;
			loadGritter('images/error.png', 'Application Error', errorMessage);
			
		}
	});
}

function updateJobVMList() {
	
	var jobId = $('#editJobForm form input#id').val();
	
	url = "/JCloud-Chaos/virtualMachineInfo?id=" + jobId;
	ajaxCall('GET', url, populateCanKillMachine, null)
}

function populateCanKillMachine(virtualMachines) {
	var rows = $('#jobVirtualMachineTable tbody > tr');
	
	for(var rowNum = 0; rowNum < rows.length; rowNum++) {
		
		var hostName = rows[rowNum].cells[1].firstChild.nodeValue;
		if(isHostSelected(virtualMachines,hostName)) {
			rows[rowNum].cells[0].firstChild.checked = true;
		}
	}
}

function isHostSelected(virtualMachines, hostName) {
	
	var hostCount = 0;
	for(var currentMachine = 0; currentMachine < virtualMachines.length; currentMachine++) {
		var machine = virtualMachines[currentMachine];
		if(hostName == machine.hostName)
			hostCount++;
	}
	return hostCount > 0
}

function requestJobServerData() {

	var jobId = $('#editJobForm form input#id').val();
	
	if(jobId != '') {
		var timeInMs = 10000
		var url = "/JCloud-Chaos/jobvirtualmachine?id=" + jobId
		$.ajax({
			type : 'GET',
			url : url,
			dataType : 'json',
			cache : false,
			data : null,
	
			success : function(data, textStatus) {
				populateJobVMTable(data);
				
				setTimeout(function() {
					requestJobServerData();
				}, timeInMs);
	
			},
	
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				var errorMessage = 'error ' + XMLHttpRequest.reponseText + " - " + textStatus + " - " + errorThrown;
				loadGritter('images/error.png', 'Application Error', errorMessage);
			}
	
		});
	}
}

function populateJobVMTable(virtualMachines) {

	$('#jobVirtualMachineTable tbody > tr').remove();
	var tableBody = $('#jobVirtualMachineTable tbody');

	var jobId = $('#editJobForm form input#id').val();

	for ( var currentVm = 0; currentVm < virtualMachines.length; currentVm++) {

		var virtualMachine = virtualMachines[currentVm];
		var rowStyle = getRowStyle(currentVm);
		var rowData = '<tr class="'
			+ rowStyle
			+ '"><td><input type="checkbox" name="killVm" onchange="updateJobWithVirtualMachine('
				+ jobId + ', \'' + virtualMachine.imageId
				+ '\')"></input></td>';
		rowData += '<td>' + virtualMachine.hostName + '</td>';
		rowData += '<td>' + virtualMachine.ipAddress + '</td>';
		rowData += '<td>' + virtualMachine.status + '</td>';
		rowData += '</tr>';
		tableBody.append(rowData);
		
	}
	
	updateJobVMList();

}

function populateServerStatusTable(virtualMachines) {

	$('#serverStatusTable tbody > tr').remove();
	var tableBody = $('#serverStatusTable tbody');

	for ( var currentVm = 0; currentVm < virtualMachines.length; currentVm++) {

		var virtualMachine = virtualMachines[currentVm];
		
		handleVirtualMachineStatus(virtualMachine);
		
		var rowStyle = getRowStyle(currentVm);
		var rowData = '<tr class="'
			+ rowStyle
			+ '">';
		rowData += '<td>' + virtualMachine.hostName + '</td>';
		rowData += '<td>' + virtualMachine.ipAddress + '</td>';
		rowData += '<td class='+getStatusStyle(virtualMachine.status)+'> ' + virtualMachine.status + '</td>';
		rowData += '<td><img src="'+getStoppedImage(virtualMachine.status)+'" width="25px"/></td></tr>';
		tableBody.append(rowData)
	}
}

function handleVirtualMachineStatus(virtualMachine) {
	if(virtualMachine.status != "RUNNING") {
		loadGritter('images/alert.png', 'Server down', '<span class="stopped">'+virtualMachine.hostName+'</span> is not running');
	}
}

function getRowStyle(currentVm) {
	if ((currentVm % 2) == 0)
		return 'even';
	else
		return 'odd'	
}

function getStatusStyle(status) {
	if(status != "RUNNING") 
		return 'stopped'
	return '';
}

function getStoppedImage(status) {
	if(status != "RUNNING") 
		return 'images/stopped.png'
	return 'images/stop.png';
}

function requestServerStatusData(selectedId) {

	var jobId = $('#editJobForm form input#id').val();
	
	if(jobId != '') {
		var timeInMs = 10000
		var url = "/JCloud-Chaos/server?id=" + selectedId
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
				var errorMessage = 'error ' + XMLHttpRequest.reponseText + " - " + textStatus + " - " + errorThrown;
				loadGritter('images/error.png', 'Application Error', errorMessage);
			}
	
		});
	}
}


function loadGritter(image, title, message) {
	
	$.gritter.add({
		title: title,
		text: message,
		image: image,
		sticky: false,
		fade_in_speed: 300, // how fast notifications fade in (string or int)
		fade_out_speed: 500, // how fast the notices fade out
		time: 3000
	});
}