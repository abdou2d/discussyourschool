class CommentsController < ApplicationController

    def create
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.build(comment_params)

        if student_signed_in?
            @comment.student_id = current_student.id
		elsif school_signed_in?
            @comment.school_id = current_school.id
		end

		if @comment.save
			redirect_to post_path(@post)
		else
			redirect_to @post, alert: t('flash.alert.error_create_comment')
		end
	end

    def destroy
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	def like
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		
		if student_signed_in?
        	@comment.liked_by current_student
        elsif school_signed_in?
        	@comment.liked_by current_school
        end

  		redirect_to @post
	end

    def unlike
        @post = Post.find(params[:post_id])

        @comment = @post.comments.find(params[:id])
        if student_signed_in?
        	@comment.unliked_by current_student
        elsif school_signed_in?
        	@comment.unliked_by current_school
        end

        redirect_to @post
    end

    def liked_by_school
    	@post = Post.find(params[:post_id])

		@comment = @post.comments.find(params[:id])
		@comment.liked_by current_school

  		redirect_to @post
    end

    def unliked_by_school
    	@post = Post.find(params[:post_id])

        @comment = @post.comments.find(params[:id])
        @comment.unliked_by current_school

        redirect_to @post
    end

    private

	def comment_params
		params.require(:comment).permit(:content, :anonymous)
	end

end
