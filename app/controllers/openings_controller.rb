class OpeningsController < ApplicationController
	def index
		@openings = Opening.all
	end

	def show
		@opening = Opening.find(params[:id])
	end

	def find_reservation
		#@student = Student.find(params[:student_id])
	end

	def save_reservation

	end

	def search
		@openings = Opening.search_by_date(params[:date])
		respond_to do |format|
      format.html
      format.js
    end
	end
end