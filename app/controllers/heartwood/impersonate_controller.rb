require_dependency "heartwood/application_controller"

module Heartwood
  class ImpersonateController < ApplicationController

    def impersonate
      sign_out current_user if user_signed_in?
      user = User.find(params[:id])
      sign_in user
      redirect_to request.referrer || main_app.root_path
    end

  end
end
