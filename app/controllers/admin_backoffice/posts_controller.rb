class AdminBackoffice::PostsController < AdminbackOfficeController
  before_action :set_post
 
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
        format.json { render :show, status: :created, location: @post}
      else
        format.html { render :post }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to post_index_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :references)
    end

end