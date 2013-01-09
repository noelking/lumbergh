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
	
	var selectedId = data.id;
	url = "/JCloud-Chaos/jobvirtualmachine?id="+ selectedId;
	ajaxCall('GET', url, finishedPost);
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
