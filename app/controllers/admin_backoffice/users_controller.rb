# frozen_string_literal: true

module AdminBackoffice
  class UsersController < AdminBackofficeController
    before_action :set_user, except: [:index]

    def index
      @users = @quser.result.where.not(id: current_user.id).order(:email).page params[:page]
    end

    def show; end

    def edit; end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admin_backoffice_users_path, notice: 'user was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_backoffice_users_path, notice: 'user was successfully destroyed.' }
      end
    end

    private

    def set_user
      @user = User.where.not(id: current_user.id).find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :is_admin)
    end
  end
end
