
class WelcomeController < ApplicationController

  def index
    @posts = @q.result.order(created_at: :desc).page params[:page]
  end



end
