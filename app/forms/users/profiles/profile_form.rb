class Users::Profiles::ProfileForm < Users::Profiles::BaseForm
  validates :name, presence: true, length: { in: 6..30 }
end
