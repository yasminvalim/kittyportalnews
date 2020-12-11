class AdminCackofficeController < ApplicationController
  before_action :require_admin

  def require_admin
    redirect_to root_path, alert: 'Oops, you are not a admin!' unless current_user.is_admin
  end


end
