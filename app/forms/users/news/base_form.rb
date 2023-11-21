class Users::News::BaseForm < ApplicationForm
  attribute :title
  attribute :status
  attribute :category
  attribute :description
  attribute :thumbnail

  validates :title, :description, :status, :category,
            presence: true

end
