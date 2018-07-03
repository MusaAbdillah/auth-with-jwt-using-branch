class User < ApplicationRecord
	# validate for presence field 
	validates_presence_of :name, :email, :password_digest
end
