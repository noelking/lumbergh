package org.jcloudchaos.web

import org.jcloudchaos.web.domain.Job;

import grails.converters.JSON;

class JobRestController {

	def get() {
		def jobInstance = Job.get(params.id)
		render jobInstance as JSON
	}
}
