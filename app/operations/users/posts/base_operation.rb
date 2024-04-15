class Users::Posts::BaseOperation < ApplicationOperation
  attr_reader :form

  def call
    build_form
  end

  private

  def build_form
    @form = Users::Posts::BaseForm.new(permit_params)
  end

  def permit_params
    params.permit(:title, :description, :highlight, :category, :mini_description, :rating, :status, :price, :thumbnail)
  end
end
