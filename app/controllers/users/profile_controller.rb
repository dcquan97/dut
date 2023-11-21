class Users::ProfileController < UserApplicationController
  after_action :set_form_avatar

  def index
    operator = Users::Profiles::IndexOperation.new(params, current_user)
    operator.call
    @form_basic_info       = operator.form_basic_info
    @form_update_password  = operator.form_update_password
  end

  def update
    operator = Users::Profiles::UpdateOperation.new(params, current_user)
    operator.call

    @form_basic_info      = operator.form_basic_info
    @form_update_password = operator.form_update_password

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :index
    else
      # Keep user login after change password
      sign_in current_user, bypass: true if params[:update_password].present?

      redirect_back fallback_location: users_profile_path, notice: I18n.t('success.updated')
    end
  end

  private

  def set_form_avatar
    @form_avatar = Users::Avatars::UpdateForm.new
  end
end
