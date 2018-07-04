FactoryBot.define do 
	factory :user do 
		name { Faker::Name.name }
		email "foo@bar"
		password "foobar"
	end
end