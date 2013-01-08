class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "job", action:"/create")
		"500"(view:'/error')
		
		"/jobvirtualmachine"(controller: "jobVirtualMachine", parseRequest: true) {
			action = [DELETE: "deleteVirtualMachine", POST: "addVirtualMachine" , GET: "addVirtualMachine"]
		}
		
	}
}
