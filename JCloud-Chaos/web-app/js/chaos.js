function updateJobWithVirtualMachine(killVmCheckBox, jobId) {
	alert(createUpdateJobData(killVmCheckBox.value));
	
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