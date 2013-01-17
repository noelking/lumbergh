package org.jcloudchaos.web

import org.jcloudchaos.web.domain.Job;

import grails.converters.JSON;

class JobRestController {

	def get() {
		def jobInstance = Job.get(params.id)
		render jobInstance as JSON
	}
	
	def destroyRandomInstances() {
		def jobId = params.jobId
		if(jobId!= null) {
			Job jobInstance = Job.get(jobId)
			def killList = jobInstance.destroyRandomInstances()
			System.out.println(">>>>>>>>>>>> ####"+killList);
			return  killList as JSON
		}
	}
	
}
