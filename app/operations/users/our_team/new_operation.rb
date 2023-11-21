class Users::OurTeam::NewOperation < Users::OurTeam::BaseOperation
  private

  def build_form
    @form = Users::OurTeam::CreateForm.new(permit_params)
  end
end
