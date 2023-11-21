class Users::Profiles::BaseOperation < ApplicationOperation
  attr_reader :form_basic_info, :form_update_password

  private

  def build_form
    @form_basic_info      = Users::Profiles::ProfileForm.new(permit_params_basic_info)
    @form_update_password = Users::Profiles::PasswordForm.new(permit_params_password)
  end

  def permit_params_basic_info
    params[:email]  = current_actor.email
    params[:name]   = current_actor.name
    params.permit(:email, :name)
  end

  def permit_params_password
    params[:user_id] = current_actor.id
    params.permit(:user_id, :current_password, :password, :password_confirmation)
  end
end
