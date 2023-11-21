class Users::Avatars::UpdateForm < ApplicationForm
  attribute :avatar

  validates :avatar, presence: true
                    #  file_size: { in: 5.kilobytes..3.megabytes },
                    #  file_content_type: { allow: ['image/jpeg', 'image/png'] }
end
