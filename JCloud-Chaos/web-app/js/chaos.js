function updateJobWithVirtualMachine(killVmCheckBox) {
	alert( killVmCheckBox.value);
	
	$.post("jobvirtualmachine", { id: killVmCheckBox.value},
			  function(data) {
			    alert("Data Loaded: " + data);
			  });
}