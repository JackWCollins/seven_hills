class ReservationsController < ApplicationController
	before_action :require_user, except: [:new]

  def home
  end

  def new
		if !logged_in?
			flash[:success] = "We need your contact information before creating a reservation. Please register below!"
			redirect_to register_path
		end
		@reservation = Reservation.new
	end

	def create
		@student = Student.new
		@student.attributes = @student.attributes.merge current_user.attributes.select { |user| @student.attributes.keys.include? user }
		@reservation = Reservation.new(reservation_params)
		@reservation.creator = current_user
		binding.pry
		@reservation.students << @student
		Group.transaction do
			begin
				@student.save!
				@reservation.save!
				flash[:notice] = "Group created! You have been added as the first skydiver in the group."
				redirect_to reservation_path(@reservation)
			rescue Exception => e
				flash[:danger] = "The group could not be created. Please try again. If the problem persists, please call the office."
				render :new
			end
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	private

	def reservation_params
		params.require(:reservation).permit(:instruction)
	end
end