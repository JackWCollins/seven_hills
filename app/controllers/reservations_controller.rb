class ReservationsController < ApplicationController
	before_action :require_user, only: [:index]

  def home
  end

  def index
  	@reservations = Reservation.all
  end

  def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reservation_params)
		if @reservation.save!
			flash[:notice] = "Group created! You have been added as the first skydiver in the group."
			redirect_to reservation_path(@reservation)
		else
			flash[:danger] = "The group could not be created. Please try again. If the problem persists, please call the office."
			render :new
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def find
	end

	def search
		if @reservation = Reservation.find_by_id(params[:reservation_id])
		  redirect_to reservation_path(@reservation)
		else
			flash[:danger] = "Group not found. Please try again."
			render :find
		end
	end

	private

	def reservation_params
		params.require(:reservation).permit(:instruction)
	end
end