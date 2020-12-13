
class WelcomeController < ApplicationController

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.order(created_at: :desc).page params[:page]
  end



end
