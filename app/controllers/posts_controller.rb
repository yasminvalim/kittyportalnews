# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all.order(created_at: :desc).page params[:page]
  end

  def show
    @comment = Comment.new(post: @post)
    @comments = @post.comments.order(created_at: :desc).page(params[:page])
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
