class Users::Banners::BaseOperation < ApplicationOperation
  attr_reader :form

  def call
    build_form
  end

  private

  def build_form
    @form = Users::Banners::BaseForm.new(permit_params)
  end

  def permit_params
    params.permit(:title, :status, :thumbnail)
  end
end
