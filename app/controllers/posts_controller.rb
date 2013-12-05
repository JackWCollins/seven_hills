class PostsController < ApplicationController
  before_action :require_user, except: [:show]

	def new
		@post = Post.new
	end

	def show
	end

	def create
		@post = Post.new(post_params)
		@post.creator = current_user
		if @post.save
			flash[:notice] = "Your post was saved"
			redirect_to '/members'
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "Your post was updated"
			redirect_to members_path
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "Your post was deleted"
			redirect_to '/members'
		else
			render :edit
		end
	end

  private

  def post_params
  	params.require(:post).permit!
  end

end