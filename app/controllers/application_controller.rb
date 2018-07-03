class ApplicationController < ActionController::API
	include Response 
	include ExceptionHandler

	# callback before action 
	before_action :authorize_request 

	# attribute reader 
	attr_reader :current_user

	private 
		def authorize_request 
			@current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
		end
end
