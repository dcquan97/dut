class Users::Tours::BaseForm < ApplicationForm
  attribute :title
  attribute :description
  attribute :category
  attribute :highlight
  attribute :status
  attribute :price
  attribute :thumbnail
  attribute :mini_description
  attribute :rating

  validates :title, :description, :category, :price, :highlight, :status,
            presence: true

end
