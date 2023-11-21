class OurTeam < ApplicationRecord
  acts_as_paranoid
  mount_uploader :team_image, ImageUploader

  def self.ransackable_associations(auth_object = nil)
    %w(name title)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(name title)
  end

  scope :common_order, -> { order(id: :desc) }
end
