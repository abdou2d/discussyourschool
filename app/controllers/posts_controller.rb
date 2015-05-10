class PostsController < ApplicationController
	autocomplete :school, :name, :full => true

	before_action :require_authentication_student, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_student_post, only: [:edit, :update]

	def index
		if student_signed_in?
			@posts = Post.where(school_name: current_student.school_name).all.order(:cached_weighted_score => :desc).page(params[:page]).per(8)
		elsif school_signed_in?
			@posts = Post.where(school_name: current_school.name).all.order(:cached_weighted_score => :desc).page(params[:page]).per(8)
		end
	end

	def show
		@post = Post.friendly.find(params[:id])
		@comments = @post.comments.order(:cached_weighted_score => :desc)
		@school = School.find_by(name: @post.school_name)
	end

	def new
		@post = current_student.posts.build
	end

	def create
		@post = current_student.posts.build(post_params)

		@post.school_name = current_student.school_name

		if @post.save
			redirect_to @post, notice: t('flash.notice.post_created_succesfully')
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: t('flash.notice.post_edited_succesfully')
		else
			render action: :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	def like
		@post = Post.find(params[:id])
		@post.liked_by current_student
  		redirect_to @post
	end

	def unlike
  		@post = Post.find(params[:id])
  		@post.unliked_by current_student

  		redirect_to @post
	end

	def close
		@post = Post.friendly.find(params[:id])
		@post.close_post = '1'
		@post.reopen_post = 0

		@post.save!

		redirect_to @post
	end

	def reopen
		@post = Post.friendly.find(params[:id])
		@post.close_post = '0'
		@post.reopen_post = '1'

		@post.save!

		redirect_to @post
	end

	private

	def set_student_post
		@post = current_student.posts.friendly.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :school_name, :anonymous, :close_post, :reopen_post)
	end
end
