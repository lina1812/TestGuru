# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :flash_message, only: :create

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def flash_message
    return unless current_user

    flash[:notice] = "Hello #{current_user.first_name} #{current_user.last_name}"
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
