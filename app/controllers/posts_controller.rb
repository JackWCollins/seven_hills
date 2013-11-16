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
	end

	def update
	end

  private

  def post_params
  	params.require(:post).permit!
  end

end