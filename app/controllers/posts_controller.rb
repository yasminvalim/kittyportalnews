class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all.order(created_at: :desc).page params[:page]
  end

  def show
    @comment = Comment.new(post: @post)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

end
