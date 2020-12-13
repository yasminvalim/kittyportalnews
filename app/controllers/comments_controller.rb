class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_comment , except: [:index, :new, :create]

  def index
    @comments = @post.comment.all
  end

  def new
    @comment = Comment.new
  end


  def edit
  end


  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'News was successfully created.' }

      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.post, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

    def set_comment
      @comment = comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

end
