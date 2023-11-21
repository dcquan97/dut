class Users::OurGuest::BaseForm < ApplicationForm
  attribute :title
  attribute :description
  attribute :status
  attribute :thumbnail
  attribute :category

  validates :title, :description,
            presence: true

end
