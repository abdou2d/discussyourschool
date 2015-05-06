class PostsController < ApplicationController
	autocomplete :school, :name, :full => true

	before_action :require_authentication_student, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_post, only: [:show]
	before_action :set_student_post, only: [:edit, :update]

	def index
		@posts = Post.where(school_name: current_student.school_name).all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@post = current_student.posts.build
	end

	def create
		@post = current_student.posts.build(post_params)
		if @post.save
			redirect_to @post, notice: "Post criado com sucesso"
		else
			render action: :new
		end
	end

	def edit
		
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post editado com sucesso!"
		else
			render action: :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	

	private

	def set_student_post
		@post = current_student.posts.find(params[:id])
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :school_name)
	end
end