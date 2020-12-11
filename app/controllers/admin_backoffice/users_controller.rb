class AdminBackoffice::UsersController < AdminbackOfficeController
  before_action :set_user
  
  def index
    @users = User.all
  end

  def show
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @coment.update(coment_params)
        format.html { redirect_to @coment, notice: 'Coment was successfully updated.' }
        format.json { render :show, status: :ok, location: @coment }
      else
        format.html { render :edit }
        format.json { render json: @coment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coment.destroy
    respond_to do |format|
      format.html { redirect_to coments_url, notice: 'Coment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def coment_params
      params.fetch(:coment, {})
    end
end