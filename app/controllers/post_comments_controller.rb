class PostCommentsController < ApplicationController
  def create
  	book = Book.find(params[:book_id])
  	comment = current_user.post_comments.new(post_comment_params)
  	comment.book_id = book.id
    comment.user_id = current_user.id
  	comment.save
  	redirect_to book_path(book)
  end

  def new
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = PostComment.find(params[:id])
    comment.destroy
    redirect_to book_path(book), notice: "Comment was successfully deleted."

  end

  def update
    book = Book.find(params[:book_id])
    comment = PostComment.find(params[:id])
    comment.update(post_comment_params)
    redirect_to book_path(book), notice: "Comment was successfully updated."
  end


  def edit
    @book = Book.find(params[:book_id])
    @comment = PostComment.find(params[:id])
  end

  private
    def post_comment_params
    	params.require(:post_comment).permit(:user_id, :book_id, :comment)
    end
end




