class Users::AvatarsController < UserApplicationController
  def update
    operator = Users::Avatars::UpdateOperation.new(params, current_user)
    operator.call

    if operator.error?
      redirect_back fallback_location: users_profile_path, alert: operator.errors[:avatar]
    else
      redirect_back fallback_location: users_profile_path, notice: I18n.t('success.updated')
    end
  end
end
