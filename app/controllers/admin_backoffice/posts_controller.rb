class AdminBackoffice::PostsController < AdminBackofficeController
  before_action :set_post, only: [:edit, :update, :destroy]
 
  def index
    @posts = Post.all
  end

 
  def show
  end

  
  def new
    @post = Post.new
  end

 
  def edit
  end

 
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @news.save
        format.html { redirect_to @post, notice: 'News was successfully created.' }
      else
        format.html { render :post }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

 
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to post_index_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private
  
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :references)
    end

end