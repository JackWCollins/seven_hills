module ApplicationHelper
	def display_day(dt)
		dt.strftime("%A, %B %d")
	end

	def display_time(dt)
		dt.strftime("%l:%M %p")
	end
end
