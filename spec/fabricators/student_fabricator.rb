Fabricator(:student) do
	first_name { Faker::Name.first_name }
	last_name { Faker::Name.last_name }
	email { Faker::Internet.email }
	phone { Faker::PhoneNumber.phone_number }
	age { Faker::Number.number(2) }
	street_address { Faker::Address.street_address }
	city { Faker::Address.city }
	state { Faker::Address.state_abbr }
	notes { Faker::Lorem.paragraphs(1) }
end