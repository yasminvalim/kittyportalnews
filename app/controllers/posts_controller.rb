class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new(post: @post)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

end
