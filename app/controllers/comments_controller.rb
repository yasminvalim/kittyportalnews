class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def index
    @comments = @post.comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }

      else
        format.html { redirect_to @comment.post, alert: 'Your comment cant be created.' }
      end
    end
  end

  def destroy
    @comment = if current_user.is_admin
                 Comment.find(params[:id])
               else
                 current_user.comments.find(params[:id])
               end
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.post, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
