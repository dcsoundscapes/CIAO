FactoryBot.define do
	sequence(:name) { |n| "generic product no. #{n}" }

	factory :product do
		name # name { generate(:name) }
		description "generic description"
		
	end
end