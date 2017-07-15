class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment was created successfully'
      redirect_to @book
    else
      flash[:danger] = 'Comment can not created. Please try again!'
      redirect_to @book
    end
  end

  def edit
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
