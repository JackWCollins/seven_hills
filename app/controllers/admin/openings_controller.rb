class Admin::OpeningsController < AdminsController
	def new
		@opening = Opening.new
	end

	def create
		@opening = Opening.new(opening_params)
		@opening.date = params[:opening][:date].nil? ? Time.now.to_date : (DateTime.strptime(params[:opening][:date], "%m/%d/%Y")).to_date #Time zone offset
		if @opening.save
			flash[:notice] = "Opening on #{@opening.date.to_date} at #{@opening.time.strftime "%H:%M"} was created."
			redirect_to new_admin_opening_path
		else
			flash[:danger] = "Please pick a date."
			render :new
		end
	end

	def edit
		@opening = Opening.find(params[:id])
	end

	def update
		@opening = Opening.find(params[:id])
		if @opening.update(opening_params)
			flash[:notice] = "This opening was updated."
		  redirect_to opening_path(@opening)
		else
			flash[:danger] = "This opening could not be updated. Please delete and create a new one."
			render :edit
		end
	end

	def destroy
		opening = Opening.find(params[:id])
		opening.destroy
		flash[:notice] = "Opening was deleted."
		redirect_to openings_path
	end
	
	private

	def opening_params
		params.require(:opening).permit(:instruction, :time)
	end
end