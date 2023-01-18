module Admin
  class BaseController < ApplicationController
    before_action :check_admin

    private

    # def check_admin
    #   unless !current_user.nil? && current_user.admin?
    #     flash[:danger] = "Não autorizado."
    #     redirect_to root_path
    #   end
    # end

  end
end