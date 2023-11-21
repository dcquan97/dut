class Users::Avatars::UpdateOperation < ApplicationOperation
  attr_reader :form

  def call
    validate { return true }
    update_avatar
  end

  private

  attr_reader

  def validate
    @form = Users::Avatars::UpdateForm.new(avatar: params[:avatar])
    return if form.valid?

    @errors = form.error_message
    yield
  end

  def update_avatar
    current_actor.update!(avatar: form.avatar)
  end
end
