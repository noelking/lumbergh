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
	console.log('Output from save' + JSON.stringify(data));
}

function handleJobClick(row) {
		var selectedId = row.cells.item(0).firstChild.nodeValue;
		url = "/JCloud-Chaos/jobvirtualmachine?id="+ selectedId;
		ajaxCall('GET', url, finishedPost);
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
