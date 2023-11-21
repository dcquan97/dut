class Users::PageInfo::BaseForm < ApplicationForm
  attribute :about_home
  attribute :about_us
  attribute :status
  attribute :image_about
  attribute :image_contact
  attribute :link_fb
  attribute :link_youtube
  attribute :link_twitter
  attribute :contact_us
  attribute :sdt
  attribute :email
  attribute :address

  validates :about_home, :about_us, :status, :contact_us, :sdt, :email, :address,
            presence: true

end
