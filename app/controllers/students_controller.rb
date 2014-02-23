class StudentsController < ApplicationController
	def new
		@student = Student.new
	end

	def create
		@reservation = Reservation.find(params[:reservation_id])
		@student = Student.new(student_params)
		if @student.save
			flash[:success] = "You have been added to the reservation!"
			redirect_to reservation_path(@reservation)
		else
			flash[:danger] = "Please fix the errors below"
			render :new
		end
	end

	private

	def student_params
		params.require(:student).permit(:first_name, :last_name, :email, :phone, :age, :street_address, :city, :state, :notes)
	end
end