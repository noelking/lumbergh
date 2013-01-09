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
		System.out.println(jobInstance.virtualMachines.size() + "-->");
		render jobInstance as JSON
	}
	
	def deleteVirtualMachine(Long id) {
		System.out.println("deleteVirtualMachine");
		def virtualMachineInstance = new VirtualMachine(params)
		System.out.println(virtualMachineInstance);
	}
	
	def get() {
		System.out.println("id value " + params.id);
		def jobInstance = Job.get(params.id)
		System.out.println("vms size  " +  jobInstance.listVms().size())
		render jobInstance.listVms() as JSON
	}
}
