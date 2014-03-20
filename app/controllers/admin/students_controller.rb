class Admin::StudentsController < AdminsController
	def confirm
		@student = Student.find(params[:id])
		@student.update_column(:confirmed, true)
		redirect_to opening_path(@student.opening)
	end
end