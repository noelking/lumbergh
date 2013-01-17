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
	String numberOfInstancesToDestroy
	
	static hasMany = [virtualMachines:VirtualMachine]
	
    static constraints = {
		name blank: false
		jcloudsUrl blank: false
		provider blank: false
		user blank: false
		key blank: false
		numberOfInstancesToDestroy blank: false
		
    }
	
	def listVms() {
		if("is Enough Info For Virtual Machine Available"()) {
			return "list Server Virtual Machines"();
		} else {
			return new ArrayList<VirtualMachine>();
		}
	}
	
	private boolean "is Enough Info For Virtual Machine Available"() {
		return true
	}
	
	def "list Server Virtual Machines"() {
		List<VirtualMachine> vms = new ArrayList<VirtualMachine>()
		
		ComputeService client = getComputeService()
		
		if(client != null) {
			
			for (ComputeMetadata node : client.listNodes()) {
				VirtualMachine vm = new VirtualMachine()
				
				NodeMetadata metadata = client.getNodeMetadata(node.getId());
				
				vm.setHostName(metadata.getName())
				vm.setImageId(metadata.getId())
				
				final Iterator privateAddresses = metadata.getPrivateAddresses().iterator();
				if(privateAddresses.hasNext())
					vm.setIpAddress(privateAddresses.next().toString())
				vm.setStatus(metadata.getStatus().toString())
				
				vms.add(vm)
			}
		}
		vms
	}
	
	def destroyAVirtualMachine(String id) {
		ComputeService client = getComputeService();
		client.destroyNode(id)
	}
	
	def "find Virtual Machines By Image Id"(String imageId) {
		
		ComputeService client = getComputeService()
		
		for (ComputeMetadata node : client.listNodes()) {
			VirtualMachine vm = new VirtualMachine()
			
			NodeMetadata metadata = client.getNodeMetadata(node.getId());
			
			vm.setHostName(metadata.getName())
			vm.setImageId(metadata.getId())
			vm.setIpAddress(metadata.getPrivateAddresses().iterator().next().toString())
			vm.setStatus(metadata.getStatus().toString())
			
			if(imageId.equals(metadata.getId())) {
				return vm
			}
		}
	}
	
	def getComputeService(){
			ComputeServiceContext context = ContextBuilder.newBuilder(provider)
					.endpoint(jcloudsUrl)
					.credentials(user, key)
					.buildView(ComputeServiceContext.class)
			ComputeService client = context.getComputeService()
			client
	}
	
	def destroyRandomInstances(){
		
		def killList = [] as List
		
		Random randomGenerator = new Random();
		System.out.println("instances String : " + numberOfInstancesToDestroy)
		
		Integer instances = new Integer(numberOfInstancesToDestroy)
		
		List<String> copiedList = new ArrayList<String>()
		copiedList.addAll(virtualMachines)
		
		System.out.println("instances: " + instances)
		while(instances > 0 && copiedList.size() > 0){
			System.out.println("instances: " + instances)
			
			int randomNode = -1
			
			randomNode = randomGenerator.nextInt(copiedList.size())
			
			System.out.println(copiedList.size() + " size  - random entry " + randomNode)
			System.out.println(copiedList)
			VirtualMachine machinetoKill = copiedList.get(randomNode)
			System.out.println(machinetoKill.getImageId())
			ComputeService client = getComputeService()
			client.destroyNode(machinetoKill.getImageId())
			killList.add(machinetoKill.getHostName())
			copiedList.remove(randomNode)
			instances = instances -1
		}
		killList
	}

	
}
