class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to '/members'
  	else
  		flash[:error] = "There is something wrong with your username or password."
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You've logged out"
  	redirect_to root_path
  end

end