class Users::Banners::BaseForm < ApplicationForm
  attribute :title
  attribute :status
  attribute :thumbnail

  validates :title, :status,
            presence: true

end
