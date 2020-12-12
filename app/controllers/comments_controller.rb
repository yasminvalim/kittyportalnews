class CommentsController < ApplicationController 
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_comment , except: [:index]
  
  def index
    @comments = comment.all
  end

 
  def show
  end

  
  def new
    @comment = comment.new
  end

 
  def edit
  end

 
  def create
    @comment = comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @news.save
        format.html { redirect_to @post_path(post), notice: 'News was successfully created.' }
       
      else
        format.html { render :new }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @posts_path, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

 
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post_path, notice: 'Comment was successfully destroyed.' }
    end
  end

  private
  
    def set_comment
      @comment = comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :references)
    end

end