FactoryBot.define do
	factory :comment do
		user 
		product
		rating 1
		body "abc"	 	
	end
end