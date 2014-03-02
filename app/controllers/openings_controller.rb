class OpeningsController < ApplicationController
	def index
		@openings = Opening.all
	end

	def show
		@opening = Opening.find(params[:id])
	end
end