class OpeningsController < ApplicationController

	def new
		@opening = Opening.new
	end
end