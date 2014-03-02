class Admin::OpeningsController < AdminsController
	def new
		@opening = Opening.new
	end

	def create
		@opening = Opening.new(opening_params)
		@opening.date = params[:opening][:date].nil? ? Time.now.to_date : DateTime.strptime(params[:opening][:date], "%m/%d/%Y") + 7.hours #Time zone offset
		if @opening.save
			flash[:notice] = "Opening was created."
			redirect_to admin_openings_path
		else
			flash[:danger] = "Please pick a date."
			render :new
		end
	end

	def index
		@openings = Opening.all
	end

	def show
		@opening = Opening.find(params[:id])
	end

	private

	def opening_params
		params.require(:opening).permit(:instruction, :time)
	end
end