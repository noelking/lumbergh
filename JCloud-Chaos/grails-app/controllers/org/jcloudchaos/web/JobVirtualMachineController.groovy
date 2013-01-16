package org.jcloudchaos.web

import grails.converters.JSON;

import org.jcloudchaos.web.domain.Job;
import org.jcloudchaos.web.domain.VirtualMachine;

class JobVirtualMachineController {

    def addVirtualMachine() {
		Job jobInstance = Job.get(params.jobId);
		VirtualMachine virtualMachineInstance = jobInstance."find Virtual Machines By Image Id"(params.imageId);
		
		//currently saved instances
		List<VirtualMachine> virtualMachines = jobInstance.getVirtualMachines()
		
		if(virtualMachineInstance != null && !virtualMachines.contains(virtualMachineInstance)) {
			jobInstance.addToVirtualMachines(virtualMachineInstance)
			jobInstance.save(flush: true, failOnError:true)
		}
		render jobInstance as JSON
	}
	
	def deleteVirtualMachine(Long id) {
		def virtualMachineInstance = new VirtualMachine(params)
	}
	
	def getVirtualMachines() {
		def jobInstance = Job.get(params.id)
		def virtualMachines = jobInstance.listVms() 
		def jobMachines = jobInstance.getVirtualMachines()
		
		def runningMachines = virtualMachines.findAll { obj -> 
			obj.getStatus() == "RUNNING" || jobMachines.contains(obj)
		} 
		render runningMachines as JSON
	}
	
	def getSelectedVirtualMachines() {
		def jobInstance = Job.get(params.id)
		def virtualMachines = jobInstance.getVirtualMachines()
		render virtualMachines as JSON
	}
}
