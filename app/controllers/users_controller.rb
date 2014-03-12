class UsersController < ApplicationController
	before_action :set_user, except: [:new, :create]


	def index
		if logged_in?
		  @posts = Post.all.sort_by{ |x| x.updated_at}.reverse
		  @shifts = Shift.all.sort_by{ |x| x.updated_at}.reverse
		else
			redirect_to reservations_home_path
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
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

	def set_member
	end

	def member_authentication
		if params[:member] == User::PASSWORD 
			@user.member = true
			if @user.save
			  flash[:notice] = "You are now saved as a member and have edit capabilities for the schedule."
			  redirect_to '/members'
			else
				flash[:error] = "Incorrect Password"
	  		redirect_to set_member_path
	  	end
  	end
	end

  private

  def set_user
  	@user = User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :age, :street_address, :city, :state)
  end

end