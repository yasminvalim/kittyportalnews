class PostsController < ActionController::Base
  before_action :set_post
 
  def index
    @posts = Post.all
  end

 
  def show
  end



  private
  
    def set_post
      @post = Post.find(params[:id])
    end

    
end
