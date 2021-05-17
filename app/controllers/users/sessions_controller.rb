# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    flash[:notice] = "Hello #{current_user.first_name} #{current_user.last_name}"
  end
end
