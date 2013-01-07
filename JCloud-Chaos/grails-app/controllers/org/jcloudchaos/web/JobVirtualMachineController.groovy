package org.jcloudchaos.web

import org.jcloudchaos.web.domain.VirtualMachine;

class JobVirtualMachineController {

    def addVirtualMachine() {
		def virtualMachineInstance = new VirtualMachine(params)
	}
	
	def deleteVirtualMachine(Long id) {
		def virtualMachineInstance = new VirtualMachine(params)
		System.out.println(virtualMachineInstance);
	}
}
