# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @page_info = PageInfo.where(status: 1).first
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:user, keys: [:email, :password])
  end

  def after_sign_in_path_for(resource)
    users_profile_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
