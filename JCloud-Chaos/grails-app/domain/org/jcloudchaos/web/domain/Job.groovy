package org.jcloudchaos.web.domain

import java.util.List

import org.jclouds.ContextBuilder;
import org.jclouds.compute.ComputeService;
import org.jclouds.compute.ComputeServiceContext;
import org.jclouds.compute.domain.ComputeMetadata;
import org.jclouds.compute.domain.NodeMetadata;

class Job {
	
	String name
	String jcloudsUrl
	String provider
	String user
	String key
	
	List<VirtualMachine> machinesToRunAgainst

    static constraints = {
		name blank: false
		jcloudsUrl blank: false
		provider blank: false
		user blank: false
		key blank: false
    }
	
	def listVms() {
		if("is Enough Info For Virtual Machine Available"()) {
			return "list Server Virtual Machines"();
		} else {
			System.out.println("Not enough info");
		}
	}
	
	private boolean "is Enough Info For Virtual Machine Available"() {
		return true
	}
	
	def "list Server Virtual Machines"() {
		
		List<VirtualMachine> vms = new ArrayList<VirtualMachine>()
		
		ComputeService client = getComputeService()
		
		for (ComputeMetadata node : client.listNodes()) {
			VirtualMachine vm = new VirtualMachine()
			
			NodeMetadata metadata = client.getNodeMetadata(node.getId());
			
			vm.setHostName(metadata.getName())
			vm.setImageId(metadata.getId())
			vm.setIpAddress(metadata.getPrivateAddresses().iterator().next().toString())
			vm.setStatus(metadata.getStatus().toString())
			
			vms.add(vm)
		}
		vms
	}
	
	def destroyAVirtualMachine(String id) {
		ComputeService client = getComputeService();
		client.destroyNode(id)
	}
	
	def getComputeService(){
		ComputeServiceContext context = ContextBuilder.newBuilder(provider)
				.endpoint(jcloudsUrl)
				.credentials(user, key)
				.buildView(ComputeServiceContext.class)

		ComputeService client = context.getComputeService()
		client
	}
	
}
