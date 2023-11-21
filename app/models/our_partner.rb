class OurPartner < ApplicationRecord
  acts_as_paranoid
  mount_uploader :partner_image, ImageUploader

  scope :common_order, -> { order(id: :desc) }
end
