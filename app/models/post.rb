class Post < ApplicationRecord
  acts_as_paranoid
  mount_uploader :thumbnail, ImageUploader

  def self.ransackable_associations(auth_object = nil)
    %w(title category status created_at)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(title category status created_at)
  end

  scope :common_order, -> { order(id: :desc) }
end
