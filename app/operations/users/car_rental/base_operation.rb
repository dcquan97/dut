class Users::CarRental::BaseOperation < ApplicationOperation
  attr_reader :form

  def call
    build_form
  end

  private

  def build_form
    @form = Users::CarRental::BaseForm.new(permit_params)
  end

  def permit_params
    params.permit(:title, :description, :category, :status, :thumbnail)
  end
end
