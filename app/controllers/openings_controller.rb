class OpeningsController < ApplicationController
	def index
		@openings = Opening.open
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
end