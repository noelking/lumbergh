package org.jcloudchaos.web.domain

import org.jclouds.ContextBuilder;
import org.jclouds.compute.ComputeService;
import org.jclouds.compute.ComputeServiceContext;
import org.jclouds.compute.domain.ComputeMetadata;


class VirtualMachineController {

	def scaffold = true

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		List<VirtualMachine> vms = connectToClouds()
		[virtualMachineInstanceList: vms, virtualMachineInstanceTotal: vms.size()]
	}

	def connectToClouds(){
		
		List<VirtualMachine> vms = new ArrayList<VirtualMachine>()
		ComputeServiceContext context = ContextBuilder.newBuilder("cloudstack")
				.endpoint("http://172.18.48.180:8096/")
				.credentials("ABsn9xnC-DskZ__6cQm_XNhusUKWE-8jg4-yjP6CwGf_C_lxxaC1B8guNeUGZDY_kLMKsWYVHKTF3FjpYUdT2Q", "ABsn9xnC-DskZ__6cQm_XNhusUKWE-8jg4-yjP6CwGf_C_lxxaC1B8guNeUGZDY_kLMKsWYVHKTF3FjpYUdT2Q")
				.buildView(ComputeServiceContext.class)

		ComputeService client = context.getComputeService();
		
		for (ComputeMetadata node : client.listNodes()) {
			VirtualMachine vm = new VirtualMachine()
			vm.setHostName(node.getName())
			vm.setIgnore(false)
			vm.setDescription("adfadfsdf")
			vm.setTemplateId(node.getId())
			vm.setTemplateName("blah")
			vms.add(vm)
		}
		vms
	}
}
