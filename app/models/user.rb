class User < ApplicationRecord
	# method for bcrypt
	has_secure_password
	# validate for presence field 
	validates_presence_of :name, :email, :password_digest
end
