class UsersController < ApplicationController

	def index
		if logged_in?
		  @posts = Post.all
		  @shifts = Shift.all
		else
			redirect_to login_path
		end
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