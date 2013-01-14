package org.jcloudchaos.web.domain

import grails.converters.JSON;

import org.springframework.dao.DataIntegrityViolationException

class JobController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [jobInstanceList: Job.list(params), jobInstanceTotal: Job.count()]
    }


    def save() {
        def jobInstance = new Job(params)
        if (!jobInstance.save(flush: true)) {
            render(view: "list", model: [jobInstance: jobInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'job.label', default: 'Job'), jobInstance.id])
        redirect(uri: "#createJob")
    }
	
	def destroyAllMonsters = {
		
		def jobId = params.jobId
		def imageId = params.imageId
		
		Job jobInstance = Job.get(jobId)
		jobInstance.destroyAVirtualMachine(imageId)
		
		redirect action:"list"
	}
	
	def destroyRandomInstances() {
		
	   def jobId = params.jobId
	   Job jobInstance = Job.get(jobId)
	   jobInstance.destroyRandomInstances()
	   redirect action:"list"
   }

}
