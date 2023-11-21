class Users::OurTeam::BaseForm < ApplicationForm
  attribute :name
  attribute :title
  attribute :team_image
  attribute :status

  validates :name,:title, :status,
            presence: true

end
