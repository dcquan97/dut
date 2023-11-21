class Users::Profiles::UpdateOperation < Users::Profiles::BaseOperation
  def call
    build_form
    validate { return true }
    update_data
  end

  private

  def validate
    if act_update_password?
      return if form_update_password.valid?
      @errors = form_update_password.errors.messages
      yield
    else
      return if form_basic_info.valid?
      @errors = form_basic_info.errors.messages
      yield
    end
  end

  def update_data
    return current_actor.update!(form_update_password.attributes.slice(:password, :password_confirmation)) if act_update_password?
    current_actor.update!(form_basic_info.attributes.slice(:name))
  rescue => e
    @errors = e.message
  end

  def permit_params_basic_info
    return super if act_update_password?
    params.permit(:email, :name)
  end

  def act_update_password?
    params[:update_password].present?
  end
end
