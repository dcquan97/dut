class Users::Posts::BaseForm < ApplicationForm
  attribute :title
  attribute :description
  attribute :category
  attribute :highlight
  attribute :status
  attribute :thumbnail
  attribute :mini_description

  validates :title, :description, :category, :highlight, :status,
            presence: true

end
