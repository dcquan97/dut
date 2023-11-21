class Users::CarRental::BaseForm < ApplicationForm
  attribute :title
  attribute :description
  attribute :status
  attribute :category
  attribute :thumbnail

  validates :title, :description, :category,
            presence: true

end
