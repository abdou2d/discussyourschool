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
			redirect_to @post, notice: "Erro ao divulgar a solução"
		end
	end

    def destroy
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	def upvote
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.upvote_by current_student
  		redirect_to @post
	end

    private

	def comment_params
		params.require(:comment).permit(:content, :anonymous)
	end

end
