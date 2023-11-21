class Users::PageInfo::BaseOperation < ApplicationOperation
  attr_reader :form

  def call
    build_form
  end

  private

  def build_form
    @form = Users::PageInfo::BaseForm.new(permit_params)
  end

  def permit_params
    params.permit(:about_home, :about_us, :status, :image_about, :image_contact, :link_fb, :link_youtube, :link_twitter, :contact_us, :sdt, :email, :address)
  end
end
