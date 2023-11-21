class Users::OurGuest::BaseOperation < ApplicationOperation
  attr_reader :form

  def call
    build_form
  end

  private

  def build_form
    @form = Users::OurGuest::BaseForm.new(permit_params)
  end

  def permit_params
    params.permit(:title, :description, :category, :status, :thumbnail)
  end
end
