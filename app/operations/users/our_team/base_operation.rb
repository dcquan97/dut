class Users::OurTeam::BaseOperation < ApplicationOperation
  attr_reader :form

  def call
    build_form
  end

  private

  def build_form
    @form = Users::OurTeam::BaseForm.new(permit_params)
  end

  def permit_params
    params.permit(:title, :status, :name, :team_image)
  end
end
