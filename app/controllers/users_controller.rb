class UsersController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "Thanks for registering!"
			redirect_to '/members'
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end