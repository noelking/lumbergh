package org.jcloudchaos.web.domain

class VirtualMachine {
	
	boolean canKill
	String imageId
	String hostName
	String status
	String ipAddress
	
	static belongsTo = [job:Job]

    static constraints = {
		hostName blank: false
    }
}
