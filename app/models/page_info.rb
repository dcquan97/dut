class PageInfo < ApplicationRecord
  acts_as_paranoid
  mount_uploader :image_about, ImageUploader
  mount_uploader :image_contact, ImageUploader

  def self.ransackable_associations(auth_object = nil)
    %w(status)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(status)
  end

  scope :common_order, -> { order(id: :desc) }
end
