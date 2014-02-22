Fabricator(:reservation) do
	reservation_date { DateTime.new(2015,2,3) }
	reservation_time { DateTime.now.to_time }
end