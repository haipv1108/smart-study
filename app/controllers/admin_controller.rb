class AdminController < ApplicationController
  before_action :set_admin

  private
    def set_admin
      unless current_user.admin?
        flash[:danger] = 'This feature need to admin permission! Please logout current account to login admin account!'
        redirect_to root_path
      end
    end
end
