AdminBackoffice::CommentsController < AdminBackofficeController
before_action :set_comment
 
  def index
    @comments = comment.all
  end

 
  def show
  end

  
  def new
    @comment = comment.new
  end

 
  def edit
  end

 
  def create
    @comment = comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @news.save
        format.html { redirect_to @comment, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @comment}
      else
        format.html { render :comment }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

 
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_index_url, notice: 'comment was successfully destroyed.' }
    end
  end

  private
  
    def set_comment
      @comment = comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :references)
    end

end