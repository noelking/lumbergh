package org.jcloudchaos.web

import grails.converters.JSON;

import org.jcloudchaos.web.domain.Job;
import org.jcloudchaos.web.domain.VirtualMachine;

class JobVirtualMachineController {

    def addVirtualMachine() {
		Job jobInstance = Job.get(params.jobId);
		VirtualMachine virtualMachineInstance = jobInstance."find Virtual Machines By Image Id"(params.imageId);
		
		if(virtualMachineInstance != null) {
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
		List<VirtualMachine> virtualMachines = jobInstance.listVms()
		def runningMachines = virtualMachines.findAll { obj -> 
			obj.getStatus() == "RUNNING"
		}
		render runningMachines as JSON
	}
}
