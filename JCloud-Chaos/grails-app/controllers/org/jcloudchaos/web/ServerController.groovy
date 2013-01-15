package org.jcloudchaos.web

import grails.converters.JSON;

import org.jcloudchaos.web.domain.Job;
import org.jcloudchaos.web.domain.VirtualMachine;

class ServerController {

    def getVirtualMachinesForServer() {
			def jobInstance = Job.get(params.id)
			List<VirtualMachine> virtualMachines = jobInstance.listVms()
			render virtualMachines as JSON
	}
}
