Fabricator(:user) do
	first_name { Faker::Name.first_name }
	last_name { Faker::Name.last_name }
	password 'password'
	email { Faker::Internet.email }
	phone { Faker::PhoneNumber.phone_number }
	age { Faker::Number.number(2) }
	street_address { Faker::Address.street_address(include_secondary = false) }
	city { Faker::Address.city }
	state { Faker::Address.state }
end

Fabricator(:member, from: :user) do
	member true
end

Fabricator(:admin, from: :member) do
	admin true
end
