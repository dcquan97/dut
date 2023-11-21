class Users::OurPartner::BaseOperation < ApplicationOperation
  attr_reader :form

  def call
    build_form
  end

  private

  def build_form
    @form = Users::OurPartner::BaseForm.new(permit_params)
  end

  def permit_params
    params.permit(:partner_image)
  end
end
