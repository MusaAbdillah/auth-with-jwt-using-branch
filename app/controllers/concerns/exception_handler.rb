module ExceptionHandler 
	extend ActiveSupport::Concern

	# define custom error subclasses, - rescue catches 'StandardErrors'
	class AuthenticationError < StandardError; end
	class MissingToken < StandardError; end
	class InvalidToken < StandardError; end

	included do 

		# define custom handler 
		rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
		rescue_from ExceptionHandler::AuthenticationError, with: :four_twenty_one
		rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
		rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

		rescue_from ActiveRecord::RecordNotFound do |e|
			json_response({ message: e.message}, :not_found)
		end

		private 
			# json response with message; status code 422 - unprocessable entity
			def four_twenty_two(e) 
				json_response({ message: e.message}, :unprocessable_entity)
			end

			# json response with message; status code  401 - unauthorized 
			def four_twenty_one(e)
				json_response({ message: e.message}, :unauthorized)
			end
	end
end