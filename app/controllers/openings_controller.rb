class OpeningsController < ApplicationController
	before_action :require_member, only: [:find_roster, :search_roster, :roster]

	def index
		@openings = Opening
	end

	def show
		@opening = Opening.find(params[:id])
	end

	def find_reservation
		@student = Student.find(params[:student_id])
	end

	def save_reservation
		@opening = Opening.find(params[:opening_id])
		@student = Student.find(params[:student_id])
		@opening.student_id = @student.id
		@opening.reserved = true
		if @opening.save
			flash[:notice] = "You've been added to the reservation"
			redirect_to reservation_path(@student.reservations.last)
		else
			flash[:danger] = "Something went wrong. Please try again"
			render :search
		end
	end

	def search
		@student = Student.find(params[:student_id])
		@openings = Opening.search_by_date(params[:date]).open
	end

	def find_roster
	end

	def roster
		@date = params[:date]
		@openings = Opening.search_by_date(@date)
		@tandem_openings = @openings.tandem.reserved
		@iad_openings = @openings.iad.reserved
		@unfilled_openings = @openings.open
	end
end