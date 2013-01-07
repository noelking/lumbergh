package org.jcloudchaos.web.domain

class VirtualMachine {
	
	String hostName
	String templateId
	String templateName
	String description
	boolean ignore

    static constraints = {
		hostName blank: false
    }
}
