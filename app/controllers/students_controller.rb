class StudentsController < ApplicationController
	def new
		@student = Student.new
		@reservation = Reservation.find(params[:reservation_id])
	end

	def create
		@reservation = Reservation.find(params[:reservation_id])
		@student = Student.new(student_params)
		if @student.save
			@reservation.students << @student
			redirect_to reserve_openings_path student_id: @student.id
		else
			flash[:danger] = "Please fix the errors below before proceeding."
			render :new
		end
	end

	private

	def student_params
		params.require(:student).permit(:first_name, :last_name, :email, :phone, :age, :street_address, :city, :state, :notes)
	end
end