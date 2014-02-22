class StudentsController < ApplicationController
	def new
		@student = Student.new
	end

	def create
		if logged_in?
			@group = Group.find(params[:group_id])
			@student = Student.new
			@student.attributes = @student.attributes.merge current_user.attributes.select { |user| @student.attributes.keys.include? user }
			if @student.save
				flash[:success] = "You've been added to the group!"
				redirect_to group_path(@group)
			else
				flash[:danger] = "Group could not be created. Please call the office for help."
				redirect_to group_path(@group)
			end
		else
		end
	end

	private

	def student_params
		params.require(:student).permit(:first_name, :last_name, :email, :phone, :age, :street_address, :city, :state, :notes)
	end
end