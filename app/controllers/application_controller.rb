class ApplicationController < ActionController::Base
before_action :set_search
before_action :set_search_user

def set_search
  @q = Post.ransack(params[:q])
end

def set_search_user
  @quser = User.ransack(params[:q])
end

end
