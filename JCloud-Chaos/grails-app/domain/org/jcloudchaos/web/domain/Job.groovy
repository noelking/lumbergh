package org.jcloudchaos.web.domain

import java.util.List

class Job {
	
	String name
	String jcloudsUrl
	List<VirtualMachine> machines

    static constraints = {
    }
}
