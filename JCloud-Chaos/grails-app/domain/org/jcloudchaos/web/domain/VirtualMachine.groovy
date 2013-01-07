package org.jcloudchaos.web.domain

class VirtualMachine {
	
	boolean canKill
	String imageId
	String hostName
	String templateId
	String status
	String ipAddress

    static constraints = {
		hostName blank: false
    }
}
