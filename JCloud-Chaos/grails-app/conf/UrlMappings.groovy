class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "job", action:"/list")
		"500"(view:'/error')
		
		"/jobvirtualmachine"(controller: "jobVirtualMachine", parseRequest: true) {
			action = [DELETE: "deleteVirtualMachine", POST: "addVirtualMachine" , GET: "get"]
		}
		
		"/jobrest"(controller: "jobRest", parseRequest: true) {
			action = [GET: "get"]
		}
		
	}
}
