class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]


	def index
		if logged_in?
		  @posts = Post.all.sort_by{ |x| x.updated_at}.reverse
		  @shifts = Shift.all.sort_by{ |x| x.updated_at}.reverse
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

	def show
	end

	def edit
	end

	def update
	end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end