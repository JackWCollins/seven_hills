class Admin::OpeningsController < AdminsController
	def new
		@opening = Opening.new
	end

	def create
		@opening = Opening.new(opening_params)
		@opening.date = DateTime.strptime(params[:opening][:date], "%m/%d/%Y")
		if @opening.save
			flash[:notice] = "Opening was created."
			redirect_to admin_openings_path
		else
			flash[:danger] = "Please fix the errors below."
			render :new
		end
	end

	def index
		@openings = Opening.all
	end

	private

	def opening_params
		params.require(:opening).permit(:instruction, :time)
	end
end