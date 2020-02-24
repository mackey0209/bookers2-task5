class BookCommentsController < ApplicationController
	def create

		book_comment = BookComment.new(post_comment_params)
		book_comment.user_id = current_user.id
		book_comment.book_id = params[:book_id]
		book_comment.save
		redirect_to book_path(params[:book_id])
	end

	def destroy
		book_comment = BookComment.find(params[:id])
		book_comment.destroy
		redirect_back(fallback_location: root_path)

	end

	private
	def post_comment_params
	    params.require(:book_comment).permit(:comment)
	end

end
