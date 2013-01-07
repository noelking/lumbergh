package org.jcloudchaos.web.domain

import org.springframework.dao.DataIntegrityViolationException
import org.jclouds.compute.*


class VirtualMachineController {
	
    def scaffold = true
	
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[virtualMachineInstanceList: VirtualMachine.list(params), virtualMachineInstanceTotal: VirtualMachine.count()]
	}
	
	def connectToClouds(){
		ComputeServiceContext context = new ComputeServiceContextFactory().cresateContext("terremark", user, password);
	}
}
