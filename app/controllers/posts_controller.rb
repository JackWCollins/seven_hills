class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def show
	end

	def create
		@post = Post.new(post_params)
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