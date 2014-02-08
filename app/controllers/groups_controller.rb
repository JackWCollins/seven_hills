class GroupsController < ApplicationController
	def new
		if !logged_in?
			flash[:success] = "We need your contact information before creating a group. Please register below!"
			redirect_to register_path
		end
		@group = Group.new
	end
end