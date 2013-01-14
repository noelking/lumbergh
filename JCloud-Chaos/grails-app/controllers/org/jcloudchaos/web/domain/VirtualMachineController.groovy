package org.jcloudchaos.web.domain

import org.jclouds.ContextBuilder
import org.jclouds.compute.ComputeService
import org.jclouds.compute.ComputeServiceContext
import org.jclouds.compute.domain.ComputeMetadata
import org.jclouds.compute.domain.NodeMetadata


class VirtualMachineController {
	def list() {
		params.max = Math.min(max ?: 10, 100)
		[virtualMachineInstanceList: VirtualMachine.list(), virtualMachineInstanceTotal: VirtualMachine.count()]
	}
}
