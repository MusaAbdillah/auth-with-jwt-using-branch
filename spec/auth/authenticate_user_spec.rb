require "rails_helper"

RSpec.describe AuthenticateUser do 
	# create user 
	let(:user) { create(:user) }
	# valid request object 
	subject(:valid_request_obj) { described_class.new(user.email, user.password) }
	# invalid request object
	subject(:invalid_request_obj) { described_class.new("foo", "bar") }

	# test suite for AuthenticateUser#call 
	describe "#call" do 
		# return token when valid request 
		context "when valid credentials" do 
			it "returns an auth token" do
				token = valid_request_obj.call 
				expect(token).not_to be_nil 
			end
		end

		context "when invalid credentials" do
			it "raise an authentication error" do
				expect{ invalid_request_obj.call }.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/) 
			end 
		end
	end
end