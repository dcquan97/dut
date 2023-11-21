class Users::Profiles::PasswordForm < Users::Profiles::BaseForm
  attribute :user_id, :integer

  validates :current_password, :password, :password_confirmation, presence: true
  validates :password, confirmation: true, length: { in: Devise.password_length }

  validate :valid_current_password

  private

  def valid_current_password
    user = User.find(user_id)
    return if user.valid_password?(current_password)

    errors.add(:current_password, :incorrect)
  end
end
