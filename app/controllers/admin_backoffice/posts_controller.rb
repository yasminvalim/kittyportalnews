# frozen_string_literal: true

module AdminBackoffice
  class PostsController < AdminBackofficeController
    before_action :set_post, only: %i[edit update destroy]

    def index
      @posts = Post.where(user: current_user).order(created_at: :desc).page params[:page]
    end

    def new
      @post = Post.new
    end

    def edit; end

    def create
      @post = Post.new(post_params)
      @post.user = current_user

      respond_to do |format|
        if @post.save
          format.html { redirect_to post_path(@post), notice: 'News was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to admin_backoffice_post_path, notice: 'News was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to admin_backoffice_posts_path, notice: 'Post was successfully destroyed.' }
      end
    end

    private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :references)
    end
  end
end
