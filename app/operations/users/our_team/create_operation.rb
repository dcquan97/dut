class Users::OurTeam::CreateOperation < Users::OurTeam::BaseOperation
  attr_reader :our_team

  def call
    build_form
    validate { return true }
    create_our_team
  end

  private

  def build_form
    @form = Users::OurTeam::CreateForm.new(permit_params)
  end

  def create_our_team
    @our_team = OurTeam.create!(@form.attributes)
  end
end
